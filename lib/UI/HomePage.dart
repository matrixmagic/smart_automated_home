import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartautomatedhome/Repository/ArduinoRepo.dart';
import 'package:smartautomatedhome/models/AllState.dart';
import 'package:signalr_client/signalr_client.dart';
import 'package:flutter/src/widgets/async.dart' as htt;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> chats;
  HubConnection connection;
  bool firsttime=false;
  bool ledState;
  bool securty;
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
            firsttime==false?
            FutureBuilder<Object>(
              future:   createSignalRConnection(),
              builder: (context, snapshot) {

                firsttime=true;
                return Container();
              }
            ):Container(),
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
                        if (snapshot.connectionState == htt.ConnectionState.done) {
                          bool led = (snapshot.data as AllState).ledState;
                          return Switch(
                              onChanged: (bool value) {
                                ArduinoRepo().changeledstate();
                               
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
              createSignalRConnection();
              },
            )
          ],
        ),
      ),
    );
  }
  
   Future<void> createSignalRConnection() async {
    connection = HubConnectionBuilder().withUrl("http://192.168.43.161:8089/eventHub").build();
    print(connection.state);
    await connection.start();
    print(connection.state);
    //connection.invoke("fromclient",args: ["bikaaaa"]);
    connection.on("thereIsChange", (data) async {
      print("thereIsChangethereIsChange thereIsChangethereIsChangethereIsChange");
var states=  await ArduinoRepo().GetAllStates();
setState(() {
  ledState =states.ledState;
});



    });
  }
}
