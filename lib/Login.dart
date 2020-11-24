import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  var _name;
  var _password;
  TextEditingController _controller;

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    Color _color0 = Colors.transparent;
    Color _color1 = Theme.of(context).accentColor.withOpacity(0.7);
    TextStyle _style1 = TextStyle(fontSize: 55, color: Colors.black, fontStyle: FontStyle.italic);
    TextStyle _style2 = TextStyle(color: Colors.black, fontSize: 25);

    final _background = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
    final _title = Container(
      padding: EdgeInsets.only(bottom: 60),
      color: _color0,
      child: Text('WishList', style: _style1),
    );

    final _userNameField = TextField(
      controller: _controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        icon: Icon(Icons.person),
        hintText: 'Username',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (text) => _name = text,
    );
    final _passwordField = TextField(
      obscureText: true,
      controller: _controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        icon: Icon(Icons.vpn_key),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (text) => _password = text,
    );
    final _button = Padding(
      padding: EdgeInsets.only(top: 45),
      child: FlatButton(
        padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
        color: _color1,
        child: Text('Login', style: _style2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          // check database and match or not
        },
      ),
    );


    return Stack(
      children: [
        _background,
        Scaffold(
          backgroundColor: _color0,
          body: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 25, 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _title,
                  _userNameField,
                  _passwordField,
                  _button,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}