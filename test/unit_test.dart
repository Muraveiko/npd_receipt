import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:npd/model/receipt.dart';

// Работу с апи удобнее отлаживать через тесты
void main() {

  test('PlayGround',() {
    debugPrint('Еще один способ использовать тесты для запуска кусочков кода напрямую');
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