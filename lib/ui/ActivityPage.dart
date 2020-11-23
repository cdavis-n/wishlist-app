import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}
class _ActivityPageState extends State<ActivityPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Activity',
            style: Theme.of(context).textTheme.headline1),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
      ),
    );
  }
}