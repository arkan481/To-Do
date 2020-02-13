import 'package:flutter/material.dart';
import 'package:lastone/Evt/CompleteProject/NoteKeeper/homepage.dart';
import 'package:lastone/Evt/CompleteProject/NoteKeeper/signuppage.dart';
import 'atomic.dart';

class loginpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loginpagestate();
  }
}


class _loginpagestate extends State<loginpage> {
  bool passwordshow = true;
  String dummyusername = "test1";
  String dummypass = "test1pass";
  String wrongpass="";
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: grad1()
            ),
          ),
          Center(
            child:Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.black54
            ),
            alignment: Alignment.center,
            height: 370.0,
            width: 320.0,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 28.0,fontFamily: "anton"))
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
                  child: TextField(
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(fontFamily: appfont)
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  child: TextField(
                    obscureText: passwordshow,
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(fontFamily: appfont),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          showpassword();
                        },
                        child: Icon(passwordshow?Icons.visibility_off:Icons.visibility),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: 265,
                  child: RaisedButton(
                    elevation: 27.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                    onPressed: (){
                     setState(() {
                        if (usernamecontroller.text==dummyusername&&passwordcontroller.text==dummypass) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return apphomepage( usernamecontroller.text,);
                            }
                          ));
                        debugPrint("Login Successful");
                        wrongpass="";
                      }else {
                        debugPrint("Login Failed");
                        wrongpass="Wrong username or password!";
                      }
                     });
                    },
                    child: Text("login"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: InkWell(
                    child: Text("Forgot Password?",style: TextStyle(color: Colors.white60)),
                    onTap: (){debugPrint ("Forgot Password tapped");},
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  alignment: Alignment.center,
                  child: Text(wrongpass,style: TextStyle(fontFamily: appfont,color: Colors.red,fontSize: 15.0),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0,right: 240.0),
                  child: InkWell(
                    child: Text("Sign Up",style: TextStyle(color: Colors.white60)),
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(
                        builder: (context) {
                          return signuppage();
                        }
                      ));
                    },
                  )
                )
              ],
            )
          )),
        ],
      ),
    );
  }
  String getusername(){
    return usernamecontroller.text;
  }
  void showpassword() {
    setState(() {
      passwordshow=!passwordshow;
    });
  }
}