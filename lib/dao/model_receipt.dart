import 'package:floor/floor.dart';
import '../model/receipt.dart';

@dao
abstract class ModelReceipt {

  @Insert(onConflict : OnConflictStrategy.replace)
  Future<void> insertReceipt(Receipt receipt);

  @delete
  Future<void> deleteReceipt(Receipt receipt);

  @Query("DELETE FROM receipt_history")
  Future<void> deleteAllReceipt();


  @Query("SELECT * FROM receipt_history")
  Stream<List<Receipt>> getAllReceipt();
  // @todo сортировку обратную дате импорта

  @Query("SELECT * FROM receipt_history WHERE receiptId=:id and inn=:inn")
  Stream<Receipt?> getReceipt(String id,String inn);

}