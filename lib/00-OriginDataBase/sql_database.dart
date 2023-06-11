import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';


class  SqlDataBase{

late Database database;
static const TableName = "user";
static const colId = "id";
static const colName = "Name";
static const colContact = "Contact";
static const colDescription = "Description";




  Future createDataBase() async{
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    String path = (appDocumentsDir.path+"/SS.db");
    print(path);
    database = await openDatabase(path,version: 1,onCreate: (Database db , int version) async{
       await db.execute("CREATE TABLE $TableName ($colId INTEGER,$colName TEXT NOT NULL,$colContact TEXT NOT NULL,$colDescription TEXT NOT NULL)");
    });
  }

  Future<int> insertData(Map<String, dynamic> map) async{
    return await database.insert("$TableName",map);
  }
  Future<List<Map<String, dynamic>>> readData() async{
    return await database.query(TableName);
  }
  // Future readDataById (Map<String, dynamic> map) async{
  //   return await database!.query(TableName,columns: ['id', 'name', 'contact', 'Description'],where: "id=?" ,whereArgs: map);
  // }
  Future<int> updateData(Map<String, dynamic> newrow) async{
    return await database.update(TableName ,newrow, where: "$colId==?" ,whereArgs:[newrow["id"]]);
  }
    Future<int> deleteData(int id) async{
    return await database.delete(TableName , where: "$colId==?" ,whereArgs:[id]);
  }

}