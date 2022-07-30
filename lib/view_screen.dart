import 'package:flutter/material.dart';
import 'generated/l10n.dart';
import 'model/receipt.dart';


class ViewScreen extends StatefulWidget {
  final String inn;
  final String receiptId;
  const ViewScreen(this.inn,this.receiptId,{super.key});

  @override
  ViewScreenState createState() => ViewScreenState();
}

class ViewScreenState extends State<ViewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).menu_settings),
        ),
        body:  Text('TODO VIEW RECEIPT ${widget.receiptId}')

    );
  }
}
