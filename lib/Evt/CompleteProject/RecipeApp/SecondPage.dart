import 'package:flutter/material.dart';
import 'ModelClass.dart';

class SecondPage extends StatefulWidget {
  List<ModelClass> modelclass;
  @override
  SecondPage(this.modelclass);
  _SecondPageState createState() => _SecondPageState(this.modelclass);
}

class _SecondPageState extends State<SecondPage> {
  @override
  List<ModelClass> modelclass;
    String appbartitle = "DUMMY"; // DUMMY
    String foodtitle="Hearty Potato Salad"; // DUMMY
    int dummylength =1;
    double ingridientheight = 0;
    double preparationheight = 0;
    List<String> dummylist = new List(); 
    List<String> ingirdientlist = new List();
    List<TextEditingController> textcontroller = new List();
    _SecondPageState(this.modelclass);
    List<String> getingridientlist() {
      setState(() {
        for (var i = 0; i < textcontroller.length; i++) {
        ingirdientlist.add(textcontroller[i].text);
        debugPrint(textcontroller[i].text);
      }
      });
      return ingirdientlist;
    }
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            modelclass.add(ModelClass("Test 23", getingridientlist(), getingridientlist(), "images/GreekSalad.jpg"));
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
            margin: EdgeInsets.only(top: 30.0,left: 10.0),
            child: Text(foodtitle,style: TextStyle(color: Colors.black,fontSize: 25.0,fontWeight: FontWeight.bold),),
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
              itemCount: dummylist.length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.pink,
                  elevation: 6.0,
                  child: ListTile(
                    title: Text("items $index",style: TextStyle(color: Colors.white),),
                    leading: InkWell(
                      onTap: (){
                        setState(() {
                          dummylist.removeAt(index);
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
                    dummylist.add("value");
                    preparationheight = preparationheight+65;
                    debugPrint("Dummy list length "+ dummylist.length.toString());
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