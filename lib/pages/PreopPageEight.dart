import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

double qsize = 20.0;
double PR0GRESS = 8/8;
bool _q1Value,_q2Value,_q3Value,_q4Value,_q5Value;
bool _onpress = false;
String Q1,Q2,Q3,Q4,Q5;

class preopEight extends StatefulWidget {

  @override
  _preopEightState createState() => new _preopEightState();
}

class _preopEightState extends State<preopEight> {

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


  Widget ChildWidget(BuildContext context, bool _press,String q1,String q2,String q3, String q4, String q5){

    return Scaffold(
      appBar: MyAppbar(myWidget: LinearProgressIndicator(value: PR0GRESS,),),
      body: new CustomScrollView(
        primary: true,
        slivers: <Widget>[
          new SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.only(top: 30.0,bottom: 8.0,left: 8.0,right: 8.0),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.start,
              children: <Widget>
              [
                Column(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: <Widget>
                  [
                    /////////////////////////////////////////////////////////////
                    //q1
                    Column(
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

                    //q2
                    Column(
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
                    //q3
                    Column(
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

                    //q4
                    Column(
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

                    //q5
                    Column(
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

                    //////////////////////////////////////////////////////
                    SizedBox(height: 50.0,),
                  ],//colum children
                ),

              ],
            ),
          ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: (){
          if(_press)
          {
            print("success");
            //TODO:  save bools in SP
            print(_q1Value);
            btnAxn();
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

//  Widget ChildWidget(BuildContext context, bool _press,String q1,String q2, String q3, String q4, String q5){
//
//    return Scaffold(
//        body: Center(
//      child: Padding(
//        padding: const EdgeInsets.only(top: 30.0,bottom: 10.0,left: 8.0,right: 8.0),
//        child: Column(
//          mainAxisAlignment:MainAxisAlignment.start,
//          children: <Widget>
//          [
//
//            LinearProgressIndicator(backgroundColor: Colors.blueAccent,value: PR0GRESS,),
//
//            //q1
//            Padding(
//              padding: EdgeInsets.all(0.0),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Text(q1,textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Text("YES"),
//                      Radio(
//                          materialTapTargetSize: MaterialTapTargetSize.padded,
//                          value: true,
//                          groupValue: _q1Value,
//                          onChanged: _handleQ1),
//                      SizedBox(width: 200.0,),
//                      Text("NO"),
//                      Radio(
//                          materialTapTargetSize: MaterialTapTargetSize.padded,
//                          value: false,
//                          groupValue: _q1Value,
//                          onChanged: _handleQ1)
//                    ],
//                  ),
//
//                  Divider(
//                    color: Colors.blue,
//                  )
//                ],
//              ),
//            ),
//
//            //q2
//            Padding(
//              padding: EdgeInsets.all(0.0),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Text(q2,textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Text("YES"),
//                      Radio(
//                          materialTapTargetSize: MaterialTapTargetSize.padded,
//                          value: true,
//                          groupValue: _q2Value,
//                          onChanged: _handleQ2),
//                      SizedBox(width: 200.0,),
//                      Text("NO"),
//                      Radio(
//                          materialTapTargetSize: MaterialTapTargetSize.padded,
//                          value: false,
//                          groupValue: _q2Value,
//                          onChanged: _handleQ2)
//                    ],
//                  ),
//                  Divider(
//                    color: Colors.blue,
//                  )
//                ],
//              ),
//
//            ),
//            //q3
//            Padding(
//              padding: EdgeInsets.all(0.0),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Text(q3,textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),
//
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Text("YES"),
//                      Radio(
//                          materialTapTargetSize: MaterialTapTargetSize.padded,
//                          value: true,
//                          groupValue: _q3Value,
//                          onChanged: _handleQ3),
//                      SizedBox(width: 200.0,),
//
//                      Text("NO"),
//                      Radio(
//                          materialTapTargetSize: MaterialTapTargetSize.padded,
//                          value: false,
//                          groupValue: _q3Value,
//                          onChanged: _handleQ3)
//                    ],
//                  ),
//                  Divider(
//                    color: Colors.blue,
//                  )
//                ],
//              ),
//
//            ),
//
//            //q4
//            Padding(
//              padding: EdgeInsets.all(0.0),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Text(q4,textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),
//
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Text("YES"),
//                      Radio(
//                          materialTapTargetSize: MaterialTapTargetSize.padded,
//                          value: true,
//                          groupValue: _q4Value,
//                          onChanged: _handleQ4),
//                      SizedBox(width: 200.0,),
//
//                      Text("NO"),
//                      Radio(
//                          materialTapTargetSize: MaterialTapTargetSize.padded,
//                          value: false,
//                          groupValue: _q4Value,
//                          onChanged: _handleQ4)
//                    ],
//                  ),
//                  Divider(
//                    color: Colors.blue,
//                  )
//                ],
//              ),
//
//            ),
//
//            //q5
//            Padding(
//              padding: EdgeInsets.all(0.0),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Text(q5,textAlign: TextAlign.justify,style: TextStyle(fontSize: qsize,fontWeight: FontWeight.bold),),
//
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Text("YES"),
//                      Radio(
//                          materialTapTargetSize: MaterialTapTargetSize.padded,
//                          value: true,
//                          groupValue: _q5Value,
//                          onChanged: _handleQ5),
//                      SizedBox(width: 200.0,),
//
//                      Text("NO"),
//                      Radio(
//                          materialTapTargetSize: MaterialTapTargetSize.padded,
//                          value: false,
//                          groupValue: _q5Value,
//                          onChanged: _handleQ5)
//                    ],
//                  ),
//                  Divider(
//                    color: Colors.blue,
//                  )
//                ],
//              ),
//
//            ),
//
//          ],
//        ),
//      ),
//    ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.navigate_next),
//        onPressed: (){
//          if(_press)
//          {
//            print("success");
//            //TODO:  save bools in SP
//            print(_q5Value);
//            btnAxn();
//          }
//          else
//          {
//            print("unsuccess");
//            Fluttertoast.showToast(
//                msg: "Please answer all questions before next page",
//                toastLength: Toast.LENGTH_SHORT,
//                gravity: ToastGravity.CENTER,
//                timeInSecForIos: 5,
//                bgcolor: "#e74c3c",
//                textcolor: '#ffffff'
//            );
//          }
//        },
//
//      ),
//    );
//  }

  void btnAxn(){
    saveData().whenComplete(gotonext);
  }
  Future saveData()async{
    saveBoolSP("CanClimbStairs", _q1Value);
    saveBoolSP("HasFeverInfec", _q2Value);
    saveBoolSP("HasLooseTeeth", _q3Value);
    saveBoolSP("HasDentalImplant", _q4Value);
    saveBoolSP("IsPregnant", _q5Value);


  }
  void gotonext() {
    Navigator.of(context).pushNamed('/preop3');
  }


  @override
  Widget build(BuildContext context) {
    if(_q1Value != null && _q2Value != null && _q3Value != null && _q4Value != null && _q5Value != null) {_onpress = true;}
    //TODO:get data from SP
    Q1="Do you have relatives who had reaction to Anaesthesia?";
    Q2="Did you have operations or surgeries in the past?";
    Q3="Did you get Nausea or Vomiting after surgery?";
    Q4="";
    Q5="";

    return new WillPopScope(child: ChildWidget(context,_onpress,Q1,Q2,Q3,Q4,Q5), onWillPop: () async => false);
  }
}


Future<bool> saveSP(String key,String value)async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.setString(key, value);
}

Future<bool> saveBoolSP(String key,bool value)async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.setBool(key, value);
}

Future <String> getSP(String key)async{
  print("getting $key");
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(key)?? "100";
}

Future <int> getIntSP(String key)async{
  print("getting $key");
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(key)?? 1;
}