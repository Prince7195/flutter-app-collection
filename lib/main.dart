import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Input Boxes',
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: InputBox(),
    );
  }
}

class InputBox extends StatefulWidget {
  @override
  InputBoxState createState() => InputBoxState();
}

class InputBoxState extends State<InputBox> {
  bool loogedIn = false;
  String _email, _username, _password;

  final formKey = GlobalKey<FormState>();
  final mainKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainKey,
      appBar: AppBar(
        title: Text("Form Example"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: loogedIn == false ? Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Email:"
                ),
                validator: (str) {
                  return !str.contains("@") ? "Not a valid Email" : null;
                },
                onSaved: (str) => _email = str,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Username:"
                ),
                validator: (str) {
                  return str.length <= 5 ? "Not a valid Username" : null;
                },
                onSaved: (str) => _username = str,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Password:"
                ),
                validator: (str) {
                  return str.length <= 7 ? "Not a valid Password" : null;
                },
                onSaved: (str) => _password = str,
                obscureText: true,
              ),
              RaisedButton(
                child: Text("Submit"),
                onPressed: onPressed,
              )
            ],
          ),
        ) : Center(
          child: Column(
            children: <Widget>[
              Text("Welcome $_username"),
              RaisedButton(
                child: Text("Log out"),
                onPressed: () {
                  setState(() {
                    loogedIn = false;
                  });
                },
                )
            ],
          ),
        )
      ),
    );
  }

  void onPressed() {
    var form = formKey.currentState;
    if(form.validate()) {
      form.save();
      setState(() {
        loogedIn = true;
      });

      var snackBar = SnackBar(
        content: Text(
          "Username: $_username, Email: $_email, Password: $_password"
        ),
        duration: Duration(milliseconds: 5000),
      );

      mainKey.currentState.showSnackBar(snackBar);
    }
  }
}