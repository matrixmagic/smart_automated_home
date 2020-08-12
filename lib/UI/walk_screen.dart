import 'package:flutter/material.dart';
import 'package:smartautomatedhome/models/walk_through.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'custom_flat_button.dart';

class walk_screen extends StatefulWidget {
  @override
  _walk_screenState createState() => _walk_screenState();
}

class _walk_screenState extends State<walk_screen> {
  List<walk_through> pages = [
    walk_through(
      img: Image.asset('assets/hii.jpg'),
      icon: Icons.developer_mode,
      title: "welcome to our new app",
      desc: "life is easier with our application",
    ),
    walk_through(
      icon: Icons.layers,
      title: "feel safe and clear your mind",
      desc: "you don't have to be worried about your home ",
    ),
    walk_through(
      icon: Icons.account_circle,
      title: "it make your life easier",
      desc: "with our app everything can be controlled by a button ",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper.children(
        autoplay: false,
        pagination: SwiperPagination(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
            builder: DotSwiperPaginationBuilder(
                color: Colors.black,
                activeColor: Colors.white,
                size: 20.0,
                activeSize: 20.0)),
        children: getpage(),
      ),
    );
  }

  getpage() {
    List<Widget> ps = [];
    pages.forEach((item) {
      ps.add(Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/hu3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 125.0),
              child: Center(
                child: Icon(
                  item.icon,
                  size: 100.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    item.desc,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ))
          ],
        ),
      ));
    });
    ps.add(Container(
      color: Colors.blue[700],
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 180.0,
            ),
            Icon(
              Icons.code,
              size: 125,
              color: Colors.white,
            ),
            Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    "you're a button away from the new world",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                )),
            Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CustomFlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/root');
                    },
                    title: "Get Started",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    textColor: Colors.black,
                    splashColor: Colors.black12,
                    borderColor: Colors.white,
                    borderWidth: 2,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    ));
    return ps;
  }
}
