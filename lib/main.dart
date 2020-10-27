import 'package:flutter/material.dart';

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
        primaryColor: Colors.lightGreen[800],
        accentColor: Colors.red[600]
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.dehaze),
          title: Text('text here', style: TextStyle(fontSize: 24.0),),
        ),
        body: Center(
          child: Text(
              'Home screen for Christmas Wish List',
          ),
        ),
      ),
    );
  }
}


