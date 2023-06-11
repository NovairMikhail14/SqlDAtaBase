import 'package:flutter/material.dart';
import 'package:untitled1/01-Local_Data/database_connection.dart';
import 'package:untitled1/01-Local_Data/reprository.dart';
import 'package:untitled1/01-Service/user_model.dart';
import 'package:untitled1/01-Service/user_service.dart';

class FullDetails extends StatefulWidget {
  Map<String,dynamic> useid;
  FullDetails(this.useid);

  State<FullDetails> createState() => _FullDetailsState();
}


class _FullDetailsState extends State<FullDetails> {
  // List<User> useridlist = [];
  // UserService _userService = UserService();

  @override
  void initState() {
    // getidUser();
    // TODO: implement initState
    super.initState();
  }
  //
  // getidUser() async {
  //   useridlist.clear();
  //   User user = widget.useid[widget.indexid];
  //   print(user);
  //   List users = await _userService.ReadDataByID(user.UserMap());
  //   print("------------$users");
  //   users.forEach((element) {
  //     setState(() {
  //       User USR = User();
  //       USR.id = element[DatabaseConnection.colId];
  //       USR.name = element[DatabaseConnection.colName];
  //       USR.contact = element[DatabaseConnection.colContact];
  //       USR.description = element[DatabaseConnection.colDescription];
  //       useridlist.add(USR);
  //     });
  //   });
  // }



  @override
  Widget build(BuildContext context) {
    var useid= widget.useid;

    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite CRUD"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Full Details",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Name   ",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  useid["name"],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Contact   ",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  useid["contact"],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "Description",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Text(
                useid["description"],
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
