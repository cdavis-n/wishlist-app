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
    return  Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _countdown(context),
          _groupTitle(context),

        ],
    );
  }
  Container _countdown(context)  {
    return Container(
      //color: Theme.of(context).accentColor.withOpacity(0.8),
      padding: EdgeInsets.fromLTRB(21, 25, 21, 21),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('You have only',
                style: Theme.of(context).textTheme.headline1),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: RichText(
              text: TextSpan(
                  text: DateTime(DateTime.now().year, 12, 25)
                      .difference(DateTime.now()).inDays.toString(),
                  style: Theme.of(context).textTheme.headline2,
                  children: [
                    TextSpan(
                        text: ' days',
                        style: Theme.of(context).textTheme.headline3),
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text('Until Christmas...!!!',
                style:Theme.of(context).textTheme.headline1),
          ),
        ],
      ),
    );
  }
  Container _groupTitle(context) {
    return Container(
      padding: EdgeInsets.only(top: 12, left: 18.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text('Group',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}