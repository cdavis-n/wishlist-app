import 'package:flutter/material.dart';

class Item {
  ImageIcon imageIcon;
  String name;
  Item(this.imageIcon, this.name);
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<Item> _list = [
  ];

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}