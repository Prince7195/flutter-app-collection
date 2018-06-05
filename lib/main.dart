import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Styling',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          child: Center(
            child: Transform(
              transform: Matrix4.identity(),
                child: Container(
                width: 180.0,
                height: 180.0,
                // color: Colors.grey,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: <Color>[
                      Color(0xffef5350),
                      Color(0x00ef5350)
                    ]
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0xcc000000),
                      offset: Offset(0.0, 2.0),
                      blurRadius: 4.0
                    ),
                    BoxShadow(
                      color: Color(0x80000000),
                      offset: Offset(0.0, 6.0),
                      blurRadius: 20.0
                    )
                  ],
                  borderRadius: BorderRadius.circular(1000.0),
                  border: Border.all(color: Colors.black)
                ),
                alignment: Alignment.center,
                child: Text(
                  "VJD",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Georgia"
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

