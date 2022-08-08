import 'package:flutter/material.dart';
import 'package:npd/dao/database.dart';
import 'package:npd/model/receipt_id.dart';
import 'model/receipt.dart';


class ViewScreen extends StatefulWidget {
  final double expandHeight = 240.0;
  final String inn;
  final String receiptId;
  final ReceiptId rId;

  ViewScreen(this.inn,this.receiptId,{super.key}): rId = ReceiptId(receiptId: receiptId,inn: inn);

  @override
  ViewScreenState createState() => ViewScreenState();
}

class ViewScreenState extends State<ViewScreen> {
  String fio = "------ ---- -----";
  ScrollController? _scrollController;
  final Key scKey = const Key("scroll_body");

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController?.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Stack(
        children: <Widget>[CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
              StreamBuilder(key: scKey,
               stream:  NpdDao.modelReceipt?.getReceipt(widget.receiptId, widget.inn),
               builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                 StatelessWidget title;
                 if (snapshot.connectionState == ConnectionState.waiting) {
                    title = const Text("Wait");
                 }else if (snapshot.hasError) {
                     title = Text("Error ${snapshot.error}");
                 }else {
                     title = ViewHead(snapshot.data,fio);
                 }
                 final head = SliverAppBar(
                   pinned: true,
                   expandedHeight: widget.expandHeight,
                   flexibleSpace: FlexibleSpaceBar(
                       centerTitle: false,
                       title: title,
                   ),
                 );
                 return head;
                }),
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

  Widget _buildFab() {
    double top = widget.expandHeight - 28.0; //default top margin,
    if (_scrollController!.hasClients) {
      top -= _scrollController!.offset;
    }
    if(top<24){
      top = 24;
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


class ViewHead extends StatelessWidget {
  final Receipt receipt;
  final String fio;

  const ViewHead(this.receipt,this.fio, {super.key});

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