import 'package:flutter/material.dart';


//On creer un stful widget Home
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Home") ,),
      body: Center(child: Text("Page Home"),),
    );
  }
}
