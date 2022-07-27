import 'package:floor/floor.dart';

@Entity(tableName: "inn_info")
class InnInfo {
  @primaryKey
  String? inn;
  String? name;

  InnInfo({this.inn, this.name});
}