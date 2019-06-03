import 'dart:async';

import 'package:flutter_app/models/menu.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = new DBHelper.internal();

  factory DBHelper() => _instance;

  final String tableMenu = 'menu';
  final String columnId = 'id';
  final String columnTitle = 'title';
  final String columnImagePath = 'imagePath';

  static Database _db;

  DBHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'mantras.db');

    await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableMenu($columnId INTEGER PRIMARY KEY, $columnTitle TEXT, $columnImagePath TEXT)');
  }

  Future<int> saveMenu(Menu menu) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableMenu, menu.toMap());
//    var result = await dbClient.rawInsert(
//        'INSERT INTO $tableNote ($columnTitle, $columnDescription) VALUES (\'${note.title}\', \'${note.description}\')');

    return result;
  }

  Future<List> getAllMenu() async {
    var dbClient = await db;
    //var result = await dbClient
      //  .query(tableMenu, columns: [columnId, columnTitle, columnImagePath]);
  var result = await dbClient.rawQuery('SELECT * FROM $tableMenu');

    return result;
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableMenu'));
  }

  Future<Menu> getMenu(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableMenu,
        columns: [columnId, columnTitle, columnImagePath],
        where: '$columnId = ?',
        whereArgs: [id]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote WHERE $columnId = $id');

    if (result.length > 0) {
      return new Menu.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteMenu(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableMenu, where: '$columnId = ?', whereArgs: [id]);
//    return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
  }

  Future<int> updateNote(Menu menu) async {
    var dbClient = await db;
    return await dbClient.update(tableMenu, menu.toMap(),
        where: "$columnId = ?", whereArgs: [menu.id]);
//    return await dbClient.rawUpdate(
//        'UPDATE $tableNote SET $columnTitle = \'${note.title}\', $columnDescription = \'${note.description}\' WHERE $columnId = ${note.id}');
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
