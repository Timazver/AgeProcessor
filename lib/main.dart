import 'package:age_processor/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart' as permission;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    permission.Permission.microphone.request();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: 
      MainScreen(),
      theme: ThemeData(
        brightness: Brightness.dark
      ),
    );
  }

  
}