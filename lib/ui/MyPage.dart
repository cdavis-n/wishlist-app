import 'package:final_app/ui/SelectPhoto.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage> {
  var _itemNum = 18;
  var _name = 'Chihiro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('My WishList', style: Theme.of(context).textTheme.headline1),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 15, left: 15, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _profileSection(context),
            RaisedButton(
              padding: EdgeInsets.only(left: 40, right: 40),
              color: Theme.of(context).accentColor.withOpacity(0.5),
              child: Text('Edit profile',
                style: Theme.of(context).textTheme.bodyText1,),
              onPressed: () => Navigator
                  .push(context, MaterialPageRoute(
                  builder: (context) => SelectPhoto()))
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('WishList',
                style: Theme.of(context).textTheme.bodyText2,),
            ),

          ],
        ),
      ),
    );
  }
  Container _profileSection (context){
    return Container(
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
            child: Text(_name,
              style: Theme.of(context).textTheme.bodyText2,),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_itemNum.toString(),
                  style: Theme.of(context).textTheme.bodyText2,),
                Text('Items',
                  style: Theme.of(context).textTheme.bodyText1,),
              ],
            ),
          ),
        ],
      ),
    );
  }

}