import 'package:flutter/material.dart';


class instructions extends StatefulWidget {
  @override
  _instructionsState createState() => new _instructionsState();
}

class _instructionsState extends State<instructions> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child: ChildWidget(context), onWillPop: () async => false);
  }
}

ChildWidget(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //widgets here

        ],
      ),
    ),
    floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: ()=>Navigator.pushNamed(context, '/splash')
    ),
  );
}
