import 'package:films/Home.dart';
import 'package:flutter/material.dart';
import 'SQLDB.dart';


class UpdateFilm extends StatefulWidget {
  final id;
  final title;
  final duration;

  const UpdateFilm ({Key? key, this.id , this.title , this.duration }) : super(key: key);


  @override
  State<UpdateFilm> createState() => _UpdateFilmState();
}


class _UpdateFilmState extends State<UpdateFilm> {
  TextEditingController title = TextEditingController();
  TextEditingController duration= TextEditingController();
  SQLdb sqLdb=SQLdb();


@override
  void initState() {
  title.text=widget.title;
  duration.text=widget.duration.toString();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Film"),backgroundColor: Colors.black),
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
            ElevatedButton(onPressed: ()async{
              int rep = await sqLdb.updateData('''
              UPDATE "films" SET 
              title="${title.text}",
              duration=${int.parse(duration.text)}
              WHERE id = "${widget.id}"
              ''');
              if (rep>0){
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context)=>Home()),
                        (route) => false);
              }
            } ,
                child: Container(child: Icon(Icons.update,size:30,),width:double.infinity,
                    color: Colors.black))          ],
        ),
      ),
    );
  }
}
