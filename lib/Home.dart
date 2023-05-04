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


  //------------method to getAllFilms from the database---------------
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
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title:Text("Home") ,),
      body: Container(
        margin: EdgeInsets.all(10),
        child:  Column(
          children: [
 /*           ElevatedButton(
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
                child: Text("Display")),*/
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
                                  leading: Icon(Icons.movie,color: Colors.pink,size:20),
                                  title: Text("${listFilms[index]['title']}",style:TextStyle(fontSize: 25, color:Colors.pinkAccent),),
                                  subtitle: Text("${listFilms[index]['duration']} min",style:TextStyle(fontSize: 25, color:Colors.indigoAccent),),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min ,
                                    children: [
                                      TextButton(onPressed: (){}, child: Icon(Icons.edit, color:Colors.green , size: 15,)),
                                      TextButton(onPressed: (){}, child: Icon(Icons.delete, color:Colors.red , size: 15,))

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
