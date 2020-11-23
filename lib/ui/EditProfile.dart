import 'package:flutter/material.dart';
import 'package:final_app/ui/SelectPhoto.dart';

class EditProfile extends StatefulWidget{
  @override
  _EditProfileState createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
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
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.4),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text('Edit Profile',
              style: Theme.of(context).textTheme.headline1,),
            centerTitle: true,
            actions: [
              FlatButton(
                child: Text('Done',
                  style: Theme.of(context).textTheme.bodyText1
                      .apply(color: Colors.white)),
                onPressed: () {
                  // save the data
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
                Text('Name: '),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
