import 'dart:async';

import 'package:flutter/material.dart';

int DAYS = 00;
String JOURNEY_POINT="J_P";
Color message_AlertColor =Colors.black;
Color task_AlertColor =Colors.black;
Color About_AlertColor =Colors.black;
Color Instructions_AlertColor =Colors.black;

bool _ShowDialog = false;
String JpIcon;

class TileDash extends StatefulWidget {
  @override
  _TileDashState createState() => new _TileDashState();
}

class _TileDashState extends State<TileDash> {
 @override
  void initState() {
    // TODO: implement initState
   JpIcon = "1";
   _ShowDialog = true;
   dialog(context,_ShowDialog);
   //show alert dialog if bool is true
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child: ChildWidget(context), onWillPop: () async => false);
  }
}
Widget ChildWidget(BuildContext context){

  return new Scaffold(body: Center(
    child: Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),

          child: Text("TIME TO SURGERY : $DAYS DAYS",style: TextStyle(fontSize: 20.0),),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50.0,left: 0.0,bottom: 8.0,top: 8.0),
          child: RotatedBox(
            child: Image.asset('assets/images/$JpIcon.png'),
              quarterTurns: 3,
          ),

        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("$JOURNEY_POINT"),
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
          child: FloatingActionButton(
              child: Icon(Icons.message),
              onPressed: ()=>Navigator.pushNamed(context, '/messages'),
              heroTag: "message",
            foregroundColor: message_AlertColor,

          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
              child: Icon(Icons.gavel ),
              onPressed:()=> dialog(context,_ShowDialog),
              heroTag: "Complete task",

            foregroundColor: task_AlertColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
              child: Icon(Icons.info,size: 40.0,),
              onPressed: ()=>Navigator.pushNamed(context, '/info'),
              heroTag: "About my Op",
             foregroundColor: About_AlertColor,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),

          child: FloatingActionButton(
              child: Icon(Icons.directions,size: 40.0,),
              onPressed: ()=>Navigator.pushNamed(context, '/instructions'),
              heroTag: "Instructions to follow",
            foregroundColor: Instructions_AlertColor,
          ),
        ),
      ],
    ),
  ));
}

void dialog(BuildContext context, bool IsAlert)
{
  if(IsAlert) {
    new Future.delayed(Duration.zero, () {
      showDialog(context: context, builder: (context) =>
      new AlertDialog(title: Text(
        "ALERT!", style: TextStyle(color: Colors.orange),
        textAlign: TextAlign.center,),
        content: new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/gavel.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                'PLEASE CLICK BELOW TO COMPLETE INCOMPLETE TASKS',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 30.0),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(onPressed: () {
            Navigator.pop(context);
          }, child: new Text('Later')),
          new FlatButton(onPressed: () {
            Navigator.pushNamed(context, '/taskSelect');
          }, child: new Text('Complete Task')),
        ],
      ));
    });
  }

}


