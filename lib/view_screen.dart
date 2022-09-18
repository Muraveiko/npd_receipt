
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_svg/svg.dart';
import 'package:npd/RawbtApi/src/Constants.dart';
import 'package:npd/RawbtApi/src/PrintJob.dart';
import 'package:npd/RawbtApi/src/RawbtApi.dart';
import 'package:npd/dao/database.dart';
import 'package:npd/model/inn_info.dart';
import 'package:npd/model/receipt_id.dart';
import 'RawbtApi/src/attributes/AttributesQRcode.dart';
import 'RawbtApi/src/attributes/AttributesString.dart';
import 'model/description_row.dart';
import 'model/receipt.dart';
import 'model/receipt_services.dart';

class ViewScreen extends StatefulWidget {
  final double expandHeight = 240.0;
  final ReceiptId rId;
  final bool isForceClose;

  ViewScreen(String inn, String receiptId, {super.key})
      : isForceClose = false,
        rId = ReceiptId(receiptId: receiptId, inn: inn);

  ViewScreen.withClose(String inn, String receiptId, {super.key})
      : isForceClose = true,
        rId = ReceiptId(receiptId: receiptId, inn: inn);

  @override
  ViewScreenState createState() => ViewScreenState();
}

class ViewScreenState extends State<ViewScreen> {
  final _textFieldController = TextEditingController();
  final _scrollController = ScrollController();

  Receipt? receipt;
  InnInfo? innInfo;

  bool isShowForm = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() => setState(() {}));

    NpdDao.modelInn!.getInnInfo(widget.rId.inn!).listen((info) {
      setState(() {
        innInfo = info;
        final fio = innInfo?.name ?? '';
        _textFieldController.text = fio;
        isShowForm = (fio == '');
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
    return Scaffold(
        body: Stack(children: <Widget>[
      CustomScrollView(controller: _scrollController, slivers: <Widget>[
        _buildHead(),
        _buildForm(),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 32,
        )),
        SliverToBoxAdapter(
            child: Image.network(
          widget.rId.imageUrl(),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
                child: SvgPicture.asset('assets/images/hourglass.svg'));
          },
          alignment: Alignment.topCenter,
        )),
      ]),
      _buildFab(),
    ]));
  }

  Widget _buildHead() {
    StatelessWidget title;
    if (receipt == null) {
      title = const Text("Wait");
    } else {
      title = MultiLinesTitle(receipt!, innInfo?.name ?? '');
    }

    if (widget.isForceClose) {
      return SliverAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _closeApp(),
        ),
        pinned: true,
        expandedHeight: widget.expandHeight,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          title: title,
        ),
        actions: _buildActions(),
      );
    } else {
      return SliverAppBar(
        pinned: true,
        expandedHeight: widget.expandHeight,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          title: title,
        ),
        actions: _buildActions(),
      );
    }
  }

  List<Widget> _buildActions() {
    var list = <Widget>[];

    double top = widget.expandHeight - 28.0; //default top margin,
    if (_scrollController.hasClients) {
      top -= _scrollController.offset;
    }

    if (top < widget.expandHeight / 3) {
      list.add(IconButton(
        icon: const Icon(Icons.print),
        onPressed: () => {printCheck()},
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
      onSelected: (value) {
        if (value == 1) {
          printImage();
        } else if (value == 2) {
          setState(() {
            isShowForm = true;
          });
        }
      },
    ));

    return list;
  }

  Widget _buildForm() {
    if (!isShowForm) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
    return SliverToBoxAdapter(
      child: Card(
          margin: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(
                    'ИНН ${widget.rId.inn!}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: TextFormField(
                    controller: _textFieldController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'ФИО',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).colorScheme.secondary),
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
          )),
    );
  }

  Widget _buildFab() {
    double top = widget.expandHeight - 28.0; //default top margin,
    if (_scrollController.hasClients) {
      top -= _scrollController.offset;
    }
    if (top < widget.expandHeight / 3) {
      return const SizedBox.shrink();
    }
    return Positioned(
      top: top,
      right: 16.0,
      child: FloatingActionButton(
        onPressed: () => {printCheck()},
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.print),
      ),
    );
  }

  void _closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }

  void printCheck() async {
    if (innInfo == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Введите ФИО")));
      return;
    }
    Receipt receipt = Receipt.fromStringJSON(this.receipt!.sourceJson!);

    // форматирование данных чека
    final formatPrice = NumberFormat.currency(locale:"ru_RU");
    final formatDate = DateFormat('d.MM.yyyy', "ru_RU");
    final formatTime = DateFormat('HH:mm:ss', "ru_RU");

    String ch = Settings.getValue("delimiterChar", defaultValue: "-")!;
    String ch2 =
        Settings.getValue("delimiterAmountChar", defaultValue: "=")!;

    // задание на печать
    PrintJob job = PrintJob();
    job.idJob = receipt.receiptId;

    // настройки
    job.copies = Settings.getValue("copies", defaultValue: 1)!;

    // формирование образа чека

    bool innInHead = Settings.getValue("innInHead", defaultValue: false)!;

    // чек номер
    bool height2Number =
        Settings.getValue("height2Number", defaultValue: true)!;

    AttributesString attrStrTitle = AttributesString(
        alignment: Constant.ALIGNMENT_CENTER,
        doubleHeight: height2Number,
        bold: true);

    job.printlnWithAttr("Чек №${receipt.receiptId!}", attrStrTitle);
    if (height2Number) {
      job.ln();
    }

    // строка даты
    job.leftRightText(formatDate.format(receipt.operationTime!),
        formatTime.format(receipt.operationTime!));

    if (ch == ' ') {
      job.ln();
    } else {
      job.drawLine(ch);
    }

    // продавец
    job.println(innInfo!.name!);

    // профессия
    bool prof = Settings.getValue("profession", defaultValue: true)!;
    bool smallFontForProf =
        Settings.getValue("small_font_for_prof", defaultValue: false)!;
    if (receipt.profession != null && receipt.profession!.isEmpty && prof) {
      if (smallFontForProf) {
        job.printlnWithAttr(receipt.profession!, const AttributesString(printerFont: Constant.FONT_B));
      } else {
        job.println(receipt.profession!);
      }
    }

    // description
    if(receipt.description!.isNotEmpty){
      List<String> description = [];
      for(DescriptionRow row in receipt.description!) {
        if(row.part!.isNotEmpty) {
          description.add(row.part!);
        }
      }
      if(description.isNotEmpty){
        if (ch == ' ') {
          job.ln();
        } else {
          job.drawLine(ch);
        }
        for (String row in description) {
          job.println(row);
        }
        if(innInHead){
          if (ch == ' ') {
            job.ln();
          } else {
            job.drawLine(ch);
          }
        }
      }

    }

    // реквизиты самозанятого
    bool phone = Settings.getValue("phone", defaultValue: true)!;
    bool email = Settings.getValue("email", defaultValue: true)!;

    if (innInHead) {
      job.println("ИНН: ${innInfo!.inn!}");
      job.println("Режим НО: НПД");

      // телефон и емайл
      if (phone && receipt.phone != null && receipt.phone!.isNotEmpty) {
        job.println("Номер телефона: ${receipt.phone!}");
      }
      if (email && receipt.email != null && receipt.email!.isNotEmpty) {
        job.println("Email: ${receipt.email!}");
      }
    }
    if (ch == ' ') {
      job.ln();
    } else {
      job.drawLine(ch);
    }

    // шапка товаров или услуг
    job.leftRightTextWithFormat(
        "Наименование", "Сумма", const AttributesString(bold: true));

    // как выводить
    String howPrintService = Settings.getValue("howPrintService",defaultValue: "auto")!;

    // цикл по позициям чека
    int n = 1;
    for (Service s in receipt.services!){
      bool howPrint = s.quantity! > 1;
      if(howPrintService == "none"){
        howPrint=false;
      }else if(howPrintService == "always"){
        howPrint = true;
      }
      if(howPrint){
        job.println("$n.${s.name}");
        job.leftRightText("${formatPrice.format(s.amount)} X ${s.quantity}", formatPrice.format(s.amount!*s.quantity!));
      }else {
        job.leftRightText("$n.${s.name}", formatPrice.format(s.amount));
      }
      n++;
    }

    // Итого
    job.drawLine(ch2);
    job.leftRightTextWithFormat(
        "Итого:",
        formatPrice.format(receipt.totalAmount),
        const AttributesString(bold: true));

    // данные продавца
    if(!innInHead) {
      if (ch == ' ') {
        job.ln();
      } else {
        job.drawLine(ch);
      }

      job.leftRightText("Режим НО","НПД");
      job.leftRightText("ИНН",innInfo!.inn!);

      // телефон и емайл
      if (phone && receipt.phone != null && receipt.phone!.isNotEmpty) {
        job.leftRightText("Номер телефона",receipt.phone!);
      }
      if (email && receipt.email != null && receipt.email!.isNotEmpty) {
        job.leftRightText("Email",receipt.email!);
      }

    }

    // платежный партнер
    if(receipt.partnerInn != null) {
      if(ch==' '){job.ln();}else{job.drawLine(ch);}
      job.leftRightText("Чек сформировал", receipt.partnerDisplayName!);
      job.leftRightText("ИНН", receipt.partnerInn!);
    }

    // покупатель
    if(receipt.clientInn != null) {
      if(ch==' '){job.ln();}else{job.drawLine(ch);}
      AttributesString attrStrSection = const AttributesString(bold: true);
      job.printlnWithAttr("Покупатель:", attrStrSection);
      job.leftRightText("ИНН", receipt.clientInn!);

      bool isPrintName = Settings.getValue("printClientName",defaultValue: false)!;
      if(isPrintName) {
        job.println(receipt.clientDisplayName!);
      }
    }

    job.ln();
    // qr

    AttributesQRcode attributesQRcode = AttributesQRcode(
      alignment: Constant.ALIGNMENT_CENTER,
      multiply: Settings.getValue<double>("qr_size",defaultValue: 6)!.toInt()
    );
    job.qrcode(widget.rId.imageUrl(),attributesQRcode);

    // вызов апи
    RawbtApi.printJob(job);
  }

  void printImage() async {



    // задание
    var job = PrintJob();
    job.idJob = receipt!.receiptId;

    // настройки
    job.copies = Settings.getValue("copies", defaultValue: 1)!;

    // картинка
    await job.imageFromNetwork(widget.rId.imageUrl());

    // вызов апи
    RawbtApi.printJob(job);


  }



}

class MultiLinesTitle extends StatelessWidget {
  final Receipt receipt;
  final String fio;

  const MultiLinesTitle(this.receipt, this.fio, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
        child: Text(
          fio,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
        ),
      ),
      Positioned(
        bottom: 70,
        child: Text('ИНН ${receipt.inn!}',
            style:
                const TextStyle(fontSize: 10, fontWeight: FontWeight.normal)),
      ),
    ]);
  }
}
