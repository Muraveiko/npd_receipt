import 'package:floor/floor.dart';
import '../model/inn_info.dart';

@dao
abstract class ModelInn {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(InnInfo innInfo);

  @Query("DELETE FROM inn_info WHERE inn=:inn")
  Future<void> delete(String inn); // здесь только простые типы

  @Query("DELETE FROM inn_info")
  Future<void> deleteAll();


  @Query("SELECT * FROM inn_info ORDER by inn")
  Future<List<InnInfo>> getAll();


  @Query("SELECT * FROM inn_info WHERE inn=:inn")
  Future<InnInfo?> get(String inn);

}
