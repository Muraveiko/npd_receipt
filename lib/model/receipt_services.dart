/// Информация по оказанной услуге
class Service{
  /// Наименование
  String? name;
  /// Количество
  int? quantity;
  /// Цена
  double? amount;

  int? serviceNumber;

  Service({this.name, this.quantity, this.amount, this.serviceNumber});

  static Service fromJSON(Map<String, dynamic> data) {

    final name = data['name'] as String?;
    final quantity = data['quantity'] as int?;
    final amount = (data['amount'] as num).toDouble(); // TODO fix double
    final serviceNumber = data['serviceNumber'] as int?;

    return Service(name: name,quantity: quantity,amount: amount,serviceNumber: serviceNumber );
  }

}