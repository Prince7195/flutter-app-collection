import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Picture Gallery',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: DisplayPage(),
    );
  }
}

class DisplayPage extends StatelessWidget {
  final List<String> images = [
    "assets/1.jpg",
    "assets/2.jpg",
    "assets/3.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.fromSize(
          size: Size.fromHeight(550.0),
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.8),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return new Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 8.0
                ),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}