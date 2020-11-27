import 'package:flutter/material.dart';
import 'package:final_app/ui/Database.dart';
import 'package:final_app/home.dart';
import 'package:final_app/ui/SelectPhoto.dart';

class SignUp extends StatefulWidget {
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  var _name;
  var _password;
  var _email;
  var _image;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color _color0 = Theme.of(context).scaffoldBackgroundColor;

    final _nameField = TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18),
        labelText: 'Name',
        hintText: 'Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (text) => _name = text,
    );
    final _emailField = TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18),
        labelText: 'Email Address',
        hintText: 'Email Address',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (text) => _email = text,
    );
    final _passwordField = TextField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18),
        labelText: 'Password',
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (text) => _password = text,
    );
    final _title = Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text('Sign Up Form', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
      ),
    );

    final _signUpButton = Center(
      child: FlatButton(
        padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
        color: Theme.of(context).accentColor.withOpacity(0.7),
        child: Text('Sign Up', style: TextStyle(fontSize: 25)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () async {
          if(_name == null || _email == null || _password == null)
            {
              AlertDialog(
                // alert to fill everything
              );
            } else {
            var _id = await getIndex();
            setState(() => currentUser = new User(_id, _name, _image, _password, _email));
            insertUser(currentUser);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
          }
        }
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
        Material(
          color: _color0,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    color: _color0,
                    child: Container(
                          width: 100,
                          height: 40,
                          child: Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.arrow_back),
                                Text(' Back', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                    ),
               ),
                _title,
                SelectPhoto(),
                SizedBox(height: 18),
                _nameField,
                SizedBox(height: 10),
                _emailField,
                SizedBox(height: 10),
                _passwordField,
                SizedBox(height: 30),
                _signUpButton,
              ],
            ),
          ),
        ),

      ],
    );
  }
}
