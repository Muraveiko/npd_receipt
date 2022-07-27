import 'package:floor/floor.dart';
import '../model/inn_info.dart';

@dao
abstract class ModelInn {

  @Insert(onConflict: OnConflictStrategy.replace)
  void insert(InnInfo innInfo);

  @Query("DELETE FROM inn_info WHERE inn=:innInfo.inn")
  void delete(InnInfo innInfo);

  @Query("DELETE FROM inn_info")
  void deleteAll();


  @Query("SELECT * FROM inn_info ORDER by inn")
  Future<List<InnInfo>> getAll();


  @Query("SELECT * FROM inn_info WHERE inn=:inn")
  InnInfo get(String inn);

}
