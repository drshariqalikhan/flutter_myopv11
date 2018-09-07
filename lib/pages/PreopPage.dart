import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/RadioItem.dart';


double qsize = 20.0;
double DIM_BUTTON = 0.5;
double SHOW_BUTTON = 1.0;
double PR0GRESS = 0.1;
bool _q1Value,_q2Value,_q3Value,_q4Value,_q5Value,_q6Value;


class preop extends StatefulWidget {

  @override
  _preopState createState() => new _preopState();
}

class _preopState extends State<preop> {

  void _handleQ1(bool value) {

   setState(() {
     _q1Value = value;
     print("q1: $_q1Value");


   });
 }
 void _handleQ2(bool value) {
   setState(() {
     _q2Value = value;
     print("q2: $_q2Value");


   });
 }
 void _handleQ3(bool value) {
   setState(() {
     _q3Value = value;
     print("q3: $_q3Value");


   });
 }
 void _handleQ4(bool value) {
   setState(() {
     _q4Value = value;
     print("q4: $_q4Value");


   });
 }
 void _handleQ5(bool value) {
   setState(() {
     _q5Value = value;
     print("q5: $_q5Value");


   });
 }
 void _handleQ6(bool value) {
   setState(() {
     _q6Value = value;
     print("q6: $_q6Value");


   });
 }


double ShowButton(bool _q1Value, bool _q2Value, bool _q3Value,bool _q4Value,bool _q5Value,bool _q6Value)
{
  if(_q1Value == null||_q2Value== null ||_q3Value== null ||_q4Value== null ||_q5Value== null ||_q6Value== null )
    {
      return 0.5;
    }
  else
    {
      return 0.1;
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("YES"),
                      Radio(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          value: true,
                          groupValue: _q1Value,
                          onChanged: _handleQ1),
                      SizedBox(width: 200.0,),
                      Text("NO"),
                      Radio(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          value: false,
                          groupValue: _q1Value,
                          onChanged: _handleQ1)
                    ],
                  ),

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("YES"),
                      Radio(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          value: true,
                          groupValue: _q2Value,
                          onChanged: _handleQ2),
                      SizedBox(width: 200.0,),
                      Text("NO"),
                      Radio(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          value: false,
                          groupValue: _q2Value,
                          onChanged: _handleQ2)
                    ],
                  ),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("YES"),
                      Radio(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          value: true,
                          groupValue: _q3Value,
                          onChanged: _handleQ3),
                      SizedBox(width: 200.0,),

                      Text("NO"),
                      Radio(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          value: false,
                          groupValue: _q3Value,
                          onChanged: _handleQ3)
                    ],
                  ),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("YES"),
                      Radio(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          value: true,
                          groupValue: _q4Value,
                          onChanged: _handleQ4),
                      SizedBox(width: 200.0,),

                      Text("NO"),
                      Radio(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          value: false,
                          groupValue: _q4Value,
                          onChanged: _handleQ4)
                    ],
                  ),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("YES"),
                      Radio(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          value: true,
                          groupValue: _q5Value,
                          onChanged: _handleQ5),
                      SizedBox(width: 200.0,),

                      Text("NO"),
                      Radio(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          value: false,
                          groupValue: _q5Value,
                          onChanged: _handleQ5)
                    ],
                  ),
                  Divider(
                    color: Colors.blue,
                  )
                ],
              ),

            ),
//            Padding(
//              padding: EdgeInsets.all(0.0),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Text("Can you easily climb 2 flights of stairs?",textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),
//
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Text("YES"),
//                      Radio(
//                          materialTapTargetSize: MaterialTapTargetSize.padded,
//                          value: true,
//                          groupValue: _q6Value,
//                          onChanged: _handleQ6),
//                      Text("NO"),
//                      Radio(
//                          materialTapTargetSize: MaterialTapTargetSize.padded,
//                          value: false,
//                          groupValue: _q6Value,
//                          onChanged: _handleQ6)
//                    ],
//                  ),
//                  Divider(
//                    color: Colors.blue,
//                  )
//                ],
//              ),
//
//            ),
          ],
        ),
      ),
    ),
        floatingActionButton: Opacity(
          opacity: ShowButton(_q1Value,_q2Value,_q3Value,_q4Value,_q5Value,_q6Value),
          child: FloatingActionButton(
              child: Icon(Icons.navigate_next),
              onPressed: () {

                if (ShowButton(_q1Value, _q2Value, _q3Value, _q4Value, _q5Value,
                    _q6Value) == 1.0) {
                  print("pressed");
                }
                else
                  {
                    print("");
                  }
              }
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child: ChildWidget(context), onWillPop: () async => false);
  }
}

