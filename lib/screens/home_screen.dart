import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import  'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_alpha/screens/main_layout_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  String sampleText = "Sample Text";

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    fetchData();
    startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return networkViewScreen();
  }

  Widget networkViewScreen(){
    return  Scaffold(
      body: networkDataLabel(),
      backgroundColor: Colors.red,
    );
  }

  Widget networkDataLabel(){
    return Center(
      child: Text("$sampleText",
        style: TextStyle(fontSize: 20,
          color: Colors.white
        ),
      ),
    );
  }

    Future<String> fetchData() async {
      try {
        http.Response response = await http.get(
            Uri.encodeFull("http://192.168.1.83:3000/"),
            headers: {
            }
        );
        setState(() {
          sampleText = response.body;
        });
        cacheResponse();
        print(response.body);
      }on SocketException{
        getCacheResponse();
      }
    }

    void startTimer() {
      Future delay() async{
        await new Future.delayed(new Duration(seconds: 5),(){
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainLayout()),
              ModalRoute.withName("/api_screen")
          );
        });
      }
      delay();
    }

    void cacheResponse() async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("webdata", sampleText);
    }

    void getCacheResponse() async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      setState(() {
        sampleText =  sharedPreferences.getString("webdata").toString();
      });
    }

}


