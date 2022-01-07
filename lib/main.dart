import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/dashboard.dart';
import 'package:flutter_app/infoscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID-19 TRACKER',
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
          display1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(1, 4),
                blurRadius: 0.0,
              )
            ],
          ),
          headline: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 20.0,
          ),
        ),
      ),
      home: startScreen(),
    ); //Material App
  }
}

class startScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/virus.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "COVID-19\n",
                      style: Theme.of(context).textTheme.display1,
                    ),
                    TextSpan(
                      text: "STAY HOME STAY SAFE",
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ]),
                ),
              ],
            ),
          ),
          FittedBox(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DashBorad();
                }));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.red),
                child: Row(
                  children: <Widget>[
                    Text('VIEW DETAILS'),
                    Icon(Icons.arrow_right)
                  ],
                ),
              ),
            ),
          ),
          FittedBox(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InfoScreen();
                }));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.red),
                child: Row(
                  children: <Widget>[
                    Text('PRECAUTIONS'),
                    Icon(Icons.arrow_right)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
