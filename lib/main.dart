
import 'package:flutter/material.dart';
import 'package:untitled1/00-OriginDataBase/homepage.dart';
import 'package:untitled1/00-OriginDataBase/sql_database.dart';
import 'package:untitled1/01-Pages//fulldetails.dart';
import 'package:untitled1/01-Pages//login.dart';
import 'package:untitled1/01-Pages//newuser.dart';
import 'package:untitled1/01-Pages//updateuser.dart';

// final SqlDataBase sqlt = SqlDataBase();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await sqlt.createDataBase();
  // print("-------------${SqlDataBase.TableName}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: "Login",
        routes: {
          // "HomePage": (BuildContext context) => HomePage(),
          "Login": (BuildContext context) => Login(),
          "NewUser": (BuildContext context) => NewUser(),
          // "UpdateUser": (BuildContext context) => UpdateUser(),
          // "FullDetails": (BuildContext context) => FullDetails(),

        });
  }
}
