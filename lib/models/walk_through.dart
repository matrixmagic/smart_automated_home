import 'package:flutter/material.dart';

class walk_through {
  Image img;
  IconData icon;
  String title;
  String desc;
  Widget wid;
  walk_through({this.img, this.icon, this.title, this.desc, this.wid}) {
    if (wid == null) {
      this.wid = new Container();
    }
  }
}
