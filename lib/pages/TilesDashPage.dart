import 'package:flutter/material.dart';


class TileDash extends StatefulWidget {
  @override
  _TileDashState createState() => new _TileDashState();
}

class _TileDashState extends State<TileDash> {


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child: ChildWidget(), onWillPop: () async => false);
  }
}
Widget ChildWidget(){
  return new Scaffold(body: Center(
    child: Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: <Widget>[
        Text("Dashboard"),
      ],
    ),
  ),);
}


