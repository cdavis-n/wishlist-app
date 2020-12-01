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
        //centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
      ),
      body: ListView(
        children: <Widget>[
          Text("Today",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.white,
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CircleAvatar(radius: 50,
                    backgroundImage: new AssetImage('assets/items/ps5.jpg'),),),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Miranda Smith',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Miranda purchased a PS5 for Jeff',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.favorite, color: Colors.red, size: 25),
                          Text('54 Likes', style: TextStyle(color: Colors.grey, fontSize: 13),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.visibility, color: Colors.grey, size: 25,),
                          Text('67 Views', style: TextStyle(color: Colors.grey, fontSize: 13),)
                        ],
                      ),
                    ],
                  ),)
              ],
            ),
          ),
          Text("Yesterday",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.white,
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CircleAvatar(radius: 50,
                    backgroundImage: new AssetImage('assets/items/ps5.jpg'),),),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Jeff Jones',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Jeff purchased AirPods for Michael',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.favorite, color: Colors.red, size: 25),
                          Text('34 Likes', style: TextStyle(color: Colors.grey, fontSize: 13),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.visibility, color: Colors.grey, size: 25,),
                          Text('39 Views', style: TextStyle(color: Colors.grey, fontSize: 13),)
                        ],
                      ),
                    ],
                  ),)
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.white,
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CircleAvatar(radius: 50,
                    backgroundImage: new AssetImage('assets/items/ps5.jpg'),),),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Kendrick Ramos',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Kendrick purchased an LCD 32-inch TV for Kimberley',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.favorite, color: Colors.red, size: 25),
                          Text('87 Likes', style: TextStyle(color: Colors.grey, fontSize: 13),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.visibility, color: Colors.grey, size: 25,),
                          Text('124 Views', style: TextStyle(color: Colors.grey, fontSize: 13),)
                        ],
                      ),
                    ],
                  ),)
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.white,
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CircleAvatar(radius: 50,
                    backgroundImage: new AssetImage('assets/items/ps5.jpg'),),),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Michelle Andrews',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Michelle purchased an AirFryer for Tommy ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.favorite, color: Colors.red, size: 25),
                          Text('48 Likes', style: TextStyle(color: Colors.grey, fontSize: 13),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.visibility, color: Colors.grey, size: 25,),
                          Text('58 Views', style: TextStyle(color: Colors.grey, fontSize: 13),)
                        ],
                      ),
                    ],
                  ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}