import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(myapp());
}

final key1 = new GlobalKey<screen1State>();
final keysc = new ObjectKey(screen1State().getwidget);

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      home: screen1(key1),
    );
  }
}

class screen1 extends StatefulWidget {
  @override
  // TODO: implement key
  screen1(Key key):super(key:key);
  @override
  screen1State createState() => screen1State();
}

class screen1State extends State<screen1> {
  Widget get getwidget => TextField();
  String submittedtext;
  String hardcodedtext="HELLOWWWW";
  String get1 (){
    return hardcodedtext;
  }
  String get hardcodedtextget => hardcodedtext;
  String get submittedtextget => submittedtext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen1"),backgroundColor: Colors.blueAccent,),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(hardcodedtext),
             TextField(
               key: keysc,
              style: TextStyle(color: Colors.white,fontSize: 18.0),
              onSubmitted: (submit){
                setState(() {
                  submittedtext=submit;
                });
              },
            ),
            TextField(
              style: TextStyle(color: Colors.white,fontSize: 18.0),
              onSubmitted: (submit){
                setState(() {
                  submittedtext=submit;
                });
              },
            ),
            RaisedButton(
              child: Text("Press ME!"),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(
                  builder: (context){
                    return screen2();
                  }
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}

class screen2 extends StatefulWidget {
  @override
  _screen2State createState() => _screen2State();
}

class _screen2State extends State<screen2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 2"),backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(key1.currentState.submittedtext),
            Text(key1.currentState.get1()),
            keysc.value
          ],
        ),
      ),
    );
  }
}