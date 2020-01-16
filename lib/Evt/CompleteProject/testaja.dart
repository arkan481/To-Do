import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Drop_new(),
      ),
    )
  );
}

class Drop_new extends StatefulWidget {
  @override
  _Drop_newState createState() => _Drop_newState();
}

class _Drop_newState extends State<Drop_new> {
  //List<String> menuItems = List();
  final _formKey = new GlobalKey<FormState>();
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _btn1SelectedVal;
  TextEditingController d = new TextEditingController();

  @override
  void initState() {
    _dropDownMenuItems = List();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(children: <Widget>[
      Form(
        key: _formKey,
        child: TextFormField(
          controller: d,
          validator: (value) {
            if (value.isEmpty) {
              return 'is empty';
            }
            return null;
          },
          onFieldSubmitted: (values) {
            if (_formKey.currentState.validate()) {
              setState(() {
                _dropDownMenuItems.add(DropdownMenuItem<String>(
                  value: values,
                  child: Text(values),
                ));
                d.text = "";
                //print(menuItems[0]);
              });
            }
            return false;
          },
        ),
      ),
      ListTile(
        title: Text('default:'),
        trailing: DropdownButton<String>(
          value: _btn1SelectedVal,
          onChanged: (String newValue) {
            setState(() {
              _btn1SelectedVal = newValue;
            });
          },
          items: this._dropDownMenuItems,
        ),
      ),
    ]));
  }
}