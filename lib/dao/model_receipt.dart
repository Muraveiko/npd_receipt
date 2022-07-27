import 'package:floor/floor.dart';
import '../model/receipt.dart';

@dao
abstract class ModelReceipt {

  @Insert(onConflict : OnConflictStrategy.replace)
  Future<void> insert(Receipt receipt);

  @Query("DELETE FROM receipt_history WHERE receiptId=:id and inn=:inn")
  Future<void> delete(String id, String inn); // здесь только простые типы

  @Query("DELETE FROM receipt_history")
  Future<void> deleteAll();


  @Query("SELECT * FROM receipt_history")
  Future<List<Receipt>> getAll();
  // @todo сортировку обратную дате импорта

  @Query("SELECT * FROM receipt_history WHERE receiptId=:id and inn=:inn")
  Future<Receipt?> get(String id,String inn);

}