import 'package:flutter/material.dart';
import 'package:project_alpha/screens/home_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body:splashLabel(),
    );
  }

  Widget splashLabel() {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 0,vertical: 300),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: <Widget>[
          Text(
            "Flutter API Tester",
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
            ),
          ),
          Text(
           "This app for test API Call",
            style: TextStyle(fontSize: 15,color: Colors.white),
          )
        ],
      ),
    );
  }

  void startTimer(){
    Future delay() async{
      await new Future.delayed(new Duration(seconds: 5),(){
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            ModalRoute.withName("/Home")
        );
      });
    }
    delay();
  }
}

