import 'package:flutter/material.dart';
import 'package:lastone/Evt/SqfLite/Name%20Management/dbhelper.dart';
import 'package:lastone/Evt/SqfLite/Name%20Management/modelclass.dart';
import 'package:sqflite/sqflite.dart';

main(List<String> args) {
  runApp(BareboneApp());
}

class BareboneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        brightness: Brightness.dark,
        accentColor: Colors.lightBlue
      ),
      title: "Name Storer",
      home: AppHomePage(),
    );
  }
}

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  int length;
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<namemodel> namelist;
  namemodel model;
  TextEditingController textfieldcontroller = new TextEditingController();
  bool update = false;
  Widget build(BuildContext context) {
    if (namelist==null) {
      debugPrint("This called");
      namelist = List();
      updatelistview();
    }
     double defwidth = MediaQuery.of(context).size.width-MediaQuery.of(context).size.width;
     double defheigth = MediaQuery.of(context).size.height-MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("NAMEEEEEE!!!"),backgroundColor: Theme.of(context).primaryColor,),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: defheigth+30),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: textfieldcontroller,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),hintText: "Input Your Name Here...",hintStyle: TextStyle(color: Colors.grey)),
              onSubmitted: (value){
                setState(() {
                  if (this.update==true) {
                    model.setname(textfieldcontroller.text);
                    databaseHelper.updatename(model);
                    this.update=false;
                    updatelistview();
                  }else {
                  namelist.add(namemodel(textfieldcontroller.text));
                  databaseHelper.insertname(namelist.last);
                  }
                  textfieldcontroller.text="";
                  updatelistview();
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: defheigth+10),
            child: Divider(
              color: Colors.white,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height-195,
            child: ListView.builder(
              itemCount: this.length, // here
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        debugPrint("im called");
                        this.update=true;
                        textfieldcontroller.text=namelist[index].getname();
                        model=namelist[index];
                      });
                    },
                    title: Text(namelist[index].getname()),
                    trailing: InkWell(
                      onTap: (){
                        setState(() {
                          databaseHelper.deletename(namelist[index]);
                          updatelistview();
                        });
                      },
                      child: Icon(Icons.delete),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
  void updatelistview() {
		final Future<Database> dbFuture = databaseHelper.initializeDatabase();
		dbFuture.then((database) {
			Future<List<namemodel>> noteListFuture = databaseHelper.getnamelist();
			noteListFuture.then((noteList) {
				setState(() {
				  this.namelist = noteList;
				  this.length = noteList.length;
				});
			});
		});
  }
}