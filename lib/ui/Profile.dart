import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color _color1 = Theme.of(context).accentColor;

    final _background = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background2.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
    final _nameField = TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        labelText: 'Name',
        hintText: 'Enter your account name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
    final _emailField = TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        labelText: 'Email Address',
        hintText: 'Email Address',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
    final _title = Container(
      padding: EdgeInsets.only(left: 20, bottom: 30),
      child: Text('Sign Up', style: Theme.of(context).textTheme.headline4),
    );

    return Stack(
      children: [
        _background,
        Container(
          padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _title,
            ],
          ),
        ),
      ],
    );
  }
}
