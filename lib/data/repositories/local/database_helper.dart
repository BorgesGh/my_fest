// party_product_dao.dart
import 'package:my_fest/model/party.dart';
import 'package:my_fest/model/product.dart';
import 'package:my_fest/model/product_party.dart';
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

  Future<int> insertParty(Party party) async {
    final db = await database;
    return await db.insert('Party', party.toJson());
  }

  Future<int> insertProduct(Product product) async {
    final db = await database;
    return await db.insert('Product', product.toJson());
  }

  Future<int> insertProductsParty(ProductParty productsParty) async {
    final db = await database;
    // for (var product in productsParty.products) {
    //   await insertProduct(product);
    // }
    return await db.insert('ProductParty', {
      'partyId': productsParty.party.name,
      'productId': productsParty.products.map((p) => p.name).join(', '),
      'buyed': productsParty.buyed ? 1 : 0,
    });
  }

  Future<List<Party>> getAllParties() async {
    final db = await database;
    final result = await db.query('Party');
    return result.map((e) => Party.fromJson(e)).toList();
  }

  Future<List<Product>> getAllProducts() async {
    final db = await database;
    final result = await db.query('Product');
    return result.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<ProductParty>> getAllProductsParties() async {
    final db = await database;
    final result = await db.query('ProductParty');
    return result.map((e) => ProductParty.fromJson(e)).toList();
  }
}
