import 'package:flutter/material.dart';
import 'package:untitled1/00-OriginDataBase/sql_database.dart';
import 'package:untitled1/main.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Sql DataBase"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             ElevatedButton(
              onPressed: () async{
                Map<String,dynamic> row = {
                  SqlDataBase.colId:1,
                  SqlDataBase.colName:"Novair",
                  SqlDataBase.colContact:"01062314455",
                  SqlDataBase.colDescription:"Engineer"
                };
                // int rowid = await sqlt.insertData(row);
                // print("inserted row  $rowid");
              },
              child: Text("Insert"),
            ),
            ElevatedButton(
              onPressed: ()async{
                // var rowid = await sqlt.readData();
                // rowid.forEach((element) {
                //   print(element);
                // });
              },
              child: Text("Read"),
            ),
             ElevatedButton(
              onPressed: ()async{
                Map<String,dynamic> rownew = {
                  SqlDataBase.colId:1,
                  SqlDataBase.colName:"Nervana",
                  SqlDataBase.colContact:"000",
                  SqlDataBase.colDescription:"AA"
                };
                // var rowid = await sqlt.updateData(rownew);
                // print("inserted row  $rowid");
              },
              child: Text("Update"),
            ),
             ElevatedButton(
              onPressed: () async{

                // var rowid = await sqlt.deleteData(1);
              },
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}

