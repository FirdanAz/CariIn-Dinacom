import 'dart:async';
import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class HistorySearchDatabase {
  static const _dbName = 'myDatabase.db';
  static final _dbVersion = 1;
  static const _tableName = 'searchHistory';

  static const columnId = '_id';
  static const columnText = 'text';

  static final HistorySearchDatabase instance = HistorySearchDatabase.init();

  static Database? _database;
  HistorySearchDatabase.init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(_dbName);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $_tableName(
        $columnId $idType,
        $columnText $textType
      )''');
  }

// {
//   "_id":12,
//   "name":"saheb"
// }

  Future<int> create(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  // Future<MovieModel> read(int? idFilm) async {
  //   final db = await instance.database;

  //   final maps = await db.query(
  //     tableMovie,
  //     columns: MovieFields.values,
  //     where: '${MovieFields.idFilm} = ?',
  //     whereArgs: [idFilm],
  //   );

  //   if (maps.isNotEmpty) {
  //     return MovieModel.fromJson(maps.first);
  //   } else {
  //     throw Exception('ID $idFilm not found');
  //   }
  // }

  Future<List<Map<String, dynamic>>> readAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.delete(_tableName, where: '$columnId', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
