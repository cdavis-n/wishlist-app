import 'package:flutter/material.dart';
import 'package:final_app/SignUp.dart';
import 'package:final_app/ui/Database.dart';
import 'package:final_app/home.dart';


class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  var _email;
  var _password;
  TextEditingController _controller0;
  TextEditingController _controller1;
  var _errorFlag = '';

  var me = User(0, 'Chihiro', null, 'c12345', 'chihiro@gmail.com');

  @override
  void initState(){
    super.initState();
    _controller0 = TextEditingController();
    _controller1 = TextEditingController();
  }
  @override
  void dispose(){
    _controller0.dispose();
    _controller1.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    insertUser(me);

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

    final _emailField = TextField(
      controller: _controller0,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        icon: Icon(Icons.email),
        hintText: 'Email Address',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (text) => _email = text,
    );
    final _passwordField = TextField(
      controller: _controller1,
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
        onPressed: () async {
          var _res = await login(_email, _password);
          if(_res == null) {
            setState(() => _errorFlag = 'Login Error: You typed wrong email address/password.');
          }
          else {
            setState(() => currentUser = _res);
            Navigator
                .push(context, MaterialPageRoute(builder: (context) => Home()));
          }
        },
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
                    _emailField,
                    _passwordField,
                    _loginButton,
                    Text(_errorFlag, style: _style3),
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
            .push(context, MaterialPageRoute(builder: (context) => SignUp() )),
      ),
    );

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login.jpeg'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
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