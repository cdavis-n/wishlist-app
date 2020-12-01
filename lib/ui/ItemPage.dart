import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_app/ui/CreateItem.dart';
import 'Items.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {

  //final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostData() {
    List<dynamic> responseList = ITEM_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 175,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ ${post["price"]}",
                      style: const TextStyle(fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Tooltip(
                      message: 'Item is Available',
                      child: IconButton(
                        icon: Icon(Icons.shopping_bag, color: Colors.red[500], size: 20,),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/items/${post["image"]}",
                  height: 90.0,
                ),
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostData();
    controller.addListener(() {
      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.10;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Library",
            style: Theme.of(context).textTheme.headline1),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Library Menu',
                  style: TextStyle(fontSize: 35, color: Colors.white)),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background3.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              title: Text('Create New Item'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateItem()),
                );
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background1.jpg"), fit: BoxFit.fill)
        ),
        height: size.height,
        child: Column(
          children: <Widget>[
            Text('Items Available',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white),),
            const SizedBox(
              height: 10,
            ),
            AnimatedOpacity(
              opacity: closeTopContainer?0:1,
              duration: const Duration(milliseconds: 200),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: size.width,
                alignment: Alignment.topCenter,
                height: closeTopContainer?0:categoryHeight,
                //child: categoriesScroller,
              ),
            ),
            Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: itemsData.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    double scale = 1.0;
                    if(topContainer > 0.5) {
                      scale = index + 0.5 - topContainer;
                      if (scale < 0) {
                        scale = 0;
                      } else if (scale > 1) {
                        scale = 1;
                      }
                    }
                    return Opacity(
                      opacity: scale,
                      child: Transform(
                        transform: Matrix4.identity()..scale(scale,scale),
                        alignment: Alignment.bottomCenter,
                        child: Align(
                            heightFactor: 0.7,
                            alignment: Alignment.topCenter,
                            child: itemsData[index]
                        ),
                      ),);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
