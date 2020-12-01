import 'package:final_app/ui/EditProfile.dart';
import 'package:final_app/User.dart';
import 'package:flutter/material.dart';
import 'WishList.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage> {
  var _itemNum = 18;
  var _name = currentUser.name;
  var _image = currentUser.image;

  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  //final snackBar = SnackBar(content: Text('No one has purchased this item for you yet :('));

  List<Widget> myItems = [];

  void getPostData() {
    List<dynamic> responseList = MY_ITEMS;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 175,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ ${post["price"]}",
                      style: const TextStyle(fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red[200])
                      ),
                        onPressed: () {
                          final snackBar = SnackBar(
                              content: Text('No one has purchased this item for you yet :('),
                              action: SnackBarAction(
                                label: 'Dismiss',
                                onPressed: () {},
                          ),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        },
                        child: Text('Status'),
                      ),
                  ],
                ),
                Image.asset(
                  "assets/items/${post["image"]}",
                  height: 90.0,
                ),
              ],
            ),
          )));
    });
    setState(() {
      myItems = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostData();
    controller.addListener(() {
      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    Color _color0 = Colors.transparent;
    Color _color1 = Theme.of(context).primaryColor.withOpacity(0.5);
    Color _color2 = Theme.of(context).accentColor.withOpacity(0.5);
    TextStyle _style1 = Theme.of(context).textTheme.headline1;
    TextStyle _style2 = TextStyle(fontSize: 18);
    TextStyle _style3 = TextStyle(fontSize: 25);

    final _profileSection = Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            child: _image != null
                ? ClipOval(
              child: Image(image: AssetImage(_image),
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover),
              )
                : Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.add_a_photo, color: Colors.white, size: 45,),
              width: 90,
              height: 90,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(_name, style: _style3),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_itemNum.toString(), style: _style3,),
                Text('Items', style: _style2,),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: _color0,
      body: Container(
        padding: EdgeInsets.only(right: 15, left: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _profileSection,
            RaisedButton(
              padding: EdgeInsets.only(left: 40, right: 40),
              color: _color2,
              child: Text('Edit profile', style: _style2),
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => EditProfile()))
            ),
            Text('Items Available',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white),),
            const SizedBox(
              height: 10,
            ),
            AnimatedOpacity(
              opacity: closeTopContainer?0:1,
              duration: const Duration(milliseconds: 200),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.topCenter,
              ),
            ),
            Text('My Wish List!',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[300]),
            ),
            Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: myItems.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    double scale = 1.0;
                    if(topContainer > 0.5) {
                      scale = index + 0.5 - topContainer;
                      if (scale < 0) {
                        scale = 0;
                      } else if (scale > 1) {
                        scale = 1;
                      }
                    }
                    return Opacity(
                      opacity: scale,
                      child: Transform(
                        transform: Matrix4.identity()..scale(scale,scale),
                        alignment: Alignment.bottomCenter,
                        child: Align(
                            heightFactor: 0.7,
                            alignment: Alignment.topCenter,
                            child: myItems[index]
                        ),
                      ),);
                  },
                )),
          ],
        ),
      ),
    );
  }
}