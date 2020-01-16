import 'package:flutter/material.dart';
import 'atomic.dart';

// TODO : Next check if username exist

class signuppage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _signuppagestate();
  }
}

class _signuppagestate extends State<signuppage> {
  bool passwordshow = true;
  bool usernamecheck = true;
  bool passwordcheck = true;
  bool confpasscheck = true;
  bool checkemptyall = false;
  String username;
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController confpasscontroller = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(gradient: grad1()),
          ),
          Center(
            child: logsigncon(
                height: 415.0,
                width: 320.0,
                child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Text("Sign Up",
                      style: TextStyle(
                          fontFamily: appfont,
                          color: Colors.white,
                          fontSize: 28.0)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: TextField(
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                        errorText: usernamecheck?null:"Username should be more than 8 characters!",
                        labelText: "Username",
                        labelStyle: TextStyle(fontFamily: appfont)),
                    onSubmitted: (String temp){
                      setState(() {
                        username=temp;
                      });
                    },
                    onChanged: (String temp){
                      setState(() {
                        if (temp.length<8) {
                          usernamecheck=false;
                        }else{
                          usernamecheck=true;
                        }
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: passwordcontroller,
                    obscureText: passwordshow,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(fontFamily: appfont),
                      errorText: passwordcheck?null:"Password Should be more than 8 characters!"
                    ),
                    onChanged: (String temp){
                      setState(() {
                        if (temp.length<8) {
                          passwordcheck=false;
                        }else {
                          passwordcheck=true;
                        }
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: confpasscontroller,
                    obscureText: passwordshow,
                    decoration: InputDecoration(
                      errorText: confpasscheck?null:"Password doesn't match!",
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(fontFamily: appfont),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          showpassword();
                        },
                        child: Icon(passwordshow
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: 265,
                  child: RaisedButton(
                    elevation: 27.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    onPressed: () {
                      setState(() {
                        checkempty();
                        checkpassmatch();
                        if (usernamecheck==true&&confpasscheck==true&&passwordcheck==true) {
                          debugPrint("Sign up Successful");
                        }
                        else{
                          debugPrint("Sign up Failed");
                        }
                      });
                    },
                    child: Text("Sign Up"),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 6.0),
                    child: InkWell(
                      child: Text("Already have an account? Login",
                          style: TextStyle(color: Colors.white60)),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ))
              ],
            )),
          )
          ],
      ),
    );
  }

  void checkempty() {
    if (usernamecontroller.text.isEmpty&&passwordcontroller.text.isEmpty) {
      usernamecheck=false;
      passwordcheck=false;
    }else if(usernamecontroller.text.isEmpty){
      usernamecheck=false;
    }else if (passwordcontroller.text.isEmpty) {
      passwordcheck=false;
    }
  }
  void checkpassmatch() {
    if (passwordcontroller.text==confpasscontroller.text) {
      confpasscheck=true;
    }else {
      confpasscheck=false;
    }
  }
  void showpassword() {
    setState(() {
      passwordshow = !passwordshow;
    });
  }
}
