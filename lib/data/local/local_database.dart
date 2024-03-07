import 'package:homework/data/models/coffee_constants.dart';
import 'package:homework/data/models/coffee_models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final databaseInstance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase() {
    return databaseInstance;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("todo.db");
      return _database!;
    }
  }

  Future<Database> _init(String databaseName) async {
    String internalPath = await getDatabasesPath();
    String path = join(internalPath, databaseName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE ${CoffeeConstants.tableName} (
    ${CoffeeConstants.id} $idType,
    ${CoffeeConstants.title} $textType,
    ${CoffeeConstants.subtitle} $textType,
    ${CoffeeConstants.price} $intType,
    ${CoffeeConstants.image} $textType,
    ${CoffeeConstants.count} $intType
    )
    ''');
  }

  static Future<CoffeeModels> insertGame(CoffeeModels coffeeModels) async {
    final db = await databaseInstance.database;

    int savedGameId =
        await db.insert(CoffeeConstants.tableName, coffeeModels.toJson());

    return coffeeModels.copyWith(id: savedGameId);
  }

  static Future<List<CoffeeModels>> getAllGames() async {
    final db = await databaseInstance.database;
    String orderBy = "${CoffeeConstants.id} DESC";
    List json = await db.query(CoffeeConstants.tableName, orderBy: orderBy);
    return json.map((e) => CoffeeModels.fromJson(e)).toList();
  }

  static Future<int> deleteGameId(int id) async {
    final db = await databaseInstance.database;
    int deleteId = await db.delete(CoffeeConstants.tableName,
        where: "${CoffeeConstants.id} = ?", whereArgs: [id]);
    return deleteId;
  }

  static Future<int> updateGameId(CoffeeModels gameModels) async {
    final db = await databaseInstance.database;

    int updateGameId = await db.update(
        CoffeeConstants.tableName, gameModels.toJson(),
        where: "${CoffeeConstants.title} = ?", whereArgs: [gameModels.title]);

    return updateGameId;
  }

  static Future<List<CoffeeModels>> searchGames(String query) async {
    final db = await databaseInstance.database;

    var json = await db.query(CoffeeConstants.tableName,
        where: "${CoffeeConstants.title} LIKE ?", whereArgs: ["$query%"]);

    return json.map((e) => CoffeeModels.fromJson(e)).toList();
  }
}
