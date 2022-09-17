import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static late Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();

      return _database;
    }
  }

  initDB() async {
    Directory Document = await getApplicationDocumentsDirectory();

    String path = join(Document.path, 'tesisDB.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
    );
  }
}
