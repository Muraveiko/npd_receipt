
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:npd/model/api_error_response.dart';

import 'package:npd/model/receipt.dart';
import 'package:npd/model/receipt_id.dart';

// Работу с апи удобнее отлаживать через тесты

// будущий метод класса работы с апи
Future<Receipt> getFromApi  (String url) async {

     ReceiptId rId = ReceiptId.fromURI(Uri.parse(url));
     final response =  await http.get(Uri.parse(rId.jsonUrl()));
     final jsonString = utf8.decode(response.bodyBytes);
     if(response.statusCode != 200){
        final apiErr = ApiErrorResponse.fromJSON(jsonDecode(jsonString));
        debugPrint(jsonString);
        throw Exception(apiErr.message);
     }

     return Receipt.fromStringJSON(jsonString);
}

void main() {

  test('PlayGround',() async {
    expect( await getFromApi('тут урл') , Receipt());
  });

  test('Заготовка Разбор JSON от апи налоговой', () {

    String json = "";

    Receipt test = Receipt.fromStringJSON(json);
    expect(test.sourceJson, json);

    expect(test.inn,"");
    expect(test.receiptId,"");
    expect(test.totalAmount,0.00);


    expect(test.operationTime, DateTime.parse(""));

    // services
    expect(test.services?.length,1);
    expect(test.services?[0].name,"");

    expect(test.requestTime, DateTime.parse(""));
    expect(test.registerTime, DateTime.parse(""));

    expect(test.taxPeriodId, 202105);

    expect(test.receiptId,"");

    expect(test.paymentType,"");
    expect(test.incomeType,"");

    // CancellationInfo

    expect(test.sourceDeviceId,"");
    expect(test.clientInn,"");
    expect(test.clientDisplayName,"");
    expect(test.partnerDisplayName,"");
    expect(test.partnerInn,"");
    expect(test.profession,"");

    // description

    expect(test.email,"");
    expect(test.phone,"");
  });

}