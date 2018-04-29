import 'package:flutter/material.dart';
import 'dart:async'; // to handle async functions
import 'dart:convert'; // to convert json to data
import 'package:http/http.dart' as http; // to make a http request

void main() => runApp(MaterialApp(
      title: "StartWars Data",
      home: new StarWarsData(),
    ));

class StarWarsData extends StatefulWidget {
  @override
  StarwarsState createState() => new StarwarsState();
}

class StarwarsState extends State<StarWarsData> {
  final String url = "https://swapi.co/api/starships/";
  List data;
  Future<String> getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState(() {
      var resBody = json.decode(res.body);
      data = resBody["results"];
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Star Wars Starships"),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: new Row(
                        children: <Widget>[
                          new Text("Name: "),
                          new Text(
                            data[index]["name"],
                            style: new TextStyle(
                                fontSize: 18.0, color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: new Row(
                          children: <Widget>[
                            new Text("Model: "),
                            new Text(
                              data[index]["model"],
                              style: new TextStyle(
                                  fontSize: 18.0, color: Colors.red),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }
}
