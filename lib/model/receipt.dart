import 'dart:convert';

import 'package:floor/floor.dart';
import 'receipt_services.dart';
import 'cancellation_info.dart';
import 'description_row.dart';

@Entity(tableName: "receipt_history", primaryKeys: ["inn","receiptId"])
class Receipt {
  // Кто выписал чек
  String? inn;

  /// ID чека
  String? receiptId;

  /// Сумма чека
  double? totalAmount;


  /// json полученный от апи
  String? sourceJson;


  Receipt({this.inn, this.receiptId, this.totalAmount, this.sourceJson});

  // ======================= не храним в базе данных как отдельные поля =============
  /// Дата расчёта
  @ignore
  DateTime? operationTime;

  /// Список услуг
 @ignore
  List<Service>? services;

  /// Дата формирования
  @ignore
  DateTime? requestTime;

  @ignore
  DateTime? registerTime;

  /// Налоговый период, в котором при расчете
  /// налога будет/был учтен чек (формат, yyyyMM)
 @ignore
   int? taxPeriodId;

  ///  Тип оплаты
  /// 1) CASH
  /// 2)
 @ignore
  String? paymentType;

  /// Источник/Тип дохода:
  /// 1) FROM_INDIVIDUAL (Доход от Физического Лица)
  /// 2) FROM_LEGAL_ENTITY (Доход от Юридического Лица)
  /// 3) FROM_FOREIGN_AGENCY (Доход от Иностранной Организации)
 @ignore
  String?incomeType;

 @ignore
  CancellationInfo? cancellationInfo;

 @ignore
  String? sourceDeviceId;

 @ignore
  String? clientInn;

 @ignore
  String? clientDisplayName;

 @ignore
  String? partnerDisplayName;

 @ignore
  String? partnerInn;

 /// Строка профессия в шапке под ФИО
 @ignore
   String? profession;

 @ignore
   List<DescriptionRow>? description;

  /// Email самозанятого
 @ignore
   String? email;

  /// Телефон самозанятого
 @ignore
 String? phone;

  /// Создает чек из ответа от АПИ
  /// в дарте разбор делается через jsonDecode(jsonData) из dart:convert
   static Receipt fromStringJSON(String jsonData){
     var receipt = Receipt.fromJSON(jsonDecode(jsonData));
     receipt.sourceJson = jsonData;
     return receipt;
   }

   static Receipt fromJSON(Map<String, dynamic> data) {
     final inn = data['inn'] as String;
     final receiptId = data['receiptId'] as String;
     final totalAmount = data['totalAmount'] as double;

     var receipt = Receipt(inn: inn, receiptId: receiptId,totalAmount:totalAmount);

     receipt.operationTime = DateTime.parse(data['operationTime'] as String);
     receipt.requestTime = DateTime.parse(data['requestTime'] as String);
     receipt.registerTime = DateTime.parse(data['registerTime'] as String);

     receipt.taxPeriodId = data['taxPeriodId'] as int?;

     receipt.paymentType = data['paymentType'] as String?;
     receipt.incomeType = data['incomeType'] as String?;
     receipt.sourceDeviceId = data['sourceDeviceId'] as String?;
     receipt.clientInn = data['clientInn'] as String?;
     receipt.clientDisplayName = data['clientDisplayName'] as String?;
     receipt.partnerDisplayName = data['partnerDisplayName'] as String?;
     receipt.partnerInn = data['partnerInn'] as String?;
     receipt.profession = data['profession'] as String?;
     receipt.email = data['email'] as String?;
     receipt.phone = data['phone'] as String?;

     // субклассы

     final servicesData = data['services'] as List<dynamic>?;
     receipt.services = servicesData?.map(
             (sData) => Service.fromJSON(sData)
     ).toList() as List<Service>;

     final descriptionData = data['description'] as List<dynamic>?;
     receipt.description = descriptionData?.map(
             (dData) => DescriptionRow.fromJSON(dData)
     ).toList() as List<DescriptionRow>;

     // здесь один объект-класс
     final cancellationData = data['cancellationInfo'];
     if(cancellationData != null) {
       receipt.cancellationInfo = CancellationInfo.fromJSON(cancellationData);
     }


     return receipt;
   }


}  