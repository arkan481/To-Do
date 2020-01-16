import 'package:flutter/material.dart';
import 'package:lastone/Evt/CompleteProject/NoteKeeper/atomic.dart';
import 'homepage.dart';

class newtask extends StatefulWidget {
  List<cardpageview>pageviewlist;
  newtask(this.pageviewlist);
  @override
  _newtaskState createState() => _newtaskState(this.pageviewlist);
}

class _newtaskState extends State<newtask> {
  List<cardpageview>pageviewlist;
  _newtaskState(this.pageviewlist);
  String title="New Task";
   TextEditingController titlecontroller = new TextEditingController();
  int intforlist =0;
  var intforpageview=0;
  List<listtile> listobj = new List();
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      floatingActionButton: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 285.0,right: 10.0),
            child: FloatingActionButton(
              heroTag: "Hero1",
              onPressed: (){
                deletelist();
              },
              backgroundColor: Colors.blue,
              child: Text("-",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0)),
            )),
          FloatingActionButton(
            heroTag: "Hero2",
            onPressed: (){
              setState(() {
               listtilecontroller.insert(intforlist,TextEditingController());
               listobj.insert(intforlist,listtile(listtilecontroller[intforlist],this));
               intforlist++;
               debugPrint(intforlist.toString());
              });
            },
            backgroundColor: Colors.blue,
            child: Text("+",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),
          ),
        ],
      ),
      appBar: AppBar(title: Text(this.title),backgroundColor: Colors.blue,actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 14),
          child: InkWell(
            child: Icon(Icons.done,size: 30.0,),
            onTap: (){
              setState(() {
                if (pageviewlist.length==0) {
                  debugPrint("pv "+pageviewlist.length.toString());
                  pageviewlist.insert(0,new cardpageview(titlecontroller.text,listobj,));
                }else {
                  pageviewlist.insert(pageviewlist.length,new cardpageview(titlecontroller.text,listobj));
                }
                Navigator.pop(context);
              });
            },
          ),
        )
      ],),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
                padding: EdgeInsets.only(right: 100.0),
                margin: EdgeInsets.only(top: 10.0,left: 10.0),
                alignment: Alignment.center,
                child: TextField(
                  controller: titlecontroller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    errorText: titlecontroller.text.isEmpty?"Please input the title":null,
                    labelText: "Input The Title Name...",
                    labelStyle: TextStyle(color: Colors.black45),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                    )
                  ),
                  onSubmitted: (String){
                    setState(() {
                      title=titlecontroller.text;
                    });
                  },
                )
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(right: 150.0),
                margin: EdgeInsets.only(top: 20.0,left: 10.0),
                child: RaisedButton.icon(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  elevation: 10.0,
                  icon: Icon(Icons.calendar_today),
                  label: Text("Tap To Select The Date"),
                  onPressed: (){
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2021),
                      initialDate: DateTime.now(),
                      );
                  },
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 3.0),
                padding: EdgeInsets.only(right: 10.0,left: 10.0),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Container(
                // color: Colors.red,
                height: 415.0,
                margin: EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  itemCount: listobj.length,
                  itemBuilder: (context,index){
                    return listobj[index];
                  },
                )
              )
        ],
      ),
    );
  }
  List<TextEditingController>listtilecontroller=new List();
  void deletelist(){
    setState(() {
       intforlist--;
      listobj.removeAt(intforlist);
      debugPrint(intforlist.toString());
    });
   
  }
}

class listtile extends StatefulWidget {
  _newtaskState obj;
  TextEditingController controller;
  listtile(this.controller,this.obj);
  @override
  _listtileState createState() => _listtileState(this.controller,this.obj);
  void turngreen(){}
}

class _listtileState extends State<listtile> {
  int red=0;
int blue=0;
static int orange=0;
  _newtaskState obj;
  Container value;
  TextEditingController controller;
  _listtileState(this.controller,this.obj);
  var abc = [
    Container(
      height: 20.0,
      width: 20.0,
      child: Text(""),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.orange
      ),
    ),
    Container(
      height: 20.0,
      width: 20.0,
      child: Text(""),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue
      ),
    ),
    Container(
      height: 20.0,
      width: 20.0,
      child: Text(""),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: TextField(
          controller: this.controller,
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.grey,fontSize: 11.0),
            labelText: "Input your task here...",
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
          ),
          cursorColor: Colors.black,
          style: TextStyle(color: Colors.black,fontSize: 13.0),
          onSubmitted: (String){
            setState(() {
              debugPrint(controller.text);
            });
          },
        ),
        // leading: InkWell(
        //   onTap: (){
        //     setState(() {
        //       obj.deletelist();
        //     });
        //   },
        //   child: Icon(Icons.delete_sweep,color: Colors.black,),
        // ),
        trailing: DropdownButton<Container>(
          key: new Key(""),
          iconEnabledColor: Colors.grey,
         // hint: Text("Priority",style: TextStyle(color: Colors.black,fontSize: 14.0),),
          items: abc.map((Container ok){
            return DropdownMenuItem<Container>(
              child: ok,
              value: ok,
            );
          }).toList(),
          onChanged: (Container k){
            setState(() {
              if (k==abc[0]) {
                orange++;
                debugPrint(orange.toString());
              }
              value=k;
            });
          },
           value: value,
        )
      ),
    );
  }
  void turngreen(){}
}