import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Drag and Drop',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: App(),
      )
    );
  }
}

class App extends StatefulWidget {

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  Color caughtColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DragBox(Offset(0.0, 0.0), "Box One", Colors.lime),
        DragBox(Offset(100.0, 0.0), "Box Two", Colors.orange),
        DragBox(Offset(200.0, 0.0), "Box Three", Colors.green),
        Positioned(
          left: 100.0,
          bottom: 0.0,
          child: DragTarget(
            onAccept: (Color color) {
              caughtColor = color;
            },
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected
            ) {
              return Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: accepted.isEmpty ? caughtColor : Colors.grey.shade200
                ),
                child: Center(
                  child: Text("Drag Here!"),
                ),
              );
            },
          ),
        )
      ],
    );
  }

}

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  DragBox(this.initPos, this.label, this.itemColor);

  @override
  DragBoxState createState() => DragBoxState();

}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
      super.initState();
      position = widget.initPos;
    }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      right: position.dy,
      child: Draggable(
        data: widget.itemColor,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: widget.itemColor,
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 20.0
              ),
            ),
          ),
        ),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = offset;            
          });
        },
        feedback: Container(
          width: 100.0,
          height: 100.0,
          color: widget.itemColor.withOpacity(0.5),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 18.0
              ),
            ),
          ),
        ),
      ),
    );
  }

}