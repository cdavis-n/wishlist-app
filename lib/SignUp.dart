import 'package:flutter/material.dart';
import 'package:final_app/User.dart';
import 'package:final_app/home.dart';

class SignUp extends StatefulWidget {
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {

  var _name, _code, _password;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();


  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Color _color0 = Theme.of(context).scaffoldBackgroundColor;

    final _nameField = TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18),
        labelText: 'Name',
        hintText: 'Name *',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (text) => _name = text,
      validator: (text){
        return text.length > 10 ? 'Max letters are used.' : null;
      },
    );
    final _codeField = TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18),
        labelText: 'User Name',
        hintText: 'User Name *',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (text) => _code = text,
      validator: (text) {
        return  checkUsername(text) == false ? 'You cannot use the user name.' : null;
      },
    );
    final _passwordField = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18),
        labelText: 'Password',
        hintText: 'Password *',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (text) => _password = text,
      validator: (text) {
        return text.length < 3 ? 'Your password is too weak.' : null;
      },
    );
    final _title = Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text('Sign Up Form', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
      ),
    );


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
        SingleChildScrollView(
          child: Material(
            color: _color0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Form(
                key: _key,
                child: FutureBuilder(
                  builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          color: _color0,
                          child: Container(
                            width: 60,
                            height: 40,
                            child: Text('Back', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        _title,
                        SizedBox(height: 10),
                        _nameField,
                        SizedBox(height: 10),
                        _codeField,
                        SizedBox(height: 10),
                        _passwordField,
                        SizedBox(height: 10),
                        Center(
                          child: FlatButton(
                              padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                              color: Theme.of(context).accentColor.withOpacity(0.7),
                              child: Text('Sign Up', style: TextStyle(fontSize: 25)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              onPressed: () {
                                if(_key.currentState.validate()) {
                                  setState(() => currentUser = new User(code: _code, name: _name, image: null, password: _password));
                                  insertUser(currentUser);
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => Home()));
                                }
                              }
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
