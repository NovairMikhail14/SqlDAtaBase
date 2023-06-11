import 'package:flutter/material.dart';
import 'package:untitled1/01-Service/user_model.dart';
import 'package:untitled1/01-Service/user_service.dart';

class UpdateUser extends StatefulWidget {
  Map<String,dynamic> useid;
  UpdateUser(this.useid);

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  TextEditingController _usernamecontroller =TextEditingController();
  var _contactcontroller =TextEditingController();
  var _disccontroller =TextEditingController();
  late bool _namevalidator= false;
  late bool _contactvalidator= false;
  late bool _discvalidator = false;

  @override
  Widget build(BuildContext context) {
    int idupdated = widget.useid["id"];
    setState(() {
      _usernamecontroller.text=widget.useid["name"];
      _contactcontroller.text=widget.useid["contact"];
      _disccontroller.text=widget.useid["description"];
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite CRUD"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              "Update User",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),SizedBox(
              height: 10,
            ),
            TextField(
                controller: _usernamecontroller,
                decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(borderSide: BorderSide(width: 10),
                        borderRadius: BorderRadius.circular(5)),
                    errorText:  _namevalidator? "Name cant be empty":null)),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: _contactcontroller,
                decoration: InputDecoration(
                    hintText: "Contact",
                    border: OutlineInputBorder(borderSide: BorderSide(width: 10),
                        borderRadius: BorderRadius.circular(5)),
                    errorText:  _contactvalidator? "Contact cant be empty":null)),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller:_disccontroller,
                decoration: InputDecoration(
                    hintText: "Description",
                    border: OutlineInputBorder(borderSide: BorderSide(width: 10),
                        borderRadius: BorderRadius.circular(5)),
                    errorText:_discvalidator? "Description cant be empty":null )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    _usernamecontroller.text.isEmpty?_namevalidator=true:_namevalidator=false;
                    _contactcontroller.text.isEmpty?_contactvalidator=true:_contactvalidator=false;
                    _disccontroller.text.isEmpty?_discvalidator=true:_discvalidator=false;
                  });
                  if (_namevalidator==false && _contactvalidator==false&&_discvalidator==false){
                    UserService userservice = UserService();
                    User user = User(id:idupdated,name:_usernamecontroller.text,contact: _contactcontroller.text, description:_disccontroller.text);
                    userservice.UpdateByID(user.UserMap());
                    print(user.UserMap());
                    Navigator.pop(context);
                  }
                }, child: Text("Save Details"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green))),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: () {
                  setState(() {
                    _usernamecontroller.clear();
                    _contactcontroller.clear();
                    _disccontroller.clear();
                  });
                }, child: Text("Clear Details"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
