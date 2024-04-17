// import 'package:homework/data/models/puzzle_model.dart';
// import 'package:homework/utils/app_constants.dart';
import 'package:homework/data/models/puzzle_model.dart';
import 'package:path/path.dart';

// import 'package:sqflite/sqflite.dart';
//
// class LocalDatabase {
//   static final databaseInstance = LocalDatabase._();
//
//   LocalDatabase._();
//
//   factory LocalDatabase() {
//     return databaseInstance;
//   }
//
//   Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     } else {
//       _database = await _init("todo.db");
//       return _database!;
//     }
//   }
//
//   Future<Database> _init(String databaseName) async {
//     String internalPath = await getDatabasesPath();
//     String path = join(internalPath, databaseName);
//     return await openDatabase(path, version: 1, onCreate: _onCreate);
//   }
//
//   Future<void> _onCreate(Database db, int version) async {
//     const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
//     const intType = "INTEGER DEFAULT 0";
//
//     await db.execute('''
//     CREATE TABLE ${AppConstants.tableName} (
//     ${AppConstants.id} $idType,
//     ${AppConstants.count} $intType,
//     ${AppConstants.datetime} $intType
//     )
//     ''');
//   }
//
//   static Future<PuzzleModel> insertRecord(PuzzleModel puzzleModel) async {
//     final db = await databaseInstance.database;
//
//     int savedRecordId =
//         await db.insert(AppConstants.tableName, puzzleModel.toJson());
//
//     return puzzleModel.copyWith(id: savedRecordId);
//   }
//
//   static Future<List<PuzzleModel>> getAllRecords() async {
//     final db = await databaseInstance.database;
//     String orderBy = "${AppConstants.id} DESC";
//     List json = await db.query(AppConstants.tableName, orderBy: orderBy);
//     return json.map((e) => PuzzleModel.fromJson(e)).toList();
//   }
// }

import 'package:sqflite/sqflite.dart';

class LocalDatabaseHelper {
  static final LocalDatabaseHelper _instance = LocalDatabaseHelper._internal();

  factory LocalDatabaseHelper() {
    return _instance;
  }

  LocalDatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init();
      return _database!;
    }
  }

  Future<Database> _init() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'game_database.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS GameData (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        moves INTEGER,
        timer INTEGER
      )
    ''');
  }

  Future<void> saveGameData(int moves, int timer) async {
    final Database db = await database;
    await db.transaction((txn) async {
      await txn.insert('GameData', {
        'moves': moves,
        'timer': timer,
      });
    });
  }

  Future<List<Map<String, dynamic>>> getAllGameData() async {
    final Database db = await database;
    return await db.query('GameData');
  }
}
