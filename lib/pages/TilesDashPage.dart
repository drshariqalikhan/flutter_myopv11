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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("TIME TO SURGERY : 00 DAYS",style: TextStyle(fontSize: 20.0),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/spero.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("JOURNEY POINT"),
        ),

      ],
    ),
  ),bottomNavigationBar: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(child: Icon(Icons.message),onPressed: null,heroTag: "message",),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(child: Icon(Icons.whatshot),onPressed: null,heroTag: "Complete task",),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(child: Icon(Icons.info,size: 40.0,),onPressed: null,heroTag: "About my Op",),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),

          child: FloatingActionButton(child: Icon(Icons.directions,size: 40.0,),onPressed: null,heroTag: "Instructions to follow",),
        ),
      ],
    ),
  ));
}


