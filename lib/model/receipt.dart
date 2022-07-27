import 'package:floor/floor.dart';
import 'package:npd/model/receipt_services.dart';

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

 @ignore
  /*
      Строка профессия в шапке под ФИО
     */
   String? profession;

 @ignore
   List<DescriptionRow>? description;

  /// Email самозанятого
 @ignore
   String? email;

  /// Телефон самозанятого
 @ignore
   String? phone;

  /**
   * Создает чек из ответа от АПИ
   *
   * @param  json ответ от апи
   * @return Receipt
   */
/*
   static

  Receipt fromJSON(String json) {

    GsonBuilder gsonBuilder = new GsonBuilder();
    Gson gson = gsonBuilder.create();
    Receipt receipt = gson.fromJson(json, Receipt.class);
    receipt.sourceJson = json;
    return receipt;


  }

 */
}  