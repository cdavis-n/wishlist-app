import 'package:flutter/material.dart';
import 'package:final_app/User.dart';

class EditName extends StatefulWidget{
  @override
  _EditNameState createState() => _EditNameState();
}
class _EditNameState extends State<EditName> {
  TextEditingController _controller = TextEditingController();

  var _name = currentUser.name;

  @override
  void initState(){
    super.initState();
    _controller.text = _name;
    _controller.addListener(() {
      setState(() {_name = _controller.text;});
    });
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: _name,
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
    );
  }
}