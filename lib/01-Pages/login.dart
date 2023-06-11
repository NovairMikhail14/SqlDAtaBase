import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';
import 'package:untitled1/01-Local_Data/database_connection.dart';
import 'package:untitled1/01-Pages/fulldetails.dart';
import 'package:untitled1/01-Pages/updateuser.dart';
import 'package:untitled1/01-Service//user_model.dart';
import 'package:untitled1/01-Service/user_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<User> usermodellist = [];
  UserService _userService = UserService();

  @override
  void initState() {
    getAllUsers();
    super.initState();
  }

  getAllUsers() async {
    usermodellist.clear();
    List users = await _userService.ReadAllUsers();
    users.forEach((element) {
      setState(() {
        User USR = User();
        USR.id=element[DatabaseConnection.colId];
        USR.name=element[DatabaseConnection.colName] ;
        USR.contact=element[DatabaseConnection.colContact];
        USR.description= element[DatabaseConnection.colDescription];
        usermodellist.add(USR);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "NewUser").then((value) async => await getAllUsers());
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("SQLite CRUD"),
      ),
      body: Container(
        child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 5),
            separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
            itemCount: usermodellist.length,
            itemBuilder: (BuildContext cntx, int index) {
              return ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  Navigator.of(cntx).push(MaterialPageRoute(builder: (_){return FullDetails(usermodellist[index].UserMap());}));
                },
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  title: Text(usermodellist[index].name.toString()),
                  subtitle: Text(usermodellist[index].contact.toString()),
                  leading: Icon(
                    (Icons.person),
                  ),
                  trailing: Container(
                    clipBehavior: Clip.none,
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.edit),
                            color: Colors.green,
                            onPressed: () async {
                              Navigator.of(cntx).push(MaterialPageRoute(builder: (_){return UpdateUser(usermodellist[index].UserMap());})).then((value) async => await getAllUsers());
                              Navigator.pushNamed(context, "UpdateUser");
                            }),
                        IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () async {
                                _userService.DeletebyId(usermodellist[index].id!);
                                setState(() {
                                  getAllUsers();
                                });
                            }),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
