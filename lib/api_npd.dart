import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model/api_error_response.dart';
import 'model/receipt.dart';
import 'model/receipt_id.dart';

class NpdAPI {
  static Future<Receipt> getFromApi  (String url) async {

    ReceiptId rId = ReceiptId.fromURI(Uri.parse(url));
    final response =  await http.get(Uri.parse(rId.jsonUrl()));
    final jsonString = utf8.decode(response.bodyBytes);
    if(response.statusCode != 200){
      final apiErr = ApiErrorResponse.fromJSON(jsonDecode(jsonString));
      throw Exception(apiErr.message);
    }

    return Receipt.fromStringJSON(jsonString);
  }
}