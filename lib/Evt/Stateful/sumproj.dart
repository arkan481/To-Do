import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lastone/Evt/Stateless/reuseablewidget.dart';

// Individual Unrelated File

main(List<String> args) {
  runApp(sumproj());
}

class sumproj extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _sumprojstate();
  }
}

class _sumprojstate extends State<sumproj>{
  int _i=0;
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Sum Application",
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: appbar1().settext("Sum Application"),
        body: Column(
          children: <Widget>[
            Center(
              child: Text("You have pushed the button "+_i.toString()+" times"),
            ),
            Container(
              margin: EdgeInsets.only(top: 480.0),
              padding: EdgeInsets.only(left: 180.0),
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    onPressed: (){
                      setState(() {
                        _i++;
                        debugPrint(_i.toString());
                      });
                    },
                    child: Text("+",style: TextStyle(color: Colors.white),),
                    color: Colors.blue,
                  ),
                   RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    onPressed: (){
                      setState(() {
                        _i--;
                        debugPrint(_i.toString());
                      });
                    },
                    child: Text("-",style: TextStyle(color: Colors.white),),
                    color: Colors.blue,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  } 
}