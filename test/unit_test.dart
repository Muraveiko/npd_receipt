import 'package:flutter_test/flutter_test.dart';
import 'package:npd/model/receipt.dart';
import 'dart:convert';

// Работу с апи удобнее отлаживать через тесты
void main() {


  test('Заготовка Разбор JSON от апи налоговой', () {

    String json = "";

    Receipt test = Receipt.fromJSON(jsonDecode(json));

    expect(test.inn,"");
    expect(test.receiptId,"");
    expect(test.totalAmount,0.00);

    // sourceJson


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