import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:lastone/Evt/CompleteProject/NoteKeeper/atomic.dart';
import 'package:lastone/Evt/CompleteProject/NoteKeeper/newtaskpage.dart';


class editpage extends StatefulWidget {
  var ahpobj;
   List<cardpageview>pageviewlist;
  List<TextEditingController>listtilecontroller;
   List<Widget> listobj;
  editpage(this.listobj,this.listtilecontroller,this.pageviewlist,this.ahpobj);
  @override
  _editpageState createState() => _editpageState(this.listobj,this.listtilecontroller,this.pageviewlist,this.ahpobj);
}

class _editpageState extends State<editpage> {
  var ahpobj;
  List<cardpageview>pageviewlist;
  List<TextEditingController>listtilecontroller;
  List<Widget> listobj;
  _editpageState(this.listobj,this.listtilecontroller,this.pageviewlist,this.ahpobj);
  String title="New Task";
  TextEditingController titlecontroller = new TextEditingController();
  
  int intfortemp;
  var intforpageview=0;
  @override
  Widget build(BuildContext context) {
    debugPrint("the page change "+ahpobj.getpagechanged().toString());
    debugPrint("iam the list "+pageviewlist.length.toString());
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
               listtilecontroller.insert(listobj.length,TextEditingController());
               listobj.insert(listobj.length,listtile(listtilecontroller[listobj.length]));
               debugPrint("after + "+listobj.length.toString());
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
                //here page changed
                if (pageviewlist.length==0) {
                  pageviewlist.insert(0,cardpageview("taskname",this.listobj, ahpobj));
                }else {
                  pageviewlist.insert(ahpobj.getpagechanged()+1,cardpageview(titlecontroller.text,this.listobj, ahpobj));
                }
              });
              // setState(() {
              //   pageviewlist.insert(1,cardpageview(titlecontroller.text,this.listobj,ahpobj));
            
              // });
                  ahpobj.setremoved(0);
                Navigator.pop(context);
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
  void deletelist(){
    setState(() {
      if (listobj.length==0) {
      }else {
      listobj.removeAt(listobj.length-1);
      listtilecontroller.removeAt(listtilecontroller.length-1);
      debugPrint(listobj.length.toString());
      debugPrint(listtilecontroller.length.toString());
      }
     
    });
   
  }
}