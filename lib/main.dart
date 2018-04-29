import 'package:flutter/material.dart';
import 'dart:async'; // to handle async functions
import 'dart:convert'; // to convert json to data
import 'package:http/http.dart' as http; // to make a http request

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Photo Streaming",
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: PhotoList(),
    );
  }
}

class PhotoList extends StatefulWidget {
  @override
  PhotoListState createState() => PhotoListState();
}

class PhotoListState extends State<PhotoList> {
  StreamController<Photo> streamController;
  List<Photo> list = [];
  @override
  void initState() {
    super.initState();
    streamController = StreamController.broadcast();
    streamController.stream.listen((p) =>
      setState(() => list.add(p)
    ));
    load(streamController);
  }

  load(StreamController sc) async{
    String url = "https://jsonplaceholder.typicode.com/photos";
    var client = new http.Client();
    var req = new http.Request('get', Uri.parse(url));
    var streamRes = await client.send(req);
    streamRes.stream.transform(UTF8.decoder)
    .transform(json.decoder)
    .expand((e) => e)
    .map((map) => Photo.fromJsonMap(map))
    .pipe(streamController);
  }

  @override
  void dispose() {
      super.dispose();
      streamController?.close();
      streamController = null;
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Photo Streams"),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => _makeElement(index),
        ),
      ),
    );
  }

  Widget _makeElement(int index) {
    if(index >= list.length) {
      return null;
    }
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Image.network(list[index].url),
          new Text(list[index].title)
        ],
      ),
    );
  }
} 

class Photo {
  final String title;
  final String url;
  Photo.fromJsonMap(Map map)
    : title = map['title'],
      url = map['url'];
}