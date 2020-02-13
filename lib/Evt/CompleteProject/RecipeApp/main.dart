import 'package:flutter/material.dart';
import 'package:lastone/Evt/CompleteProject/RecipeApp/ModelClass.dart';
import 'package:lastone/Evt/CompleteProject/RecipeApp/SecondPage.dart';

main(List<String> args) {
  runApp(BareBoneApp());
}

class BareBoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Recipe App",
      theme: ThemeData(
        primaryColor: Colors.orange,
        brightness: Brightness.light
      ),
      home: AppHomePage(),
    );
  }
}

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  // TODO : HI IS A DUMMY LIST
  // TODO : LAST EDITED STILL DUMMY
  @override
  List<String> dropdownitem = ["Newest","Oldest","A-Z","Z-A"];
  String dropdownvalue = "A-Z";
  List<ModelClass> modelclass = new List();
  Widget build(BuildContext context) {
    final double defwidth = MediaQuery.of(context).size.width-MediaQuery.of(context).size.width;
    final double defheight = MediaQuery.of(context).size.height-MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Text("+",style: TextStyle(color: Colors.white,fontSize: 20.0),),
        onPressed: (){
          setState(() {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return SecondPage(this.modelclass);
              }
            ));
          });
        },
      ),
      appBar: AppBar(
        title: Text("Recipe App",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 6.0,
              child: ListTile(
                trailing: DropdownButton(
                  icon: Icon(Icons.sort),
                  value: dropdownvalue,
                  onChanged: (newitem){
                    setState(() {
                      dropdownvalue=newitem;
                    });
                  },
                  items: dropdownitem.map((items){
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                ),
                leading: Icon(Icons.search),
                title: TextField(
                  decoration: InputDecoration.collapsed(hintText: "Search Recipes",hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-170,
            child: GridView.builder(
              itemCount: modelclass.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.66
              ),
              itemBuilder: (context,index) {
                return Container(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SecondPage(this.modelclass,appbartitle: modelclass[index].gettitle(),ingirdientlist: modelclass[index].getingridients(),modelindexed: modelclass[index],preparationlist: modelclass[index].getsteps(),);
                          }
                        ));
                      });
                    },
                                      child: Card(
                      elevation: 6.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.red,
                            height: 210.0,
                            width: 200,
                            child: Image.asset(modelclass[index].getimage(),fit: BoxFit.cover,),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            alignment: Alignment.topLeft,
                            child: Text(modelclass[index].gettitle(),style: TextStyle(fontSize: 16.0),),
                          ),
                          Container(
                            child: Divider(
                              height: 40.0,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text("Last Edited : 10/20/2001",style: TextStyle(color: Colors.grey,fontSize: 13.0),),
                                Container(
                                  margin: EdgeInsets.only(left: 13.0),
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        debugPrint("Index $index removed");
                                        modelclass.removeAt(index);
                                      });
                                    },
                                    child: Icon(Icons.delete,color: Colors.grey,),
                                  ),
                                )
                              ],
                            )
                          )
                        ]
                      ),
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
}