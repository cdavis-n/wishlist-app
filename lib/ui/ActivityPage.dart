import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}
class _ActivityPageState extends State<ActivityPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu',
              style: TextStyle(fontSize: 40)),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background3.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              title: Text('Item Library'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
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