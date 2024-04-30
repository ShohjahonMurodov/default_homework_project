import 'package:flutter/cupertino.dart';
import 'package:homework/data/models/currency_model.dart';
import 'package:homework/data/models/network_response.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../utils/app_constants.dart';

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
    const textType = "TEXT NOT NULL";

    await db.execute('''
    CREATE TABLE ${AppConstants.tableName} (
    ${AppConstants.title} $textType,
    ${AppConstants.code} $textType,
    ${AppConstants.cbPrice} $textType,
    ${AppConstants.nbuBuyPrice} $textType,
    ${AppConstants.nbuCellPrice} $textType,
    ${AppConstants.date} $textType
    )
    ''');
  }

  static Future<NetworkResponse> insertCurrency(
      CurrencyModel currencyModel) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      final db = await databaseInstance.database;

      await db.insert(AppConstants.tableName, currencyModel.toJson());
    } catch (_) {
      debugPrint(_.toString());
      networkResponse.errorText = "Hato insertda :(";
    }

    return networkResponse;
  }

  static Future<NetworkResponse> getAllCurrencies() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      final db = await databaseInstance.database;
      String orderBy = "code DESC";
      List json = await db.query(AppConstants.tableName, orderBy: orderBy);
      networkResponse.data =
          json.map((e) => CurrencyModel.fromJson(e)).toList();
    } catch (_) {
      networkResponse.errorText = "Error Call Metod :(";
    }
    return networkResponse;
  }

  static updateCurrency({required CurrencyModel currencyModel}) async {
    final db = await databaseInstance.database;
    // debugPrint(noteModel.id.toString());

    await db.update("CurrencyTable", currencyModel.toJson(),
        where: "code = ?", whereArgs: [currencyModel.code]);
  }

// static Future<CurrencyModel> insertCurrency(CurrencyModel currencyModel) async {
//   final db = await databaseInstance.database;
//
//   int savedNoteId =
//       await db.insert(AppConstants.tableName, currencyModel.toJson());
//
//   return currencyModel.copyWith(id: savedNoteId);
// }
//
// static Future<List<CurrencyModel>> getAllCurrencies() async {
//   final db = await databaseInstance.database;
//   String orderBy = "${AppConstants.id} DESC";
//   List json = await db.query(AppConstants.tableName, orderBy: orderBy);
//   return json.map((e) => CurrencyModel.fromJson(e)).toList();
// }
//
// static Future<int> updateCurrencyId(CurrencyModel currencyModel) async {
//   final db = await databaseInstance.database;
//
//   int updateNoteId = await db.update(
//       AppConstants.tableName, currencyModel.toUpdateJson(),
//       where: "${AppConstants.id} = ?", whereArgs: [currencyModel.id]);
//
//   return updateNoteId;
// }
}
