import 'package:flutter/material.dart';
import 'package:final_app/User.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Color _color = Theme.of(context).accentColor;
    TextStyle _style1 = Theme.of(context).textTheme.headline1;
    TextStyle _style2 = Theme.of(context).textTheme.headline2;
    TextStyle _style3 = Theme.of(context).textTheme.headline3;
    TextStyle _style4 = Theme.of(context).textTheme.headline3.apply(color: Colors.white);
    TextStyle _style5 = TextStyle(fontSize: 25);

    final _countDown = Container(
      padding: EdgeInsets.fromLTRB(21, 25, 21, 21),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('You have only',
                style: _style1),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: RichText(
              text: TextSpan(
                  text: DateTime(DateTime.now().year, 12, 25)
                      .difference(DateTime.now()).inDays.toString(),
                  style: _style2,
                  children: [
                    TextSpan(text: ' days', style: _style4),
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text('Until Christmas...!!!', style:_style1),
          ),
        ],
      ),
    );

    final _groupTitle = Container(
      padding: EdgeInsets.only(top: 12, left: 18.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text("Family's WishList", style: _style3,
        ),
      ),
    );


    return  Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _countDown,
        _groupTitle,
        Expanded(
          child: ListView.separated(
              itemCount: initFamilyList().length,
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2.0,
                  child: ListTile(
                    onTap: () {} ,
                    contentPadding: EdgeInsets.all(10),
                    leading: CircleAvatar(
                      radius: 40,
                      child: currentUser.familyList[index].image != null
                          ? ClipOval(
                        child: Image(image: AssetImage(
                            currentUser.familyList[index].image),
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover),
                      )
                          : Container(
                        decoration: BoxDecoration(
                          color: _color,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(Icons.add_a_photo, color: Colors.white,
                          size: 45,),
                        width: 90,
                        height: 90,
                      ),
                    ),
                    title: Text(currentUser.familyList[index].name, style: _style5),
                  ),
                );}
          ),
        ),
      ],
    );
  }
}