import 'package:flutter/material.dart';


class messages extends StatefulWidget {
  @override
  _messagesState createState() => new _messagesState();
}

class _messagesState extends State<messages> {
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
