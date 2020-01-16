import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reuseablewidget.dart';

// Main file related to reusablewidget.dart

main(List<String> args) {
  runApp(rootapp());
}

class rootapp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Arsenal of Stateless Widget",
      theme: ThemeData.dark(),
      home: homepageapp()
    );
  }
}

class homepageapp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar1().settext("hi"),
      body: Column(
        children: <Widget>[
          Center(
            child: image1().setimage("images/Bill.png"),
          ),
          datatextwithborder().settext("Personal Data",Icons.accessibility),
          datatextwithborder().settext("Career", Icons.business_center),
          datatextwithborder().settext("Wages", Icons.attach_money),
          datatextwithborder().settext("Location", Icons.location_on),
          roundedrecbutton().settext("Save", (){
            AlertDialog abc = new AlertDialog(
              title: Text("Data has been saved successfuly"),
            );
            showDialog(
              context: context,
              builder: (BuildContext context){
                return abc;
              }
            );
          }),
          Container(
            margin: EdgeInsets.only(top: 55.0),
            child: helperpopup().settext((){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return popscreeninformation().settext();
                })
              );
            }),
          )
        ],
      ),
    );
  }
}

class popscreeninformation extends StatelessWidget{
  settext(){
    return Scaffold(
      appBar: appbar1().settext("Information"),
    );
  }
  Widget build(BuildContext context){}
}

