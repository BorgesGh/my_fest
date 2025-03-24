// party_product_dao.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'party_product.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Party (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            date TEXT,
            numberOfPeople INTEGER
          )
        ''');

        await db.execute('''
          CREATE TABLE Product (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            unitOfMeasurement TEXT,
            amountPerPerson REAL
          )
        ''');

        await db.execute('''
          CREATE TABLE ProductParty (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            partyId INTEGER,
            productId INTEGER,
            buyed INTEGER,
            FOREIGN KEY(partyId) REFERENCES Party(id),
            FOREIGN KEY(productId) REFERENCES Product(id)
          )
        ''');
      },
    );
  }
}
