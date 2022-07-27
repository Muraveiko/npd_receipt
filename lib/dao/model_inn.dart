import 'package:floor/floor.dart';
import '../model/inn_info.dart';

@dao
abstract class ModelInn {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertInnInfo(InnInfo innInfo);

  @delete
  Future<void> deleteInnInfo(InnInfo innInfo);

  @Query("DELETE FROM inn_info")
  Future<void> deleteAllInnInfo();


  @Query("SELECT * FROM inn_info ORDER by inn")
  Stream<List<InnInfo>> getAllInnInfo();


  @Query("SELECT * FROM inn_info WHERE inn=:inn")
  Stream<InnInfo?> getInnInfo(String inn);

}
