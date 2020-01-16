import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(dropdowntest());
}

class dropdowntest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "DropDown With Twist",
      home: dropdowntestmainpage(),
      theme: ThemeData.dark(),
    );
  }
}

class dropdowntestmainpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _dropdowntestmainpagestate();
  }
}

class _dropdowntestmainpagestate extends State<dropdowntestmainpage> {
  @override
  String _newdata;
  var _items = [""];
  String currentitems="";
  bool _validation=false;
  var _txtcontroller = new TextEditingController();
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Data Into Drop Down"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 80.0),
              child: TextField(
                controller: _txtcontroller,
                decoration: InputDecoration(
                  hintText: "Input Your Data",
                  icon: Icon(Icons.add),
                  errorText: _validation? "value cant be empty":null
                ),
                onSubmitted: (String tfsubmitted){
                  setState(() {
                    if(tfsubmitted.isEmpty){
                      _validation=true;
                    }else {
                     _newdata=tfsubmitted;
                     debugPrint(_newdata);
                     _items.add(_newdata);
                     debugPrint(_items.toString());
                     _validation=false;
                     _txtcontroller.text="";
                    }
                  });
                },
              ),
            ),
            DropdownButton<String>(
              items: _items.map((String newitem){
                return DropdownMenuItem<String>(
                  value: newitem,
                  child: Text(newitem),
                );
              }).toList(),
              onChanged: (String value){
                setState(() {
                  currentitems = value;
                });
              },
              value: currentitems,
            ),
            Text(currentitems)
          ],
        ),
      ),
    );
  }
}

