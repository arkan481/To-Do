import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lastone/Evt/CompleteProject/NoteKeeper/loginpage.dart';



main(List<String> args) {
  runApp(AppBarebone());
}

class AppBarebone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To-Do List App",
      theme: ThemeData(
        canvasColor: Colors.indigo[900],
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(elevation: 10.0,color: Colors.indigo[800])
      ),
      home: loginpage(),
    );
  }
}

