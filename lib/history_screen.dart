import 'package:flutter/material.dart';
import 'package:npd/model/receipt.dart';
import 'package:npd/npd_drawer.dart';
import 'api_npd.dart';
import 'dao/database.dart';
import 'generated/l10n.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

import 'model/receipt_id.dart';


class HistoryScreen extends StatefulWidget {

  const HistoryScreen({Key? key}) : super(key: key);

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  final _textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).menu_history),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                NpdDao.modelReceipt?.deleteAllReceipt();
                setState(() {}); // refresh
              },
            ),
          ],
        ),
        drawer: const NpdDrawer(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            child: const Icon(Icons.add_shopping_cart_rounded),
            onPressed: () {
                showDialog(context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Ссылка на чек'),
                      content: Form(key: _formKey,child:
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          TextFormField(
                            controller: _textFieldController,
                            minLines: 2,
                            maxLines: 2,
                            decoration: const InputDecoration(
                                hintText: "https://lknpd.nalog.ru/api/v1/receipt/ИНН/ИД/print",
                                hintStyle: TextStyle(fontSize: 12),
                            ),
                            validator: (value)=>ReceiptId.validateUrl(value),
                           ),
                           Padding(padding: const EdgeInsets.fromLTRB(0, 32, 0, 0) ,child:
                           Row(mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                             TextButton(
                               child: const Text('Отмена'),
                               onPressed: () => Navigator.pop(context),
                             ),
                             ElevatedButton(
                               child: const Text('Импорт'),
                               onPressed: () {
                                 if (_formKey.currentState!.validate()) {

                                   () async {
                                     try {
                                       var receipt = await NpdAPI.getFromApi(
                                           _textFieldController.text);
                                       NpdDao.modelReceipt?.insertReceipt(
                                           receipt);
                                     }catch(error){
                                       ScaffoldMessenger.of(context).showSnackBar(
                                           SnackBar(content: Text(error.toString()))
                                           );
                                     }
                                   }.call();

                                   Navigator.pop(context);
                                 }

                               },
                             ),
                           ],)
                           ),
                          ]
                        )
                      ),
                    ),
                );
          }),
        body: DoubleBackToCloseApp(
            snackBar: SnackBar(
              content: Text(S.of(context).tap_twice),
            ),
            child: StreamBuilder(
                stream: NpdDao.modelReceipt?.getAllReceipt(),
                builder: (BuildContext context, AsyncSnapshot<List<Receipt>> snapshot) {
                  var models = snapshot.data ?? <Receipt>[];
                  return ListView.builder(
                    itemCount: models.length,
                    itemBuilder: (context, index) => ReceiptListItem(models[index]),
                  );
                }),
        )
    );
  }
}
class ReceiptListItem extends StatelessWidget{
  final Receipt model;
  ReceiptListItem(this.model) : super(key: Key(model.receiptId??""));

  @override
  Widget build(BuildContext context) {

    return
      Dismissible(
          key:Key(model.receiptId??""),
          direction: DismissDirection.endToStart,
          onDismissed: (direction){
            NpdDao.modelReceipt?.deleteReceipt(model);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Запись удалена')
                ));
          },
          background:
            Padding(padding: const EdgeInsets.all(8.0),
              child:
               Container(
                 alignment: AlignmentDirectional.centerEnd,
                 color: Colors.orange,
                 child: const Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                     child: Icon(Icons.delete,
                          color: Colors.white,
                      ),
                 ),
               ),
            ),
            child:
             Padding(padding: const EdgeInsets.all(8.0),
                child:InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/view/${model.inn}/${model.receiptId}");
                    },
                    child:Card(
                      margin: const EdgeInsets.all(0.0),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          side:  BorderSide(color: Colors.black12,width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    Text('01.02.2021 14:53:00 (+03:00)',style: TextStyle(color: Colors.black54,fontSize: 13)),
                                    Text('123 500.00',style: TextStyle(color: Colors.orange,fontSize: 18)),
                              ]),
                              Padding(padding: EdgeInsets.fromLTRB(0,8.0,0,8.0),
                                  child:
                                    Text('Название услуги')
                              ),
                              Text(model.receiptId!,style: TextStyle(color: Colors.black54,fontSize: 13),),
                           ])
                      ),
                    )
                )
          )
      );


  }
}
