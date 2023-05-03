import 'package:flutter/material.dart';
import 'package:films/Home.dart';

void main()=>runApp(MyApp());

//On creer un stless widget MyApp
//Pour les plegins Flutter visiter le site web pub.dev
class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Films',
      home: Home()
    );
  }
}
