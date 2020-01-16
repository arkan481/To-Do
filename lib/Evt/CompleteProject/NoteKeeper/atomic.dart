import 'package:flutter/material.dart';


String appfont = "anton"; // app default font

Gradient grad1 () { //Gradient theme for login and signup
  return LinearGradient(
    colors: <Color>[
      Colors.indigo,
      Colors.blueAccent,
      Colors.deepPurpleAccent
    ]
  );
}

Container logsigncon ({Widget child,double height,double width}) { //Rounded Box Container for login and signup
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.black54
    ),
    alignment: Alignment.center,
    height: height,
    width: width,
    child: child,
  );
}

class cardpageview extends StatefulWidget {
   String taskname;
   List<Widget>tile;
   cardpageview(this.taskname,this.tile);
  @override
  _cardpageviewState createState() => _cardpageviewState(this.taskname,this.tile);
}

class _cardpageviewState extends State<cardpageview> {
  String taskname;
   List<Widget>tile;
   _cardpageviewState(this.taskname,this.tile);
  @override
  Widget build(BuildContext context) {
    return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.0),topRight: Radius.circular(15.0),bottomLeft: Radius.circular(4.0),topLeft: Radius.circular(4.0))),
    elevation: 8.0,
    color: Colors.white70,
    child: SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5.0,left: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                    child: Text(this.taskname,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0)),
                  ),
                ),
                // Expanded(
                //   child: Container(
                //     margin: EdgeInsets.only(left: 72.0),
                //     child: InkWell(
                //       child: Text("+",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.indigo),),
                //       onTap: (){
                //         //TODO : New Screen
                //         debugPrint("+ tapped");
                //       },
                //     ),
                //   ),
                // )
              ],
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            width: 400.0,
            height: 551.4,
            child: ListView.builder(
              itemCount: tile.length,
              itemBuilder: (context,index){
                return tile[index];
              },
            )
          )
        ],
      ),
    ),
  ); 
  }
}

class scaffoldfor extends StatelessWidget {
  Widget body;
  scaffoldfor(this.body);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white70,
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: Column(
        children: <Widget>[
          body
        ],
      ),
    );
  }
}

