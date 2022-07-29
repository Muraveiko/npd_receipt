import 'package:flutter_test/flutter_test.dart';
import 'package:npd/model/receipt.dart';

// Работу с апи удобнее отлаживать через тесты
void main() {

  test('Разбор JSON от апи налоговой', () {

    String json = "тут ответ от апи";
    Receipt test = Receipt.fromJSON(json);
    expect(test.inn,"ИНН");


  });

}