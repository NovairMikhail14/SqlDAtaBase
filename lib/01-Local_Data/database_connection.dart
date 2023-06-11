import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class DatabaseConnection{
  late Database database;
  static const TableName = "tbs";
  static const colId = "id";
  static const colName = "Name";
  static const colContact = "Contact";
  static const colDescription = "Description";


  Future _creatDatabase(Database db,int version) async{
    String sql = "CREATE TABLE $TableName ($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colName TEXT,$colContact TEXT,$colDescription TEXT)";
    await db.execute(sql);
  }

  Future<Database> setDatabase(int version) async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final path =join(appDocumentsDir.path,"1st_db");
    database = await openDatabase(path,version: version,onCreate: _creatDatabase);
    return database;
  }
}