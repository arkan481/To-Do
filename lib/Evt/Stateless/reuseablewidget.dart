import 'package:flutter/material.dart';

/**
 * Declarative Widget Use This Widget For Atomic Design (kind of)
 * Related With Stlessmix.dart
 */

class image1 extends StatelessWidget {
  setimage(String image) {
    return Container(
      child: Image.asset(image),
      width: 100.0,
      padding: EdgeInsets.only(top: 20.0),
    );
  }
  Widget build(BuildContext context) {
  }
}

class appbar1 extends StatelessWidget {
  settext(String text){
    return AppBar(
      title: Text(text),
      centerTitle: true,
      backgroundColor: Colors.amber,
    );
  }
  Widget build(BuildContext context){}
}

class datatextwithborder extends StatelessWidget {
  TextStyle style1 = new TextStyle(color: Colors.white,fontSize: 30.0,fontFamily: "courier");
  settext(String text,IconData icon){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white)
      ),
      margin: EdgeInsets.only(top: 30.0),
      padding: EdgeInsets.only(left: 10.0),
      alignment: Alignment.center,
      width: 500.0,
      child: Row(
        children: <Widget>[
          Icon(icon,color: Colors.blueAccent,size: 40.0,),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text(text,style: style1,)
          )
        ],
      )
    );
  }
  Widget build(BuildContext context){}
}

class roundedrecbutton extends StatelessWidget {
  settext(String text,VoidCallback method) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: 80.0,
        height: 50.0,
        child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        elevation: 7.0,
        onPressed: method,
        child: Text(text,style: TextStyle(fontSize: 15.0)),
        ),
      ) 
    );
  }
  Widget build(BuildContext context){}
}

class helperpopup extends StatelessWidget {
  settext(VoidCallback method){
    return Container(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: method,
        child: Row(
          children: <Widget>[
            Icon(Icons.info),
            Container(
              margin: EdgeInsets.only(left: 7.0),
              child: Text("Help"),
            ),
          ],
        ),
      ),
    );
  }
  Widget build(BuildContext context){
  }
}
