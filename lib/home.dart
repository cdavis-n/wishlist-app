import 'package:flutter/material.dart';
import 'package:final_app/ui/HomePage.dart';
import 'package:final_app/ui/ActivityPage.dart';
import 'package:final_app/ui/MyPage.dart';
import 'package:final_app/ui/ItemPage.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  int _selected = 0;

  Map<String, Widget> _itemOfBottomNavigationBar = const {
    'Home': Icon(Icons.home),
    'Activity': Icon(Icons.notifications),
    'Me': Icon(Icons.account_circle),
    'Library': Icon(Icons.list),
  };
  Map<int, Widget> _navigationPage = {
    0: HomePage(),
    1: ActivityPage(),
    2: MyPage(),
    3: ItemPage(),
  };
  Map<int, String> _backgroundImage = {
    0: 'assets/images/background1.jpg',
    1: 'assets/images/background2.jpeg',
    2: 'assets/images/background2.jpeg',
    3: 'assets/images/background2.jpeg',
  };

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_backgroundImage[_selected]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _itemOfBottomNavigationBar.entries.map((e) =>
                BottomNavigationBarItem(title: Text(e.key), icon: e.value)).toList(),
            currentIndex: _selected,
            selectedItemColor: Theme.of(context).buttonColor.withOpacity(0.8),
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
            onTap: (int index){ setState(() => _selected = index);},
          ),
          body: _navigationPage[_selected],
        ),
      ],
    );
  }
}