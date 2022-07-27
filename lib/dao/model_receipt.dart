import 'package:floor/floor.dart';
import '../model/receipt.dart';

@dao
abstract class ModelReceipt {

  @Insert(onConflict : OnConflictStrategy.replace)
  void insert(Receipt receipt);

  @Query("DELETE FROM receipt_history WHERE receiptId=:receipt.receiptId and inn=:receipt.inn")
  void delete(Receipt receipt);

  @Query("DELETE FROM receipt_history")
  void deleteAll();


  @Query("SELECT * FROM receipt_history")
  Future<List<Receipt>> getAll();
  // @todo сортировку обратную дате импорта

  @Query("SELECT * FROM receipt_history WHERE receiptId=:id and inn=:inn")
  Receipt get(String id,String inn);

}