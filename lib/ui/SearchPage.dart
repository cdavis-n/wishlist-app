import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _showSnackBar() {
    final snackBar = new SnackBar(
      content: new Text('Oops! Something went wrong!'),
      duration: new Duration(seconds: 10),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {},
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            title: Text("Wish List Library"),
            automaticallyImplyLeading: false,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Toys'),
                Tab(text: 'Electronics'),
                Tab(text: 'Clothes'),
              ]
            ),
          ),
          body: TabBarView(
            children: [
              ListView(),
              ListView(
                children: <Widget>[
                  Card(
                    color: Colors.white,
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(radius: 25, backgroundImage: new AssetImage('assets/items/ps5.jpg'),),
                      title: Text('Playstation 5'),
                      subtitle: Text('Price - 499.00'),
                      trailing: new Column(
                        children: <Widget>[
                          new Tooltip(
                            message: 'Item Added to Wishlist',
                            child: IconButton(
                              icon: Icon(Icons.add,),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      isThreeLine: true,
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(radius: 25, backgroundImage: new AssetImage('assets/items/xbox.jpg'),),
                      title: Text('Xbox Series X'),
                      subtitle: Text('Price - 599.00'),

                      trailing: new Column(
                        children: <Widget>[
                          new Tooltip(
                            message: 'Item Added to Wishlist',
                            child: IconButton(
                              icon: Icon(Icons.add,),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      isThreeLine: true,
                    ),
                  ),
                ],
              ),
              ListView(),
            ],
          ),
        ),
    );
  }
}