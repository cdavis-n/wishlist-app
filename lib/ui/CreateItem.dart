import 'package:flutter/material.dart';

class CreateItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("New Item",
              style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5)),
    );
  }
}

