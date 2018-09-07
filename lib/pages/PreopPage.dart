import 'package:flutter/material.dart';


double qsize = 20.0;
double DIM_BUTTON = 0.5;
double SHOW_BUTTON = 1.0;
double PR0GRESS = 0.1;

class preop extends StatefulWidget {
  @override
  _preopState createState() => new _preopState();
}

class _preopState extends State<preop> {

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child: ChildWidget(context), onWillPop: () async => false);
  }
}

Widget ChildWidget(BuildContext context){


  return new Scaffold(body: Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 30.0,bottom: 10.0,left: 8.0,right: 8.0),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.start,
        children: <Widget>
        [

          LinearProgressIndicator(backgroundColor: Colors.blueAccent,value: PR0GRESS,),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Can you easily climb 2 flights of stairs?",textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),
                RadioListTile(
                    title: Text("YES"),
                    value: null,
                    groupValue: null,
                    onChanged: null),
                RadioListTile(
                    title: Text("NO"),
                    value: null,
                    groupValue: null,
                    onChanged: null),


                Divider(
                  color: Colors.blue,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Can you easily climb 2 flights of stairs?",textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),
                RadioListTile(
                    title: Text("YES"),
                    value: null,
                    groupValue: null,
                    onChanged: null),
                RadioListTile(
                    title: Text("NO"),
                    value: null,
                    groupValue: null,
                    onChanged: null),
                Divider(
                  color: Colors.blue,
                )
              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Can you easily climb 2 flights of stairs?",textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),

                RadioListTile(
                    title: Text("YES"),
                    value: null,
                    groupValue: null,
                    onChanged: null),
                RadioListTile(
                    title: Text("NO"),
                    value: null,
                    groupValue: null,
                    onChanged: null),
                Divider(
                  color: Colors.blue,
                )
              ],
            ),

          ),

        ],
      ),
    ),
  ),
    floatingActionButton: Opacity(
        opacity: SHOW_BUTTON,
      child: FloatingActionButton(
        child: Icon(Icons.navigate_next),
          onPressed: (){print("pressed");}
      ),
    )
  );
}
