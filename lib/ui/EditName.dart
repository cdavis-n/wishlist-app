import 'package:flutter/material.dart';
import 'package:final_app/ui/Group.dart';

class EditName extends StatefulWidget{
  @override
  _EditNameState createState() => _EditNameState();
}
class _EditNameState extends State<EditName> {
  TextEditingController _controller;
  // _name = User's current name
  var _name;

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
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: _name,
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      onChanged: (text) {},
    );
  }
}