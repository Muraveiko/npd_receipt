import 'package:flutter/material.dart';
import 'package:npd/dao/database.dart';
import 'generated/l10n.dart';
import 'model/inn_info.dart';


class InnScreen extends StatefulWidget {
  const InnScreen({Key? key}) : super(key: key);

  @override
  InnScreenState createState() => InnScreenState();

}

class InnScreenState extends State<InnScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S
              .of(context)
              .taxomy_inn),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                NpdDao.modelInn?.deleteAllInnInfo();
                setState(() {}); // refresh
              },
            ),
          ],
        ),
        body: StreamBuilder(
              stream: NpdDao.modelInn?.getAllInnInfo(),
               builder: (BuildContext context, AsyncSnapshot<List<InnInfo>> snapshot) {
                 var models = snapshot.data ?? <InnInfo>[];
                  return ListView.builder(
                    itemCount: models.length,
                    itemBuilder: (context, index) => InnInfoListItem(models[index]),
                  );
               }),
    );
  }
}

class InnInfoListItem extends StatelessWidget{
  final InnInfo model;
  InnInfoListItem(this.model) : super(key: Key(model.inn??""));

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key:Key(model.inn??""),
      onDismissed: (direction){
        NpdDao.modelInn?.deleteInnInfo(model);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Запись удалена')
            ));
      },
      child:
          Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
            child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text(model.inn!,style: const TextStyle(color: Colors.green,fontSize: 16),),
                         Text(model.name??"Не введено"),
                  ],
              ),
                )
          ),
    );
  }
}