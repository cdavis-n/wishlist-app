import 'package:flutter/material.dart';
//import 'package:final_app/ui/ItemPage.dart';
import 'dart:async';


class Terminal {
  final String item;
  final int price;
  Terminal({
    this.item,
    this.price,
  });
}

class UserInput extends StatefulWidget {
  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  String item;
  int price;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Item Name',
              ),
              onChanged: (val) {
                item = val;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              onChanged: (val) {
                price = int.parse(val);
              },
            ),
            FlatButton(
              child: Text('Save Item'),
              onPressed: () {
                events.add(Terminal(
                  item: item,
                  price: price));
              },
            ),
          ],
        ),
      )
    );
  }
}

class MyTerminal extends StatefulWidget {
  @override _MyTerminalState createState() => _MyTerminalState();
}

StreamController<Terminal> events = StreamController<Terminal>();

class _MyTerminalState extends State<MyTerminal> {
  List<Terminal> terminalNodes = [];

  @override
  void initState() {
    events.stream.listen((data) {
      terminalNodes.add(data);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 300,
        child: Column(
          children: terminalNodes.map((node)
    {
      return Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Text(node.item,
                        style: TextStyle(color: Colors.red, fontSize: 20))),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Price: \$", style: TextStyle(fontSize: 20),),
                      Text(
                        node.price.toString(), style: TextStyle(fontSize: 20),)
                    ]
                ),
              ]));
            }).toList(),
          ),
        ),
      );
  }
}

class CreateItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("New Item",
              style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 1, child: MyTerminal()),
            Expanded(flex: 1, child: UserInput()),
          ],
        ),
      ),
    );
  }
}

