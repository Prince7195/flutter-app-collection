import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'src/chat.dart';

final ThemeData iosTheme = new ThemeData(
  primarySwatch: Colors.red,
  primaryColor: Colors.grey[400],
  primaryColorBrightness: Brightness.dark
);

final ThemeData androidTheme = new ThemeData(
  primarySwatch: Colors.blue[800],
  accentColor: Colors.green[100]
);

const String defaultUserName = 'Vijay Deepak';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
 
 @override
 Widget build(BuildContext context) {
   return new MaterialApp(
     title: 'Chat App',
     theme: defaultTargetPlatform == TargetPlatform.iOS ? iosTheme : androidTheme,
     home: new Chat(),
   );
 }
}