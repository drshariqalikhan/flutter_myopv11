import 'dart:async';

import 'package:flutter/material.dart';


class Splash extends StatefulWidget {

  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),()=> Navigator.pushNamed(context, '/login'));
  }
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child: ChildWidget(), onWillPop: () async => false);
  }
}

Widget ChildWidget()
{
  return Scaffold(body:Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(color: Colors.redAccent),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100.0,
                    child: Image.asset('assets/images/spero.png')
                ),
                Padding(padding: EdgeInsets.only(top: 10.0),),
                Text("MyOP",style: TextStyle(fontSize: 24.0),)
              ],),
          ),
          Expanded(
            flex:  1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(padding: EdgeInsets.only(top: 20.0),),
                Text("Loading......",style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ],
      )
    ],

  ));
}