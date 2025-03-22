import 'package:my_fest/data/repositories/local/database_helper.dart';
import 'package:my_fest/utils/object.dart';
import 'package:sqflite/sqflite.dart';

abstract class GenericDao<T extends MyObject> {
  String nameTable;
  Future<Database> get db => DatabaseHelper().database;

  T fromJson(Map<String, dynamic> map);

  GenericDao(this.nameTable);

  Future<void> insert(T entity) async {
    final _db = await db;
    _db.insert(nameTable, entity.toJson());
  }

  Future<T> update(T entity) async {
    final _db = await db;
    _db.update(nameTable, entity.toJson(),
        where: 'id = ?', whereArgs: [entity.id]);
    return entity;
  }

  Future<void> delete(T entity) async {
    final _db = await db;
    _db.delete(nameTable, where: 'id = ?', whereArgs: [entity.id]);
  }

  Future<List<T>> getAll() async {
    final _db = await db;
    final result = await _db.query(nameTable);
    return result.map((e) => fromJson(e)).toList();
  }
}
