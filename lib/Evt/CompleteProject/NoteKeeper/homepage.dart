import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lastone/Evt/CompleteProject/NoteKeeper/atomic.dart';
import 'package:lastone/Evt/CompleteProject/NoteKeeper/editpage.dart';
import 'package:lastone/Evt/CompleteProject/NoteKeeper/newtaskpage.dart';
import 'atomic.dart';

class apphomepage extends StatefulWidget {
  String username;
  _apphomepagestate obj;
  apphomepage(this.username){
  }
  @override
  State<StatefulWidget> createState() {
    return _apphomepagestate(this.username);
  }
}

class _apphomepagestate extends State<apphomepage> {
  
  int removed=0;
  String username;
  int pagechanged=0;
   List<cardpageview>abc=new List();
   List<editpage>editpagelist=new List();
  _apphomepagestate(this.username){}
  @override
 
  void setremoved(int status) {
    removed=status;
  }
  int getpagechanged() {
    return pagechanged;
  }
  Widget build(BuildContext context) {
    debugPrint("Has removed status: "+ removed.toString());
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 75.0),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                image: AssetImage("images/4.jpg"),
                fit: BoxFit.fill
              )
            ),
            height: 300.0,
            width: 420.0,
            child: Text("Hi "+username,style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0,left: 15.0),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: <Color>[
                  Colors.teal,
                  Colors.tealAccent,
                  Colors.teal,
                ]
              )
            ),
            height: 383.0,
            width: 420.0,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: "Tasks",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 21.0)),
                          TextSpan(text: " Lists",style: TextStyle(color: Colors.black,fontSize: 20.0))
                        ]
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return newtask(abc,this.editpagelist,this);
                          }
                        ));
                      },
                        child: Container(
                        alignment: Alignment.center,
                        height: 32.0,
                        width: 40.0,
                        margin: EdgeInsets.only(left: 235),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.red
                        ),
                        child: Text("+"),
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        if (pagechanged==0) {
                          if (abc.length==0) {
                            
                          }else {
                            if (removed==1) {
                              
                            }else {
                              debugPrint("0"+"wbm");
                              abc.removeAt(0);
                              removed=1;
                            }
                            
                          }
                          debugPrint("1 called");
                          return editpagelist[0];
                        }else {
                          if (removed==1) {
                              
                            }else {
                              debugPrint(pagechanged.toString()+" page change will be removed");
                              abc.removeAt(pagechanged);
                              removed=1;
                            }
                            debugPrint("2 called");
                          return editpagelist[pagechanged];
                        }
                      // if (removed==1) {
                        
                      // }else {
                      //   debugPrint("this con");
                      //   abc.removeAt(1);
                      //   removed=1;
                      // }
                      //   return editpagelist[pagechanged];
                        // if (pagechanged==0) {
                        //   if (abc.length==0) {
                            
                        //   }else {
                        //     if (removed==1) {
                              
                        //     }else {
                        //       debugPrint("0 will be removed");
                        //       abc.removeAt(0);
                        //       removed=1;
                        //     }
                        //     return editpagelist[0];
                        //   }
                        // }else {
                        //   if (abc.length==0) {
                            
                        //   }else {
                        //     debugPrint(pagechanged.toString()+" will be removed");
                        //     abc.removeAt(pagechanged);
                        //     removed=1;
                        //   }
                        //   return editpagelist[pagechanged];
                        // }
                      }
                    ));
                  },
                    child: Container(
                    height: 310.0,
                    width: 250.0,
                    child: Stack(
                     children: <Widget>[
                       Positioned.fill(
                         child: PageView.builder(
                           onPageChanged: (index){
                             debugPrint("pc "+index.toString());
                             pagechanged=index;
                           },
                           controller: PageController(initialPage: 0,viewportFraction: 0.9),
                           itemCount: abc.length,
                           itemBuilder: (context,index){
                            return abc[index];
                           },
                         )
                       )
                     ],
                    ),
                  ),
                )
              ],
            ),
          ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              color: Colors.white70,
            ),
            margin: EdgeInsets.only(top: 125.0,left:32.0),
            height: 160.0,
            width: 350.0,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text("Completed Tasks : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(left: 190.0),
                        child: Text("0",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10.0,top: 8.0),
                        child: Text("Pending Tasks      : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        // TODO : Pending task color change
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(top: 8.0,left: 190.0),
                        child: Text("0",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    padding: EdgeInsets.only(left: 12.0,right: 12.0),
                    child: Divider(color: Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red
                              ),
                              child: Text(""),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Text("0",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15.0)),
                            )
                          ],
                        ),
                         Column(
                           children: <Widget>[
                             Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange
                              ),
                              child: Text(""),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text("0",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 15.0),),
                        )
                           ],
                         ),
                         Column(
                           children: <Widget>[
                             Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue
                              ),
                              child: Text(""),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text("0",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15.0)),
                        )
                           ],
                         )
                      ],
                    ),
                  )
                ],
              )
            )
          )
        ],
      )
    );
  }
  void deletepageview(){
    setState(() {
      abc.removeAt(pagechanged);
      editpagelist.removeAt(pagechanged);
    });
  }

  void delete1() {
    setState(() {
      abc.removeAt(pagechanged);
      debugPrint("deleted");
    });
  }
  void addpageview(String taskname,List<Widget>tile){
    setState(() {
      abc.insert(pagechanged,cardpageview(taskname, tile,this));
      debugPrint("Inserted");
    });
  }
}