import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tesis_proyect/class/models/tesisModel.dart';

class DBProvider {
  static initDB() async {
    Directory Document = await getApplicationDocumentsDirectory();

    String path = join(Document.path, 'database/tesisDB.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
    );
  }

  static insertTesis(TesisModel tesis) async {
    final Database db = await initDB();

    var res = await db.rawInsert(
        "insert into tesis values (null, '${tesis.name}', '${tesis.institucion}', '${tesis.facultad}', '${tesis.carrera}', '${tesis.fecha}', '${tesis.resumen}')");
    List ids = await db.rawQuery(
        "select id_tesis from tesis where titulo_tesis = '${tesis.name}' and institucion_tesis = '${tesis.institucion}' and carrera_tesis = '${tesis.carrera}' and fecha_tesis = '${tesis.fecha}'");
    int id_tesis = ids.first;
    for (int i = 0; i < tesis.autores.length; i++) {
      res = await db.rawInsert(
          "insert into autores values(null, '${tesis.autores[i]}', $id_tesis)");
    }
    for (int i = 0; i < tesis.tutores.length; i++) {
      res = await db.rawInsert(
          "insert into tutores values(null, '${tesis.tutores[i]}', $id_tesis)");
    }
  }

  Future<TesisModel> obtainTesis(
      String name, String institucion, String carrera, String fecha) async {
    final db = await initDB();

    List ids = await db.rawQuery(
        "select * from tesis where titulo_tesis = '$name' and institucion_tesis = '$institucion' and carrera_tesis = '$carrera' and fecha_tesis = '$fecha'");
    TesisModel tesisM = TesisModel.fromJson(ids.first);

    return tesisM;
  }
}
