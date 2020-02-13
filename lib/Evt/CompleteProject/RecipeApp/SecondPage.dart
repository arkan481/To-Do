import 'package:flutter/material.dart';
import 'ModelClass.dart';

class SecondPage extends StatefulWidget {
  List<String> preparationlist;
  List<ModelClass> modelclass;
  ModelClass modelindexed;
  List<String> ingirdientlist;
  String appbartitle;
  @override
  SecondPage(this.modelclass,{this.appbartitle,this.ingirdientlist,this.modelindexed,this.preparationlist});
  _SecondPageState createState() => _SecondPageState(this.modelclass,appbartitle2: this.appbartitle,ingirdientlist: this.ingirdientlist,modelindexed: this.modelindexed,preparationlist: this.preparationlist);
}

class _SecondPageState extends State<SecondPage> {
  // TODO : IS UPDATING SET ENABLED WIDGET
  @override
  bool isupdating = false;
  bool hascalled = false;
  ModelClass modelindexed;
  List<ModelClass> modelclass;
  List<String> preparationlist = new List();
    String appbartitle = "Add Recipe"; // DUMMY
    String appbartitle2;
    double ingridientheight = 0;
    double preparationheight = 0;
    List<String> ingirdientlist = new List();
    List<TextEditingController> textcontroller = new List();
    List<TextEditingController> preparationcontroller = new List();
    TextEditingController titlecontroller = new TextEditingController();
    _SecondPageState(this.modelclass,{this.appbartitle2,this.ingirdientlist,this.modelindexed,this.preparationlist});
    List<String> getpreparationlist() {
      setState(() {
        for (var i = 0; i < preparationcontroller.length; i++) {
          preparationlist.add(preparationcontroller[i].text);
        }
      });
      return preparationlist;
    }
    List<String> getingridientlist() {
      setState(() {
        for (var i = 0; i < textcontroller.length; i++) {
        ingirdientlist.add(textcontroller[i].text);
        debugPrint(textcontroller[i].text);
        debugPrint("The length is "+ ingirdientlist.length.toString());
      }
      });
      return ingirdientlist;
    }
  Widget build(BuildContext context) {
    if (this.modelindexed!=null) {
      isupdating = true;
      debugPrint("this called");
      if (hascalled==true) {
      }else {
        setState(() {
        titlecontroller.text=appbartitle2;
        this.appbartitle=appbartitle2;
        for (var i = 0; i < preparationlist.length; i++) {
          preparationheight = preparationheight+65;
          preparationcontroller.add(TextEditingController());
          preparationcontroller[i].text=preparationlist[i];
        }
        for (var i = 0; i < ingirdientlist.length; i++) {
          ingridientheight = ingridientheight+65;
          textcontroller.add(TextEditingController());
          textcontroller[i].text=ingirdientlist[i];
        }
        hascalled=true;
      });
      }
    }else {
      debugPrint("Second Called");
      setState(() {
        ingirdientlist = new List();
        preparationlist = new List();
      });
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
           if (isupdating==true) {
             preparationlist = new List();
             ingirdientlist = new List();
             modelindexed.setimage("images/GreekSalad.jpg");
             modelindexed.setingridients(getingridientlist());
             modelindexed.settitle(titlecontroller.text);
             modelindexed.setsteps(getpreparationlist());
           }else {
              modelclass.add(ModelClass(titlecontroller.text, getingridientlist(), getpreparationlist(), "images/GreekSalad.jpg"));
           }
            Navigator.pop(context);
          });
        },
        child: Icon(Icons.done,size: 25.0,),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      appBar: AppBar(title: Text(appbartitle),backgroundColor: Theme.of(context).primaryColor,actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 13.0),
          child: InkWell(
            onTap: (){
              // HERE
            },
            child: Icon(Icons.edit),
          ),
        )
      ],),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 30.0,left: 10.0,right: 10.0),
            child: TextField(
              style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Input Food Title Here..."
              ),
              controller: titlecontroller,
              onSubmitted: (titlevalue){
                setState(() {
                  titlecontroller.text=titlevalue;
                });
              },
            ),
          ),
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height/2.3,
            margin: EdgeInsets.only(top: 20.0),
            child:  Image.asset("images/GreekSalad.jpg",fit: BoxFit.cover,), // DUMMY
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            margin: EdgeInsets.only(top: 13.0,left: 10.0),
            child: Text("Ingredients",style:  TextStyle(color: Colors.black,fontSize: 22.0,fontWeight: FontWeight.bold),),
          ),
          Container(
            margin: EdgeInsets.only(top: 2.0,left: 10.0),
            child: Text("for 4 servings",style: TextStyle(fontSize: 19.0),),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            width: MediaQuery.of(context).size.width,
            height: ingridientheight,
            child: ListView.builder(
              itemCount: textcontroller.length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.lightBlue,
                  elevation: 6.0,
                  child: ListTile(
                    // title: Text("items $index",style: TextStyle(color: Colors.white),),
                    title: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: "Ingridients $index",
                        hintStyle: TextStyle(
                          color: Colors.white70
                        )
                      ),
                      style: TextStyle(color: Colors.white),
                      controller: textcontroller[index],
                      onSubmitted: (s){
                        setState(() {
                          textcontroller[index].text=s;
                        });
                      },
                    ),
                    leading: InkWell(
                      onTap: (){
                        setState(() {
                          textcontroller.removeAt(index);
                          ingridientheight=ingridientheight-65;
                        });
                      },
                      child: Icon(Icons.delete,color: Colors.white,),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            child: Card(
              elevation: 6.0,
              color: Colors.lightBlue,
              child: ListTile(
                leading: Icon(Icons.add_circle,color: Colors.white,),
                title: Text("Add Ingridients",style: TextStyle(color: Colors.white)),
                onTap: (){
                  setState(() {
                    textcontroller.add(TextEditingController());
                    ingridientheight = ingridientheight+65;
                    debugPrint("Textcontroller list length "+ textcontroller.length.toString());
                  });
                },
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 13.0,left: 10.0),
            child: Text("Preparation",style:  TextStyle(color: Colors.black,fontSize: 22.0,fontWeight: FontWeight.bold),),
          ),
           Container(
            margin: EdgeInsets.only(top: 20.0),
            width: MediaQuery.of(context).size.width,
            height: preparationheight,
            child: ListView.builder(
              itemCount: preparationcontroller.length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.pink,
                  elevation: 6.0,
                  child: ListTile(
                    // title: Text("items $index",style: TextStyle(color: Colors.white),),
                    title: TextField(
                      style: TextStyle(
                        color: Colors.white
                      ),
                      decoration: InputDecoration.collapsed(
                        hintText: "Preparation $index",
                         hintStyle: TextStyle(
                          color: Colors.white70
                        )
                      ),
                      controller: preparationcontroller[index],
                      onSubmitted: (preparations){
                        preparationcontroller[index].text=preparations;
                      },
                    ),
                    leading: InkWell(
                      onTap: (){
                        setState(() {
                          preparationcontroller.removeAt(index);
                          preparationheight=preparationheight-65;
                        });
                      },
                      child: Icon(Icons.delete,color: Colors.white,),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            child: Card(
              elevation: 6.0,
              color: Colors.pink,
              child: ListTile(
                leading: Icon(Icons.add_circle,color: Colors.white,),
                title: Text("Add Preparation",style: TextStyle(color: Colors.white)),
                onTap: (){
                  setState(() {
                    preparationcontroller.add(TextEditingController());
                    preparationheight = preparationheight+65;
                  });
                },
              )
            ),
          ),
        ],
      ),
    );
  }
}