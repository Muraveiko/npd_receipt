import 'package:npd/model/receipt.dart';

class ReceiptId  { // implements Parcelable
  /// Кто выписал чек
   String? inn;

  /// ID чека
   String? receiptId;


   ReceiptId({this.receiptId, this.inn});



   static ReceiptId fromURI(Uri uri)  {

      if ("lknpd.nalog.ru" == uri.host) {
        List<String> segments = uri.pathSegments;
        if (segments.length == 6) {
            if ("v1" == segments.elementAt(1) && "print" == segments.elementAt(5)) {
               return ReceiptId(receiptId:segments.elementAt(4), inn: segments.elementAt(3));
            }
        }
    }

    throw Exception('Неправильная ссылка на чек');
  }


  static String? validateUrl(String? url){
    if (url == null || url.isEmpty) {
      return 'Введите ссылку на чек';
    }
    try{
       ReceiptId.fromURI(Uri.parse(url));
    }catch(e){
      return 'Неправильная ссылка на чек';
    }
    return null;
  }

  String imageUrl(){
    return  "https://lknpd.nalog.ru/api/v1/receipt/$inn/$receiptId/print";
  }


   String jsonUrl(){
    return  "https://lknpd.nalog.ru/api/v1/receipt/$inn/$receiptId/json";
  }

  static  ReceiptId fromReceipt(Receipt receipt){
    ReceiptId id = ReceiptId();
    id.inn = receipt.inn;
    id.receiptId = receipt.receiptId;
    return id;
  }


}
