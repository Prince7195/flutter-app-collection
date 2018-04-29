import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: "Multi Page Flutter App",
      theme: themeData,
      home: new MyApp(),
    ));

final ThemeData themeData = new ThemeData(
  canvasColor: Colors.lightGreenAccent,
  accentColor: Colors.redAccent
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new FlatButton(
          onPressed: (){
            Navigator.push(context, new PageTwo());
          },
          child: new Text("Go To PAge Two"),
        ),
      ),
    );
  }
}

class PageTwo extends MaterialPageRoute<Null> {
  PageTwo() : super(builder: (BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1.0,
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.push(context, new PageThree());
          },
          child: new Text("Go to Page Three"),
        ),
      ),
    );
  });
} 

class PageThree extends MaterialPageRoute<Null> {
  PageThree() : super(builder: (BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: new Text("Last Page"),
        elevation: 2.0,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: new Center(
        child: new IconButton(
          icon: new Icon(Icons.home),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
          },
        ),
      ),
    );
  });
}