import 'package:flutter/material.dart';
import 'package:npd/dao/database.dart';
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
        body: StreamBuilder(
          stream:  NpdDao.modelReceipt?.getReceipt(widget.receiptId, widget.inn),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Text("Error ${snapshot.error}");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            Receipt receipt = snapshot.data;
            return Text(receipt.receiptId!);
          },),


    );
  }


}
