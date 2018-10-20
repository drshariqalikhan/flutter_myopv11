import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget myWidget;
  final double BarHieght;

  const MyAppbar({this.myWidget, this.BarHieght});

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.black,
      height: BarHieght ?? MediaQuery.of(context).size.height *0.10,
      child: Padding(
        padding: const EdgeInsets.only(right: 50.0,left: 50.0,bottom: 4.0,top: 10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              myWidget ?? Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text('MyOp - Your surgical journey companion',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)],),])//
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(20.0);
}