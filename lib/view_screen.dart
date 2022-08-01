import 'package:flutter/material.dart';
import 'package:npd/dao/database.dart';
import 'package:npd/model/receipt_id.dart';
import 'model/receipt.dart';


class ViewScreen extends StatefulWidget {
  final String inn;
  final String receiptId;
  final ReceiptId rId;
  ViewScreen(this.inn,this.receiptId,{super.key}): rId = ReceiptId(receiptId: receiptId,inn: inn);

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
                      pinned: true,
                      expandedHeight: 240.0,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: false,
                          title: Stack(
                              children:[
                                Positioned(
                                bottom: 0,
                                  child:Text(receipt.receiptId!),
                                ),
                                const Positioned(
                                  bottom: 24,
                                  child:Text('Чек №',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal)),
                                ),
                                Positioned(
                                  bottom: 56,
                                  child:Text('Имерек Имя Отчество',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
                                ),
                                Positioned(
                                  bottom: 70 ,
                                  child:Text('ИНН ${receipt.inn!}',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal)),
                                ),
                        ]),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                      height: 48,
                      ),
                    ),
                    SliverToBoxAdapter(
                          child: Image.network(widget.rId.imageUrl(),
                            alignment: Alignment.topCenter,
                          )

                    ),


                ]
                )
            );
          },

    );
  }
}

Widget listCardWidget({required String text1, required text2}) {
  return Card(
    margin: const EdgeInsets.all(8.0),
    elevation: 5.0,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
              fit: FlexFit.tight,
              child: Text(
                text1,
                style: const TextStyle(fontSize: 18),
              )),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Text(
              text2,
              style: const TextStyle(
                  fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}
