
import 'package:untitled1/01-Local_Data//database_connection.dart';
import 'package:untitled1/01-Local_Data//reprository.dart';
import 'package:untitled1/01-Service//user_model.dart';

class UserService {
  late Reprository _reprository;
  UserService(){
    _reprository = Reprository();
  }
  SaveUser(User user) async{
    await _reprository.insertData(DatabaseConnection.TableName,user.UserMap());
  }

  Future<List<Map<String, dynamic>>> ReadAllUsers()async{
    return await _reprository.readData(DatabaseConnection.TableName);
  }

  Future UpdateByID(Map<String, dynamic> readrow)async{
    await _reprository.updateData(readrow);
  }
  Future <int> DeletebyId(int id)async{
    return await _reprository.deleteData(id);
  }
}