// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ModelReceipt? _modelReceiptInstance;

  ModelInn? _modelInnInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `receipt_history` (`inn` TEXT NOT NULL, `receiptId` TEXT NOT NULL, `totalAmount` REAL, `sourceJson` TEXT, PRIMARY KEY (`inn`, `receiptId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `inn_info` (`inn` TEXT NOT NULL, `name` TEXT, PRIMARY KEY (`inn`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ModelReceipt get modelReceipt {
    return _modelReceiptInstance ??= _$ModelReceipt(database, changeListener);
  }

  @override
  ModelInn get modelInn {
    return _modelInnInstance ??= _$ModelInn(database, changeListener);
  }
}

class _$ModelReceipt extends ModelReceipt {
  _$ModelReceipt(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _receiptInsertionAdapter = InsertionAdapter(
            database,
            'receipt_history',
            (Receipt item) => <String, Object?>{
                  'inn': item.inn,
                  'receiptId': item.receiptId,
                  'totalAmount': item.totalAmount,
                  'sourceJson': item.sourceJson
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Receipt> _receiptInsertionAdapter;

  @override
  Future<void> delete(String id, String inn) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM receipt_history WHERE receiptId=?1 and inn=?2',
        arguments: [id, inn]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM receipt_history');
  }

  @override
  Future<List<Receipt>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM receipt_history',
        mapper: (Map<String, Object?> row) => Receipt());
  }

  @override
  Future<Receipt?> get(String id, String inn) async {
    return _queryAdapter.query(
        'SELECT * FROM receipt_history WHERE receiptId=?1 and inn=?2',
        mapper: (Map<String, Object?> row) => Receipt(),
        arguments: [id, inn]);
  }

  @override
  Future<void> insert(Receipt receipt) async {
    await _receiptInsertionAdapter.insert(receipt, OnConflictStrategy.replace);
  }
}

class _$ModelInn extends ModelInn {
  _$ModelInn(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _innInfoInsertionAdapter = InsertionAdapter(
            database,
            'inn_info',
            (InnInfo item) =>
                <String, Object?>{'inn': item.inn, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<InnInfo> _innInfoInsertionAdapter;

  @override
  Future<void> delete(String inn) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM inn_info WHERE inn=?1', arguments: [inn]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM inn_info');
  }

  @override
  Future<List<InnInfo>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM inn_info ORDER by inn',
        mapper: (Map<String, Object?> row) => InnInfo());
  }

  @override
  Future<InnInfo?> get(String inn) async {
    return _queryAdapter.query('SELECT * FROM inn_info WHERE inn=?1',
        mapper: (Map<String, Object?> row) => InnInfo(), arguments: [inn]);
  }

  @override
  Future<void> insert(InnInfo innInfo) async {
    await _innInfoInsertionAdapter.insert(innInfo, OnConflictStrategy.replace);
  }
}
