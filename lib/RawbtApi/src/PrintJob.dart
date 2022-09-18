
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:npd/RawbtApi/src/Constants.dart';
import 'package:npd/RawbtApi/src/command/CommandImageInBase64.dart';

import 'attributes/AttributesBarcode.dart';
import 'attributes/AttributesQRcode.dart';
import 'command/CommandBarcode.dart';
import 'command/CommandBytesInBase64.dart';
import 'command/CommandCut.dart';
import 'command/CommandDelimiterImages.dart';
import 'command/CommandDrawLine.dart';
import 'command/CommandLeftRightText.dart';
import 'command/CommandNewLine.dart';
import 'command/CommandQRcode.dart';
import 'command/CommandString.dart';
import 'command/IRawbtCommand.dart';
import 'attributes/AttributesImage.dart';
import 'attributes/AttributesString.dart';

class PrintJob {
  String? idJob;

  List<IRawbtCommand> commands = <IRawbtCommand>[];

  int copies = 1;

  static const String templateNone = "none";
  static const String templateDefault = "default";
  static const String templateSimple = "simple";

  String template = templateSimple;

  static const String printerCurrent = "current";
  static const String printerVirtual = "virtual";
  static const String printerRawTransfer = "raw_transfer";
  static const String printerGallery = "save_into_gallery";

  String printer = printerCurrent;

  // ------------------
  AttributesString? defaultAttrString;
  AttributesImage? defaultAttrImage;
  // -----------------

  bool premium = false;

  // ========= атрибуты =========
  AttributesString getDefaultAttrString() {
    return defaultAttrString == null ? const AttributesString() : defaultAttrString!;
  }

  void setDefaultAttrString(AttributesString defaultAttrString) {
    this.defaultAttrString = defaultAttrString;
  }

  AttributesImage getDefaultAttrImage() {
    return defaultAttrImage == null ? const AttributesImage(graphicFilter: Constant.DITHERING_BW) : defaultAttrImage!;
  }

  void setDefaultAttrImage(AttributesImage defaultAttrImage) {
    this.defaultAttrImage = defaultAttrImage;
  }


  // ========== строка текста ===========

  void println(String string){
    commands.add(CommandString(string,getDefaultAttrString()));
  }

  void printlnWithAttr(String string, AttributesString attr){
    commands.add(CommandString(string,attr));
  }

  void ln({int n=1}){
    commands.add(CommandNewLine(count:n));
  }

  // ========== rich format ==============

  void leftRightText(String leftText, String rightText){
    commands.add(CommandLeftRightText(leftText,rightText,getDefaultAttrString()));
  }

  void leftRightTextWithFormat(String leftText, String rightText,AttributesString attr){
    commands.add(CommandLeftRightText(leftText,rightText,attr));
  }

  void leftRightTextWithBothFormat(String leftText, String rightText,AttributesString attrLeft,AttributesString attrRight){
    commands.add(CommandLeftRightText.fullAttr(leftText,rightText,0,0,attrLeft,attrRight));
  }


  void leftIndentRightText(int leftIndent, String leftText, String rightText){
    CommandLeftRightText command = CommandLeftRightText(leftText,rightText,getDefaultAttrString());
    command.leftIndent = leftIndent;
    commands.add(command);
  }

  void leftIndentRightTextWithFormat(int leftIndent, String leftText, String rightText,AttributesString attr){
    CommandLeftRightText command = CommandLeftRightText(leftText,rightText,attr);
    command.leftIndent = leftIndent;
    commands.add(command);
  }


  void leftRightIndentText(int rightIndent, String leftText, String rightText){
    CommandLeftRightText command = CommandLeftRightText(leftText,rightText,getDefaultAttrString());
    command.rightIndent = rightIndent;
    commands.add(command);
  }


  void leftRightIndentTextWithFormat(int rightIndent, String leftText, String rightText, AttributesString attr){
    CommandLeftRightText command = CommandLeftRightText(leftText,rightText,attr);
    command.rightIndent = rightIndent;
    commands.add(command);
  }

  // ========= картинка =================


  void imageInBase64(String b64) {
     commands.add(CommandImageInBase64(b64,attributesImage: getDefaultAttrImage()));
  }

  void imageInBase64WithAttr(String b64,AttributesImage attr) {
    commands.add(CommandImageInBase64(b64,attributesImage: attr));
  }

  Future imageFromNetwork(String url) async{
    var b = await _readNetworkImage(url);
    commands.add(CommandImageInBase64(base64Encode(b),attributesImage: getDefaultAttrImage()));
  }

  Future imageFromNetworkWithAttr(String url, AttributesImage attr) async{
    var b = await _readNetworkImage(url);
    commands.add(CommandImageInBase64(base64Encode(b),attributesImage: attr));
  }

  // Reading bytes from a network image
  Future<Uint8List> _readNetworkImage(String imageUrl) async {
    final ByteData data = await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl);
    return data.buffer.asUint8List();
  }

  // ============== bytes =====================

  void sendBytes(String base64){
    commands.add(CommandBytesInBase64(base64));
  }


  // ========== barcode & qr ==========

  void addBarcodeCommand(CommandBarcode commandBarcode){
    commands.add(commandBarcode);
  }

  void barcode(String data, AttributesBarcode attr){
    commands.add(CommandBarcode(data,attr));
  }

  void addQrcodeCommand(CommandQRcode commandQRcode) { commands.add(commandQRcode); }

  void qrcode(String data, AttributesQRcode attr){
    commands.add(CommandQRcode(data,attr));
  }


  // ========= cut ===========

  void cut(){
    commands.add(CommandCut());
  }

  // =======================
  void drawLine(String ch){
    commands.add(CommandDrawLine(ch:ch,attributesString: getDefaultAttrString()));
  }

  void drawLineWithAttributes(String ch, AttributesString attr){
    commands.add(CommandDrawLine(ch: ch, attributesString: attr));
  }

  // =============================

  void delimiterImages() {
    commands.add(CommandDelimiterImages());
  }


  // ==============

  bool isPremium() {
    return premium;
  }

  void setPremium(bool premium) {
    this.premium = premium;
  }


  Map<String, dynamic> toJson() => {
    'idJob':idJob,
    'commands':commands.map((tag)=>tag.toJson()).toList(),
    'copies':copies,
    'template':template,
    'printer':printer,
    'premium':premium,
  };
}