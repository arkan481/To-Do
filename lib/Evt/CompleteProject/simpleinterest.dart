import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(appbarebone());
}

class appbarebone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      home: apphomepage(),
    );
  }
}

class apphomepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _apphomepagestate();
  }
}

class _apphomepagestate extends State<apphomepage> {
  var _items = ["RP","USD","Lira"];
  String itemcurrentlyselected="USD";
  String _test="oyy";
  var _txtcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Interest Calculator"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30.0,bottom: 30.0),
            child: Center(
              child: Image.asset("images/simpinter.png",height: 130.0,)
            ),
          ),
          tf1("Principal",Icons.open_in_browser),
          tf1("Rate of Interest",Icons.open_with),
          Container(
            child: Row(
              children: <Widget>[
               Expanded(
                 child: Container(
                   child: tf1("Terms",Icons.adjust)
                 ),
               ),
               Expanded(
                 child: Container(
                   margin: EdgeInsets.only(top: 12),
                   child: dropdown(),
                 )
               )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.only(left: 55.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 150,
                  child: RaisedButton(
                    child: Text("Calculate"),
                    onPressed: (){},
                  ),
                ),
                Container(
                  width: 150,
                  child: RaisedButton(
                    color: Colors.black38,
                    child: Text("Reset"),
                    onPressed: (){
                     _txtcontroller.text="";
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void settest(String ok){
    _test=ok;
  }

  Container tf1 (String hinttext,IconData icon){
  return Container(
    padding: EdgeInsets.only(left: 10.0,right: 20.0),
    child: TextField(
      controller: _txtcontroller,
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: hinttext
      ),
      onSubmitted: (String ok){
        setState((){
          settest(ok);
        });
      },
    ),
  );
}

Container dropdown () {
  return Container(
    padding: EdgeInsets.only(right: 20.0),
    child: DropdownButton(
      items: _items.map((String itemsall){
        return DropdownMenuItem<String>(
          value: itemsall,
          child: Text(itemsall),
        );
      }).toList(),
      onChanged: (String ok){
        setState((){
          itemcurrentlyselected=ok;
          debugPrint(itemcurrentlyselected);
        });
      },
      value: itemcurrentlyselected,
    ),
  );
}

}



