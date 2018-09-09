import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

double qsize = 20.0;
double PR0GRESS = 0.1;
bool _q1Value,_q2Value,_q3Value,_q4Value,_q5Value;
bool _onpress = false;
String Q1,Q2,Q3,Q4,Q5;

class Reminder1 extends StatefulWidget {

  @override
  _Reminder1State createState() => new _Reminder1State();
}

class _Reminder1State extends State<Reminder1> {

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



  Widget ChildWidget(BuildContext context, bool _press,String q1,String q2, String q3, String q4, String q5){

    return Scaffold(body: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0,bottom: 10.0,left: 8.0,right: 8.0),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          children: <Widget>
          [

            LinearProgressIndicator(backgroundColor: Colors.blueAccent,value: PR0GRESS,),

            //q1
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(q1,textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),
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

            //q2
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(q2,textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),
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
            //q3
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(q3,textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),

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

            //q4
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(q4,textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),

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

            //q5
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(q5,textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),

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

          ],
        ),
      ),
    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: (){
          if(_press)
          {
            print("success");
            //TODO:  save bools in SP
            print(_q5Value);
          }
          else
          {
            print("unsuccess");
            Fluttertoast.showToast(
                msg: "Please answer all questions before next page",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIos: 5,
                bgcolor: "#e74c3c",
                textcolor: '#ffffff'
            );
          }
        },

      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    if(_q1Value != null && _q2Value != null && _q3Value != null && _q4Value != null && _q5Value != null) {_onpress = true;}
    //TODO:get data from SP
    Q1="Can you easily climb 2 flights of stairs?";
    Q2="Can you easily climb 2 flights of stairs?";
    Q3="Can you easily climb 2 flights of stairs?";
    Q4="Can you easily climb 2 flights of stairs?";
    Q5="Can you easily climb 2 flights of stairs?";

    return new WillPopScope(child: ChildWidget(context,_onpress,Q1,Q2,Q3,Q4,Q5), onWillPop: () async => false);
  }
}
