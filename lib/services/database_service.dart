import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:szef_kuchni_v2/models/recipe_name.dart';

class DatabaseService {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initializeDatabase();
    return _db;
  }
  initializeDatabase() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "master_db.db");
    bool dbExists = await io.File(path).exists();
    if (!dbExists) {
      ByteData data = await rootBundle.load(join("assets","master_db.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await io.File(path).writeAsBytes(bytes, flush: true);
    }

    var database = await openDatabase(path, version: 1);
    return database;
  }

  Future<List<RecipeName>> getRecipeNames() async{
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT id,name FROM recipes LIMIT 10');
    List<RecipeName> recipeNames = [];
    for(int i=0; i<list.length; i++) {
      recipeNames.add(RecipeName(list[i]["id"], list[i]["name"]));
      print(recipeNames[i].name);
    }
    return recipeNames;
  }
}