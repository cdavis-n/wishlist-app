import 'package:final_app/ui/EditName.dart';
import 'package:flutter/material.dart';
import 'package:final_app/ui/SelectPhoto.dart';
import 'package:final_app/User.dart';

class EditProfile extends StatefulWidget{
  @override
  _EditProfileState createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile> {

  @override
  Widget build(BuildContext context) {
    Color _color0 = Colors.transparent;
    Color _color1 = Theme.of(context).primaryColor.withOpacity(0.4);
    TextStyle _style1 = Theme.of(context).textTheme.headline1;
    TextStyle _style2 = TextStyle(fontSize: 18, color: Colors.white);
    TextStyle _style3 = TextStyle(fontSize: 25);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background2.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: _color0,
          appBar: AppBar(
            backgroundColor: _color1,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text('Edit Profile', style: _style1 ),
            centerTitle: true,
            actions: [
              FlatButton(
                child: Text('Done', style: _style2),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SelectPhoto(),
                Text('Name: ', style: _style3, textAlign: TextAlign.left,),
                EditName(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
