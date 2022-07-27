import 'package:npd/model/receipt_services.dart';

import 'cancellation_info.dart';
import 'description_row.dart';

class Receipt {
  // Кто выписал чек
  String inn = '';

  /// ID чека
  String receiptId = '';

  /// Сумма чека
  double? totalAmount;


  /// json полученный от апи
  String? sourceJson;

  // ======================= не храним в базе данных как отдельные поля =============
  /// Дата расчёта
 // @Ignore
  DateTime? operationTime;

  /// Список услуг
 // @Ignore
  List<Service>? services;

  /// Дата формирования
// // @Ignore
  DateTime? requestTime;

// // @Ignore
  DateTime? registerTime;

  /// Налоговый период, в котором при расчете
  /// налога будет/был учтен чек (формат, yyyyMM)
 // @Ignore
   int? taxPeriodId;

  ///  Тип оплаты
  /// 1) CASH
  /// 2)
 // @Ignore
  String? paymentType;

  /// Источник/Тип дохода:
  /// 1) FROM_INDIVIDUAL (Доход от Физического Лица)
  /// 2) FROM_LEGAL_ENTITY (Доход от Юридического Лица)
  /// 3) FROM_FOREIGN_AGENCY (Доход от Иностранной Организации)
 // @Ignore
  String?incomeType;

 // @Ignore
  CancellationInfo? cancellationInfo;

 // @Ignore
  String? sourceDeviceId;

 // @Ignore
  String? clientInn;

 // @Ignore
  String? clientDisplayName;

 // @Ignore
  String? partnerDisplayName;

 // @Ignore
  String? partnerInn;

 // @Ignore
  /*
      Строка профессия в шапке под ФИО
     */
   String? profession;

 // @Ignore
   List<DescriptionRow>? description;

  /// Email самозанятого
 // @Ignore
   String? email;

  /// Телефон самозанятого
 // @Ignore
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