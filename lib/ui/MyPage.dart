import 'package:final_app/ui/EditProfile.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage> {
  var _itemNum = 18;
  //var _image = '';
  var _name = 'Chihiro';

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
          ClipOval(
            child: Image.asset('assets/images/profile.jpeg',
                width: 90,
                height: 90,
                fit: BoxFit.cover),
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
      appBar: AppBar(
        title: Text('My WishList', style: _style1),
        centerTitle: true,
        backgroundColor: _color1,
      ),
      body: Container(
        padding: EdgeInsets.only(right: 15, left: 15, top: 5),
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
            Align(
              alignment: Alignment.topLeft,
              child: Text('WishList', style: _style3),
            ),

          ],
        ),
      ),
    );
  }
}