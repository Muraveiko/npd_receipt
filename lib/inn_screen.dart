import 'dart:math';

import 'package:flutter/material.dart';
import 'package:npd/dao/database.dart';
import 'generated/l10n.dart';
import 'model/inn_info.dart';

const _chars = '1234567890AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
Random _rnd = Random();

String getRandomString(int length, {int fromMax = _chars.length}) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(fromMax))));

class InnScreen extends StatefulWidget {

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
              icon: const Icon(Icons.plus_one),
              onPressed: () {
                final innInfo = InnInfo(inn:getRandomString(12,fromMax: 10),name:getRandomString(16));
                NpdDao.modelInn?.insertInnInfo(innInfo);
              },
            ),
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