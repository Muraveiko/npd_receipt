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
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        NpdDao.modelInn?.deleteInnInfo(model);
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
          Padding(padding: const EdgeInsets.all(8.0),child: Card(
              margin: const EdgeInsets.all(0.0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side:  BorderSide(color: Theme.of(context).dividerColor,width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(2))
              ),
              child:
                    Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         const SizedBox(width: double.infinity,), // распорка для ширины
                         Padding(padding: const EdgeInsets.fromLTRB(12.0,8.0,12.0,8.0), child:
                            Text(model.inn!,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16, fontWeight: FontWeight.bold),)),
                         Padding(padding: const EdgeInsets.fromLTRB(12.0,8.0,12.0,8.0), child:
                            Text(model.name??"Не введено"),),
                       ],
                   ),

          ), ),
    );
  }
}