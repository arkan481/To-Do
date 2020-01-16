
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(listwidget());
}

class listwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List View",
      theme: ThemeData.dark(),
      home: listexp(),
    );
  }
}

class listexp extends StatelessWidget {
  generatei abc = new generatei();
  int b;
  int c;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     floatingActionButton: FloatingActionButton(
       onPressed: (){},
       child: Text("+",style: TextStyle(color: Colors.white,fontSize: 20.0)),
       backgroundColor: Colors.blue,
     ),
     appBar: AppBar(title: Text("List View"),backgroundColor: Colors.blueAccent,),
     body: Column(
       children: <Widget>[
         Expanded(
           child: listviewwidget(),
         ),
         RaisedButton(
           onPressed: (){
             b=abc.geti();
             b++;
             abc.seti(b);
             print(abc.geti());
           },
           child: Text("+"),
         ),
         RaisedButton(
           onPressed: (){
             c=abc.geti();
             c--;
             abc.seti(c);
             print(abc.geti());
           },
           child: Text("-"),
         ),
       ],
     ),
   );
  }
}



class generatei {
  int i =0;
  sum() {
    i++;
    return i;
  }
  min(){
    i--;
    return i;
  }
  seti(int o){
    i=o;
  }
  geti(){
    return i;
  }
}

List<String> listelement() {
  List<String> element = List<String>.generate(1000,(counter)=> "Item $counter");
  return element;
}

Widget listviewwidget() {
  var listelement2 = listelement();
  ListView listView = ListView.builder(
    itemBuilder: (context,index){
      return ListTile(
        title: Text(listelement2[index]),
        onTap: (){
          print(listelement2[index]+" was tapped");
        },
      );
    },
  );
  return listView;
}