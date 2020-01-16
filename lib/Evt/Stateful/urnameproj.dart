import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Individual Unrelated File

main(List<String> args) {
  runApp(urname());
}

class urname extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _urnamestate();
  }
}

class _urnamestate extends State<urname> {
  @override
  String name="urname";
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "name input app",
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Text(name),
              TextField(
                onSubmitted: (String nameinputted){
                  setState(() {
                    name=nameinputted;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}