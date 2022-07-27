// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../dao/model_inn.dart';
import '../dao/model_receipt.dart';
import '../model/inn_info.dart';
import '../model/receipt.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Receipt,InnInfo])
abstract class AppDatabase extends FloorDatabase {
   ModelReceipt get modelReceipt;
   ModelInn get modelInn;
}

class NpdDao {
   NpdDao._internal();
   static final NpdDao _instance = NpdDao._internal();
   factory NpdDao() {
      assert(
      db != null,
      'Must call NpdDao.init() before using settings!');
      return _instance;
   }

   static ModelInn? modelInn;
   static ModelReceipt? modelReceipt;
   static AppDatabase? db;

   static Future<void> init() async {
      db = await $FloorAppDatabase.databaseBuilder("npd_receipt_database.db").build();
      modelInn = db?.modelInn;
      modelReceipt = db?.modelReceipt;
   }
}