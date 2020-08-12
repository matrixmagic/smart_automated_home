import 'package:flutter/material.dart';

import 'custom_flat_button.dart';

class VerificationCodeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 13.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Icon(
                  Icons.security,
                  size: 200.0,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "the default code come from our manufactor",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      autocorrect: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.verified_user,
                          color: Colors.cyan,
                        ),
                        labelText: 'enter your code here',
                        hintText: 'verification code',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.greenAccent),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: FlatButton(
                            color: Colors.blue,
                            child: Text(
                              'verfied',
                              style:
                                  TextStyle(fontSize: 21, color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: FlatButton(
                            color: Colors.blue,
                            child: Text(
                              'change code',
                              style:
                                  TextStyle(fontSize: 21, color: Colors.white),
                            ),
                            onPressed: () {},
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
