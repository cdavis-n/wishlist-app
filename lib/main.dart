import 'package:flutter/material.dart';
import 'package:final_app/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Christmas Wish List',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red[600],
      ),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}


