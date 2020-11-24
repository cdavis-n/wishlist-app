import 'package:flutter/material.dart';
import 'package:final_app/ui/Profile.dart';

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
    //_controller = TextEditingController();
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    Color _color0 = Colors.transparent;
    Color _color1 = Theme.of(context).accentColor.withOpacity(0.6);
    Color _color2 = Theme.of(context).primaryColor.withOpacity(0.6);
    TextStyle _style1 = TextStyle(fontSize: 55, color: Colors.black, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);
    TextStyle _style2 = TextStyle(color: Colors.black, fontSize: 25);

    final _background = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.jpeg'),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
    final _title = Container(
      padding: EdgeInsets.only(bottom: 55),
      color: _color0,
      child: Text('WishList', style: _style1),
    );

    final _userNameField = TextField(
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
      //controller: _controller,
      obscureText: true,
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
    final _loginButton = Padding(
      padding: EdgeInsets.only(top: 20),
      child: FlatButton(
        color: _color2,
        padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
        child: Text('Login', style: _style2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: (){},
      ),
    );
    final _signInButton = Padding(
      padding: EdgeInsets.only(top: 5),
      child: FlatButton(
        padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
        color: _color2,
        child: Text('Sign In', style: _style2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: (BuildContext context){
              return Container(
                height: 550,
                padding: EdgeInsets.fromLTRB(15, 35, 25, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _userNameField,
                    _passwordField,
                    _loginButton,
                  ],
                ),
              );
            }),
      ),
    );
    final _signUpButton = Padding(
      padding: EdgeInsets.only(top: 45),
      child: FlatButton(
        padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
        color: _color1,
        child: Text('Sign Up', style: _style2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () => Navigator
            .push(context, MaterialPageRoute(builder: (context) => Profile() )),
      ),
    );

    return Stack(
      children: [
        _background,
        Scaffold(
          backgroundColor: _color0,
          body: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 190, 25, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _title,
                  _signInButton,
                  _signUpButton,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}