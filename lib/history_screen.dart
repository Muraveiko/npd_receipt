import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            child: const Icon(Icons.add_shopping_cart_rounded),
            onPressed: () {
                showDialog(context: context,
                    barrierDismissible: false,
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
                                       await NpdDao.modelReceipt?.insertReceipt(
                                           receipt);
                                       _textFieldController.text = "";
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
  final Receipt item;
  final Receipt? model;
  ReceiptListItem(this.item) : model = Receipt.fromStringJSON(item.sourceJson!), super(key: Key(item.receiptId??""));

  @override
  Widget build(BuildContext context) {
    final formatPrice = NumberFormat("##,###.00", "ru_RU");
    final formatDate = DateFormat('d MMM yyyy HH:mm:ss, EEE', "ru_RU");
    return
      Dismissible(
          key:Key(item.receiptId??""),
          direction: DismissDirection.endToStart,
          onDismissed: (direction){
            NpdDao.modelReceipt?.deleteReceipt(item);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Запись удалена')
                ));
          },
          background:
            Padding(padding: const EdgeInsets.all(8.0),
              child:
               Container(
                 alignment: AlignmentDirectional.centerEnd,
                 color: Theme.of(context).colorScheme.secondaryContainer,
                 child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                     child: Icon(Icons.delete,
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                 ),
               ),
            ),
            child:
             Padding(padding: const EdgeInsets.all(8.0),
                child:InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/view/${item.inn}/${item.receiptId}");
                    },
                    child:Card(
                      margin: const EdgeInsets.all(0.0),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side:  BorderSide(color: Theme.of(context).dividerColor,width: 1),
                          borderRadius: const BorderRadius.all(Radius.circular(2))
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    Text(formatDate.format(model!.operationTime!),
                                         style: const TextStyle(color: Colors.black54,fontSize: 13)),
                                    Text(formatPrice.format(model?.totalAmount),
                                        style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 18)),
                              ]),
                              Padding(padding: const EdgeInsets.fromLTRB(0,8.0,0,8.0),
                                  child:
                                    Text(model!.services![0].name!)
                              ),
                              Text(model!.receiptId!,style: const TextStyle(color: Colors.black54,fontSize: 13),),
                           ])
                      ),
                    )
                )
          )
      );


  }
}
