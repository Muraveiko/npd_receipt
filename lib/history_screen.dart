import 'package:flutter/material.dart';
import 'package:npd/model/receipt.dart';
import 'package:npd/npd_drawer.dart';
import 'dao/database.dart';
import 'generated/l10n.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';


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
                            minLines: 2,
                            maxLines: 2,
                            controller: _textFieldController,
                            decoration: const InputDecoration(
                                hintText: "https://lknpd.nalog.ru/api/v1/receipt/ИНН/ИД/print",
                                hintStyle: TextStyle(fontSize: 12),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
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
                                   // If the form is valid, display a snackbar. In the real world,
                                   // you'd often call a server or save the information in a database.
                                   ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(content: Text(_textFieldController.text)),
                                   );
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
    return Dismissible(
      key:Key(model.inn??""),
      onDismissed: (direction){
        NpdDao.modelReceipt?.deleteReceipt(model);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Запись удалена')
            ));
      },
      child:
      const Card(
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
          child:
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('TODO'),
          )
      ),
    );
  }
}
