import 'package:flutter/material.dart';


class SecondScreen extends StatefulWidget {
  SecondScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SecondScreenState createState() => new _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async=>false,
      child: new Scaffold(
        appBar: AppBar(title: Text(widget.title),automaticallyImplyLeading: false,),
        body: Center(child: Text("second screen")),
        floatingActionButton: FloatingActionButton(
            onPressed: ()=>Navigator.pushNamed(context, '/')),
      ),
    );
  }
}

