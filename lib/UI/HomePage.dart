import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartautomatedhome/Repository/ArduinoRepo.dart';
import 'package:smartautomatedhome/models/AllState.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'light',
                    style: TextStyle(fontSize: 22),
                  ),
                  FutureBuilder(
                      future: ArduinoRepo().GetAllStates(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          bool led = (snapshot.data as AllState).ledState;
                          return Switch(
                              onChanged: (bool value) {
                                ArduinoRepo().changeledstate();
                                setState(() {
                                  led = !value;
                                });
                              },
                              activeColor: Colors.blue,
                              value: led);
                        }
                        return Container();
                      }),
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'light',
                  style: TextStyle(fontSize: 22),
                ),
                Switch(
                  activeColor: Colors.red,
                  value: false,
                ),
              ],
            ),
            Divider(),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'indoor',
                        style: TextStyle(fontSize: 22, color: Colors.redAccent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'outdoor',
                        style: TextStyle(fontSize: 22, color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            '22 ',
                            style: TextStyle(fontSize: 31),
                          ),
                          Text(
                            'c',
                            style: TextStyle(fontSize: 34),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            '25 ',
                            style: TextStyle(fontSize: 31),
                          ),
                          Text(
                            'c',
                            style: TextStyle(fontSize: 34),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            FloatingActionButton(
              child: Text('shomakan'),
              onPressed: () {
                ArduinoRepo().shomakan();
              },
            )
          ],
        ),
      ),
    );
  }
}
