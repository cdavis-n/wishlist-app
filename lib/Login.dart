import 'package:flutter/material.dart';
import 'package:final_app/SignUp.dart';
import 'package:final_app/User.dart';
import 'package:final_app/home.dart';



class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  var _username, _password;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color _color0 = Colors.transparent;
    Color _color1 = Theme.of(context).accentColor.withOpacity(0.6);
    Color _color2 = Theme.of(context).primaryColor.withOpacity(0.6);
    TextStyle _style1 = TextStyle(fontSize: 55, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);
    TextStyle _style2 = TextStyle(fontSize: 25);
    TextStyle _style3 = TextStyle(fontSize: 18);

    final _title = Container(
      padding: EdgeInsets.only(bottom: 35),
      color: _color0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('WishList', style: _style1),
          Text('Share your WishList with your family!', style: _style3),
        ],
      ),
    );

    final _codeField = TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        icon: Icon(Icons.account_circle),
        hintText: 'Username',
      ),
      onChanged: (text) => _username = text,
    );
    final _passwordField = TextFormField(

      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        icon: Icon(Icons.vpn_key),
        hintText: 'Password',
      ),
      onChanged: (text) => _password = text,
    );

    final _loginButton = Center(
      child: FlatButton(
        padding: EdgeInsets.only(right: 30, left: 30),
        color: _color2,
        child: Text('Login', style: _style2),
        onPressed: ()  {
          User res = login(_username, _password);
          if(res != null) {
            setState(() => currentUser = res);
            Navigator
                .push(context, MaterialPageRoute(builder: (context) => Home()));
          } else {
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Login Error:'),
                content: Text('You typed wrong username/password.'),
                actions: [
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
              );
            });
          }
        },
      ),
    );
    final _signInButton = Padding(
      padding: EdgeInsets.only(top: 5),
      child: FlatButton(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        color: _color2,
        child: Text('Sign In', style: _style2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context){
              return Container(
                height: 550,
                padding: EdgeInsets.only(left: 15, top: 35, right: 25),
                child: ListView(
                  children: [
                    _codeField,
                    SizedBox(height: 10),
                    _passwordField,
                    SizedBox(height: 15),
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
        padding: EdgeInsets.only(top: 10, bottom: 10),
        color: _color1,
        child: Text('Sign Up', style: _style2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () => Navigator
            .push(context, MaterialPageRoute(builder: (context) => SignUp() )),
      ),
    );

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background1.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: _color0,
          body: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 190, 25, 15),
              child: ListView(
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