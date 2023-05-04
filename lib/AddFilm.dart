import 'package:films/Home.dart';
import 'package:films/SQLDB.dart';
import 'package:flutter/material.dart';


class AddFilm extends StatefulWidget {
  const AddFilm({Key? key}) : super(key: key);


  @override
  State<AddFilm> createState() => _AddFilmState();
}


class _AddFilmState extends State<AddFilm> {
  TextEditingController title = TextEditingController();
  TextEditingController duration= TextEditingController();
  SQLdb sqLdb=SQLdb();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add"),backgroundColor: Colors.black,),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextField(
              controller: title,
              style: TextStyle(fontSize: 20,color: Colors.black),
              decoration: InputDecoration(
                labelText:"Title",
                border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
              ),
             ),
            SizedBox(height: 20,),
            TextField(
              controller: duration,
              style: TextStyle(fontSize: 20,color: Colors.black),
              decoration: InputDecoration(
                labelText:"duration",
                border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
              ),
            ),
            SizedBox(height: 20,),
              ElevatedButton(
                  onPressed:() async{
                    int rep = await sqLdb.insertData(
                        "INSERT INTO 'films' (title,duration) VALUES('${title.text}',${int.parse(duration.text)})"
                    );
                  if (rep>0)
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context)=>Home()),
                            (route) => false);
                    },
                  child: Container(
                    child: Icon(Icons.add,size:30,),
                    width:double.infinity,
                    decoration: BoxDecoration(color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  ),
              ),
          ],
        ),
      ),
    );
  }
}
