import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  String PatientName = "Chamikara Samarasekara";

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Sample Application"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.email),
              onPressed: () { },
            ),
            IconButton(
              icon: Icon(Icons.dashboard),
              onPressed: _showDialog,
            ),
            PopupMenuButton(itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                    child: Row(
                  children: <Widget>[
                    Icon(Icons.settings),
                    Text(" Settings"),
                  ],
                )),
                PopupMenuItem(
                    child: Row(
                  children: <Widget>[
                    Icon(Icons.power),
                    Text(" Logout"),
                  ],
                )),
              ];
            })
          ],
        ),
        body: Column(
          children: <Widget>[TopMenuBar(), SecondaryBar()],
        ));
  }

  Widget TopMenuBar() {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/flutter_icon.jpeg',
            width: 100,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            width: 170,
            child: Column(
              children: <Widget>[
                Text(
                  "$PatientName",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                Text(
                  "chamikarasamarasekara@gmail.com",
                  style: TextStyle(fontSize: 10, color: Colors.black),
                  maxLines: 1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget SecondaryBar() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30),
      child: Row(
        children: <Widget>[
          MaterialButton(
            minWidth: 100,
            color: Colors.blue,
            onPressed: _showDialog,
            child: Text(
              "Press Me",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: new Text("Dialog Title"),
          content: new Text("This is my content"),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Yes"),
              onPressed: (){
                Navigator.of(context, rootNavigator: true).pop("Discard");
              },
            ),
            CupertinoDialogAction(
              child: Text("No"),
              onPressed: (){
                Navigator.of(context, rootNavigator: true).pop("Discard");
              },
            )
          ],
        );

      },
    );
  }
}
