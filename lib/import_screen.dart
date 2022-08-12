import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:npd/view_screen.dart';

import 'api_npd.dart';
import 'dao/database.dart';
import 'model/receipt.dart';
import 'model/receipt_id.dart';

class ImportScreen extends StatefulWidget {
  final String importUrl;

  const ImportScreen(this.importUrl, {super.key});

  @override
  ImportScreenState createState() => ImportScreenState();

}

class ImportScreenState extends State<ImportScreen> {

  Receipt? receipt;
  String? error;

  @override
  void initState() {
    super.initState();

    importReceipt(widget.importUrl).then((value) => setState((){
      receipt = value;
    })).onError((err, _) => setState((){
      error = err.toString();
    }));
  }

  @override
  Widget build(BuildContext context) {
    if(receipt != null){
      return ViewScreen.withClose(receipt!.inn!,receipt!.receiptId!);
    }

    return  Scaffold(
        appBar: AppBar(
            title: const Text('Импорт чека'),
            leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => _closeApp(),
            ),
        ),
        body : Center(child:
                  error != null ?
                  Text(error!) :
                  SvgPicture.asset('assets/images/hourglass.svg'),
          ),
    );
  }


  Future<Receipt?> importReceipt(String url) async {

    final error = ReceiptId.validateUrl(url);
    if(error != null) {
      throw Exception(error);
    }
    var receipt = await NpdAPI.getFromApi(url);
    await NpdDao.modelReceipt?.insertReceipt(receipt);
    return receipt;
  }


  void _closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }
}