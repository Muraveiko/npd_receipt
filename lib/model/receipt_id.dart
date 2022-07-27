import 'package:npd/model/receipt.dart';

class ReceiptId  { // implements Parcelable
  /// Кто выписал чек
   String? inn;

  /// ID чека
   String? receiptId;


   ReceiptId({this.receiptId, this.inn});


/*
   static ReceiptId fromURI(Uri uri) {

    try {
      if ("lknpd.nalog.ru".equals(uri.getHost())) {
        List<String> segments = new ArrayList<>();
        for (String s : uri.getPathSegments()) {
    segments.add(s.trim());
    }

    if (segments.size() == 6) {
    if ("v1".equals(segments.get(1)) && "print".equals(segments.get(5))) {
    return new ReceiptId(segments.get(4), segments.get(3));
    }
    }
    }
    }catch (Exception ignored){}
    return null;
  }

   String imageUrl(){
    return  "https://lknpd.nalog.ru/api/v1/receipt/"+inn+"/"+receiptId+"/print";
  }

   String jsonUrl(){
    return  "https://lknpd.nalog.ru/api/v1/receipt/"+inn+"/"+receiptId+"/json";
  }
*/
  static  ReceiptId fromReceipt(Receipt receipt){
    ReceiptId id = ReceiptId();
    id.inn = receipt.inn;
    id.receiptId = receipt.receiptId;
    return id;
  }

  /*
   File getImgFile(Context ctx) {
    return new File(ctx.getCacheDir(), inn+"_"+receiptId+".jpg");
  }

   */

  /*

  // ----------------
  // implements parcelable

  @Override
   int describeContents() {
    return 0;
  }

  @Override
   void writeToParcel(Parcel dest, int flags) {

    dest.writeString(inn);
    dest.writeString(receiptId);
  }
  protected ReceiptId(Parcel in) {
  inn = in.readString();
  receiptId = in.readString();
  }


   static final Creator<ReceiptId> CREATOR = new Creator<ReceiptId>() {
  @Override
   ReceiptId createFromParcel(Parcel in) {
  return new ReceiptId(in);
  }

  @Override
   ReceiptId[] newArray(int size) {
    return new ReceiptId[size];
  }
};
*/
}
