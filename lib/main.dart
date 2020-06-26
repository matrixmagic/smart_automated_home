import 'package:flutter/material.dart';
import 'UI/mainScreen.dart';
import 'UI/walk_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => walk_screen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/root': (context) => SecondScreen(),
        /*'/login': (context) => logiscreen(),*/
      },
    );
  }
}
