import 'package:flutter/material.dart';
import 'package:npd/dao/database.dart';
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
    return StreamBuilder(
          stream:  NpdDao.modelReceipt?.getReceipt(widget.receiptId, widget.inn),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Scaffold(
                  appBar: AppBar(
                    title: Text(widget.receiptId),
                  ),
                  body:Text("Error ${snapshot.error}")
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                  appBar: AppBar(
                    title: Text(widget.receiptId),
                  ),
                  body:const CircularProgressIndicator()
              );
            }
            Receipt receipt = snapshot.data;
            return Scaffold(
                body: CustomScrollView(
                slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 160.0,
                      flexibleSpace: FlexibleSpaceBar(
                          title: Text(receipt.receiptId!),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                      height: 20,
                      child: Center(
                          child: Text('Scroll to see the SliverAppBar in effect.'),
                        ),
                      ),
                    ),
                ]
                )
            );
          },

    );
  }


}
