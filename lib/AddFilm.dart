import 'package:flutter/material.dart';

class AddFilm extends StatefulWidget {
  const AddFilm({Key? key}) : super(key: key);

  @override
  State<AddFilm> createState() => _AddFilmState();
}

class _AddFilmState extends State<AddFilm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
