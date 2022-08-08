import 'package:flutter/material.dart';
import 'package:npd/dao/database.dart';
import 'package:npd/model/inn_info.dart';
import 'package:npd/model/receipt_id.dart';
import 'model/receipt.dart';


class ViewScreen extends StatefulWidget {
  final double expandHeight = 240.0;
  final ReceiptId rId;

  ViewScreen(String inn,String receiptId,{super.key}): rId = ReceiptId(receiptId: receiptId,inn: inn);

  @override
  ViewScreenState createState() => ViewScreenState();
}

class ViewScreenState extends State<ViewScreen> {

  final _textFieldController = TextEditingController();
  final _scrollController = ScrollController();

  Receipt? receipt;
  InnInfo? innInfo;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() => setState(() {}));


    NpdDao.modelInn!.getInnInfo(widget.rId.inn!).listen((info) {
      setState(() {
        innInfo = info;
        _textFieldController.text = innInfo?.name ?? '';
      });
    });

    NpdDao.modelReceipt!.getReceipt(widget.rId).listen((receipt) {
      setState(() {
        this.receipt = receipt;
      });

    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Stack(
        children: <Widget>[CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
              _buildHead(),
              _buildForm(),
              const SliverToBoxAdapter(child: SizedBox(height: 32,)),

              SliverToBoxAdapter(
                child: Image.network(widget.rId.imageUrl(),
                alignment: Alignment.topCenter,
              )
           ),
           ]
      ),
     _buildFab(),
    ]
    ));
  }

  Widget _buildHead(){

          StatelessWidget title;
          if (receipt == null) {
            title = const Text("Wait");
          }else {
            title = MultiLinesTitle(receipt!,innInfo?.name ?? '');
          }
          final head = SliverAppBar(
            pinned: true,
            expandedHeight: widget.expandHeight,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: title,
            ),
            actions: _buildActions(),
          );
          return head;

  }

  List<Widget> _buildActions(){
    var list = <Widget>[];

    double top = widget.expandHeight - 28.0; //default top margin,
    if (_scrollController.hasClients) {
      top -= _scrollController.offset;
    }

    if(top<widget.expandHeight/3) {
      list.add(IconButton(
        icon: const Icon(Icons.print),
        onPressed: () =>
        {
          debugPrint("Click on upload button")
        },
      ));
    }

    list.add(PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: Text("Печать картинки чека от АПИ"),

        ),
        const PopupMenuItem(
          value: 2,
          child: Text("ИНН ФИО"),
        ),
      ],
    ));

    return list;
  }

  Widget _buildForm(){
    return SliverToBoxAdapter(child:Card(
        margin: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 16.0),
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child:
                      Text('ИНН ${widget.rId.inn!}',style: const TextStyle(color: Colors.black,fontSize: 16),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                    controller: _textFieldController,
                    decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'ФИО',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   ElevatedButton(
                           style: ButtonStyle(
                             backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                           ),
                           child: const Text('Сохранить'),
                            onPressed: () {
                              () async {

                                NpdDao.modelInn?.insertInnInfo(InnInfo(
                                    inn: widget.rId.inn!,
                                    name: _textFieldController.text));

                              }.call();
                     }),
                ]),
              ),
            ],
          ),
        )
    ),
    );
  }

  Widget _buildFab() {
    double top = widget.expandHeight - 28.0; //default top margin,
    if (_scrollController.hasClients) {
      top -= _scrollController.offset;
    }
    if(top<widget.expandHeight/3){
      return const SizedBox(height: 0, width: 0,);
    }
    return Positioned(
      top: top,
      right: 16.0,
      child: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.print),
      ),
    );
  }
}


class MultiLinesTitle extends StatelessWidget {
  final Receipt receipt;
  final String fio;

  const MultiLinesTitle(this.receipt,this.fio, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Text(receipt.receiptId!),
          ),
          const Positioned(
            bottom: 24,
            child: Text('Чек №',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal)),
          ),
          Positioned(
            bottom: 56,
            child: Text(fio,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),),
          ),
          Positioned(
            bottom: 70,
            child: Text('ИНН ${receipt.inn!}',
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.normal)),
          ),
        ]);
  }
}