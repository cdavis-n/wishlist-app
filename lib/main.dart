import 'package:flutter/material.dart';
import 'package:final_app/Login.dart';
import 'package:final_app/home.dart';


void main() async {
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
        fontFamily: 'Sofia',
        brightness: Brightness.light,
        primaryColor: Colors.red[900],
        accentColor: Colors.lightGreen[700],
        buttonColor: Colors.yellow[700],
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontWeight: FontWeight.w400),
          headline2: TextStyle(
              fontSize: 55,
              fontFamily: 'Chunk',
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontWeight: FontWeight.w500),
          headline3: TextStyle(
              fontSize: 35,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400),
          headline4: TextStyle(
            fontSize: 45,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          )
        ),
      ),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}


