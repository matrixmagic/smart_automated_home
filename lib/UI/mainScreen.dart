import 'package:flutter/material.dart';

import 'ChartsPage.dart';
import 'HelpPage.dart';
import 'HomePage.dart';

class SecondScreen extends StatefulWidget {
  int selected_index = 0;
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  List<String> leftNav = [
    "Home",
    "Charts and Diagrams",
    "Helps",
    "feedback",
    "invite friend"
  ];

  List<Icon> navbaricons = [
    Icon(Icons.home),
    Icon(Icons.show_chart),
    Icon(Icons.help),
    Icon(Icons.group),
    Icon(Icons.share)
  ];

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 3.14 / 2, end: 0.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return Scaffold(
        key: _drawerKey,
        backgroundColor: Color(0xFFFEFEFE),
        appBar: AppBar(
            leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _drawerKey.currentState.openDrawer();
            if (_drawerKey.currentState.isDrawerOpen) {
              print('drawer is opennnnnnn');
              controller.forward();
            }
          },
        )),
        drawer: Drawer(
            child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
              Container(
                width: double.infinity,
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 90.0, top: 14.0),
                    width: 120.0,
                    height: 120.0,
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: animation.value,
                          child: child,
                        );
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(60.0)),
                        child: Image.asset('assets/hii.jpg'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, top: 8.0),
                    child: Container(
                      margin: EdgeInsets.only(right: 90.0, top: 14.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'welcome to smart home ',
                          style: TextStyle(
                            backgroundColor: Colors.grey[200],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Color(0xFF3A5160),
                  )
                ]),
              ),
              Container(
                height: double.maxFinite,
                child: ListView.builder(
                  itemCount: leftNav.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(right: 50.0),
                      decoration: BoxDecoration(
                          color: widget.selected_index == index
                              ? Colors.blueAccent.withOpacity(0.3)
                              : Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(40.0),
                              topRight: Radius.circular((40)))),
                      child: ListTile(
                        title: Text(leftNav[index]),
                        leading:
                            Icon(navbaricons[index].icon, color: Colors.blue),
                        onTap: () {
                          setState(() {
                            widget.selected_index = index;
                          });
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              )
            ])),
        body: transfer());
  }

  transfer() {
    switch (widget.selected_index) {
      case 0:
        return HomePage();
        break;
      case 1:
        return ChartsPage();
        break;
      case 2:
        return HelpPage();
        break;
      case 3:
        return HelpPage();
        break;
      default:
        return HelpPage();
        break;
    }
  }
}
