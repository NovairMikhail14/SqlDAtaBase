import 'package:sqflite/sqflite.dart';
import 'package:untitled1/01-Local_Data/database_connection.dart';

class Reprository {
  late DatabaseConnection databaseConnection;
  static Database? _database;

  Reprository() {
    databaseConnection = DatabaseConnection();
  }

  Future<Database> get database async {

    if (_database != null) {
      return _database!;
    } else {
      _database = await databaseConnection.setDatabase(1);
      return _database!;
    }
  }

  Future<int> insertData(String table, Map<String, dynamic> row) async {
    var connect = await database;
    return await connect.insert(table, row);
  }

  Future<List<Map<String, Object?>>> readData(String table) async {
    var connect = await database;
    return await connect.query(table);
  }

  Future<List<Map<String, Object?>>> readDataByid(Map<String, dynamic> readrow) async {
    var connect = await database;
    return await connect.query(DatabaseConnection.TableName,
        where: "${DatabaseConnection.colId} == ?", whereArgs: [readrow[DatabaseConnection.colId]]);
  }

  Future<int> updateData(Map<String, dynamic> updaterow) async {
    var connect = await database;
    return await connect.update(DatabaseConnection.TableName, updaterow,
        where: "${DatabaseConnection.colId} == ?",
        whereArgs: [updaterow[DatabaseConnection.colId]]);
  }

  Future<int> deleteData(int id) async {
    var connect = await database;
    return await connect.delete(DatabaseConnection.TableName,
        where: "${DatabaseConnection.colId} = ?", whereArgs: [id]);
  }
}
