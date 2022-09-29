
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:npd/RawbtApi/src/PrintJob.dart';
import 'package:npd/RawbtApi/src/RawbtResponse.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RawbtApi{
  RawbtApi._internal();
  static RawbtApi? _instance;
  
  factory RawbtApi() {
    _instance ??= RawbtApi._internal();
    return _instance!;
  }
  
  final _progressController = StreamController<int>.broadcast();
  final _isPrint = StreamController<bool>.broadcast();

  Stream<int> get progressStream => _progressController.stream;
  Stream<bool> get isPrint => _isPrint.stream;

  WebSocketChannel? _channel;
  bool isConnected = false;
  bool isNoRawBT = false;

  void _onDisconnected() {
    isConnected = false;
    _isPrint.sink.add(false);
    print("Disconnect!!!!!!!!");
  }
  int tryCnt = 0;
  Future<void> connect() async {
     if(tryCnt < 3) {
       _channel = null;
       WebSocket.connect('ws://localhost:40213').then((ws) {
         _channel = IOWebSocketChannel(ws);
         _channel?.stream.listen((dynamic message) {
             print(message);
             final response = RawbtResponse.fromJson(jsonDecode(message));
             if(response.responseType == RawbtResponse.RESPONSE_PROGRESS) {
               _progressController.sink.add((100 * response.progress!).round());
             }else{
               _isPrint.sink.add(false);
             }
           },
           onDone: () {
             _onDisconnected();
           },
           onError: (dynamic error) {
             print("ws error: $error");
             _onDisconnected();
           },
         );
         isConnected = true;
         isNoRawBT = false;
       }).catchError((e) {
         tryCnt ++;
         print('error $e');
         sleep(const Duration(seconds: 5));
         connect();
       });
     }else{
       isNoRawBT = true;
     }
  }

  void printJob(PrintJob job) async {
    if(isNoRawBT){
      throw Exception("RawBT not run");
    }
    if(!isConnected){
      await connect();
    }
    print("rawbt print");
    _isPrint.sink.add(true);
    _channel?.sink.add(jsonEncode(job));
  }
  
}