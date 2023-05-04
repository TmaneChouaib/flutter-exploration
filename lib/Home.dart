import 'package:films/SQLDB.dart';
import 'package:films/UpdateFilm.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  SQLdb sqLdb = SQLdb();


  //------------------method to getAllFilms from the database-------------------
  Future<List<Map>> getAllFilms() async{
    List<Map> films = await sqLdb.getData("SELECT * FROM 'films'");
    return films;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed("addFilm");
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),

      appBar: AppBar(title:Text("Home"),
      backgroundColor: Colors.black),

      body: Container(
        margin: EdgeInsets.all(10),
        child:  Column(
          children: [
                Expanded(flex: 10,
                    child: Container(
                      child: FutureBuilder(
                        future: getAllFilms(),
                        builder: (ctx,snp){
                          if(snp.hasData){
                            List<Map> listFilms = snp.data!;
                            return ListView.builder(
                                itemCount: listFilms.length,
                                itemBuilder: (ctx,index){
                              return Card(
                                child: ListTile(
                                  leading: Icon(Icons.movie,color: Colors.amber,size:20),
                                  title: Text("${listFilms[index]['title']}",
                                    style:TextStyle(fontSize: 25, color:Colors.black),),
                                  subtitle: Text("${listFilms[index]['duration']} min",
                                    style:TextStyle(fontSize: 25, color:Colors.black),),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min ,
                                    children: [
                                      TextButton(onPressed: (){
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context)=>UpdateFilm(
                                              id: listFilms[index]['id'],
                                            title: listFilms[index]['title'],
                                          duration: listFilms[index]['duration'],))
                                        );
                                      }, child: Icon(Icons.edit, color:Colors.green , size: 25,)),
                                      TextButton(onPressed: (){
                                        showDialog(context: context, builder: (context)=>AlertDialog(
                                          title: Text("Are shure you want to delete ${listFilms[index]['title']}"),
                                          actions: [
                                            ElevatedButton(onPressed: () async{
                                              int rep = await sqLdb.deleteData(
                                                  "Delete From 'films' where id= ${listFilms[index]['id']}"
                                              );
                                              if (rep>0){
                                                Navigator.of(context).pop();
                                                setState(() {
                                                });
                                              }
                                            }, child: Text("Yes")),
                                            ElevatedButton(onPressed: (){
                                              Navigator.of(context).pop();
                                            }, child: Text("No"))
                                          ],
                                        ));
                                      }, child: Icon(Icons.delete, color:Colors.pink , size: 25,))
                                    ],
                                  ),
                                ),
                              );
                            }) ;
                          }else{
                            return Center(child:CircularProgressIndicator(),);
                          }
                        },
                      ),
                )),
                Expanded(flex: 2,
                    child: Container(
                ))
          ],
        ),
    ),
    );
  }
}
