import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(BareboneApp());
}

class BareboneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes APP",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
      ),
      home: AppHomepage(),
    );
  }
}

class AppHomepage extends StatefulWidget {
  @override
  _AppHomepageState createState() => _AppHomepageState();
}

class _AppHomepageState extends State<AppHomepage> {
  List<TheNotes> thenotes = new List();
  int notelength=1;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: thenotes.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title: Text(thenotes[index].gettitle()),
              subtitle: Text(thenotes[index].getdescription()),
              leading: CircleAvatar(
                backgroundColor: getprioritycolor(thenotes[index].getpriority()),
                child: Icon(Icons.arrow_right,size: 30.0,),
              ),
              trailing: InkWell(
                onTap: (){
                  setState(() {
                    thenotes.removeAt(index);
                    debugPrint(thenotes.length.toString());
                  });
                },
                child: Icon(Icons.delete),
              ),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(
                  builder: (context) {
                    return NoteEditPage(thenotes,"Edit Notes",title: thenotes[index].gettitle(),subtitle: thenotes[index].getdescription(),index: index,priority: thenotes[index].getpriority(),);
                  }
                ));
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(
            builder: (context){
              return NoteEditPage(this.thenotes,"Add Notes");
            }
          ));
        },
        child: Text("+",style: TextStyle(fontSize: 20.0,color: Colors.white),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
  Color getprioritycolor(int priority) {
    if (priority==1) {
      return Colors.red;
    }else {
      return Colors.yellow;
    }
  }
}

class NoteEditPage extends StatefulWidget {
  List<TheNotes>thenotes;
  String title;
  String subtitle;
  String appbartitle;
  int index;
  int priority;
  NoteEditPage(this.thenotes,this.appbartitle,{this.title,this.subtitle,this.index,this.priority});
  @override
  _NoteEditPageState createState() => _NoteEditPageState(this.thenotes,this.appbartitle,title: this.title,subtitle: this.subtitle,index: this.index,priority: this.priority);
}

class _NoteEditPageState extends State<NoteEditPage> {
  int index;
  List<TheNotes>thenotes;
  List<String> dropdownitem = ["High","Low"];
  String dropdownvalue = "High";
  String appbartitle;
  TextEditingController titlecontroller = new TextEditingController();
  TextEditingController subtitlecontroller = new TextEditingController();
  String title;
  String subtitle;
  _NoteEditPageState(this.thenotes,this.appbartitle,{this.title,this.subtitle,this.index,this.priority});
  int priority;
  Widget build(BuildContext context) {
    titlecontroller.text=title;
    subtitlecontroller.text=subtitle;
    return Scaffold(
      appBar: AppBar(
        title: Text(appbartitle),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height+30,left: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height+20,right: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height+20),
            child: DropdownButton(
              items: dropdownitem.map((items){
                return DropdownMenuItem<String>(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (newvalue){
                setState(() {
                  if (newvalue=="High") {
                    priority=1;
                  }else {
                    priority=2;
                  }
                });
              },
              value: returnpriority(),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 20.0,left: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height+20,right: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height+20),
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),hintText: "Title",hintStyle: TextStyle(color: Colors.grey)),
              controller: titlecontroller,
              onSubmitted: (newtitle){
                setState(() {
                  title=titlecontroller.text;
                });
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10.0,left: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height+20,right: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height+20),
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),hintText: "Description",hintStyle: TextStyle(color: Colors.grey)),
              controller: subtitlecontroller,
              onSubmitted: (newtitle){
                setState(() {
                  subtitle=subtitlecontroller.text;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:30.0,),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width/2-10,
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        if (this.index!=null) {
                          thenotes.removeAt(index);
                          thenotes.insert(index,TheNotes(titlecontroller.text,subtitlecontroller.text,priority));
                        }else {
                          thenotes.add(TheNotes(titlecontroller.text,subtitlecontroller.text,priority));
                        }
                        
                        Navigator.pop(context);
                      });
                    },
                    child: Text("Save"),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2-10,
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        if (index!=null) {
                          thenotes.removeAt(index);
                        }else {
                          
                        }
                        Navigator.pop(context);
                      });
                    },
                    child: Text("Delete"),
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  String returnpriority() {
    if (priority==1) {
      return "High";
    }else {
      return "Low";
    }
  }
}

class TheNotes {
  String title;
  String description;
  int priority;

  TheNotes(this.title,this.description,this.priority);

  String gettitle() {
    return this.title;
  }

  String getdescription() {
    return this.description;
  }

  int getpriority() {
    return this.priority;
  }
}