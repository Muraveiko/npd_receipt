
import 'dart:convert';

import 'package:npd/RawbtApi/src/PrintJob.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RawbtApi{
  RawbtApi._internal();
  static final RawbtApi _instance = RawbtApi._internal();
  factory RawbtApi() {
    assert(
    channel != null,
    'Must call RawbtApi.init() before using settings!');
    return _instance;
  }
  static WebSocketChannel? channel;

  static Future<void> init() async {
    channel = WebSocketChannel.connect(
      Uri.parse('ws://localhost:40213'),
    );
  }

  static void printJob(PrintJob job) {
    channel!.sink.add(jsonEncode(job));
  }


}