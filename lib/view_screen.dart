import 'package:flutter/material.dart';
import 'generated/l10n.dart';


class ViewScreen extends StatelessWidget {
  String? inn;
  String? receiptId;
  ViewScreen({this.inn,this.receiptId,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).menu_settings),
        ),
        body:  Text('TODO VIEW RECEIPT $receiptId')

    );
  }
}
