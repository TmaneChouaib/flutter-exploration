import 'package:films/SQLDB.dart';
import 'package:flutter/material.dart';


//On creer un stful widget Home
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SQLdb sqLdb = SQLdb();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Home") ,),
      body: Container(
        margin: EdgeInsets.all(15),
        child:  Column(
          children: [
            ElevatedButton(
                onPressed: ()async{
                  int rep =await sqLdb.insertData("INSERT INTO 'films'(title,duration) VALUES ('Hdidane','90')");
                    print("${rep}");
            },
                child: Text("Insert")),
            ElevatedButton(
                onPressed: ()async{
                  List<Map> films = await sqLdb.getData("SELECT * FROM 'films'");
                  print("${films}");
                },
                child: Text("Display")),

          ],
        ),
        
    ),
    );
  }
}
