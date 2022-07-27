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