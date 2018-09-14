import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

double qsize = 20.0;
double PR0GRESS = 1/7;
bool _q1Value,_q2Value;
bool _onpress = false;
String Q1,Q2;

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



  Widget ChildWidget(BuildContext context, bool _press,String q1,String q2){

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
                  Image.asset('assets/images/fb.png'),
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
                  Image.asset('assets/images/headupdown.jpg'),
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
              SizedBox(height: 50.0,),

              //////////////////////////////////////////////////////
            ],
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

  void btnAxn(){
    saveData().whenComplete(gotonext);
  }
  Future saveData()async{
    saveBoolSP("HasAdeqMouthOpening", _q1Value);
    saveBoolSP("HasAdeqNeckMov", _q2Value);

  }
  void gotonext() {
    Navigator.of(context).pushNamed('/preop2');
  }


  @override
  Widget build(BuildContext context) {
    if(_q1Value != null && _q2Value != null) {_onpress = true;}
    //TODO:get data from SP
    Q1="Can you open your MOUTH 2 fingers wide?";
    Q2="Can you move your HEAD all the way up and down?";


    return new WillPopScope(child: ChildWidget(context,_onpress,Q1,Q2), onWillPop: () async => false);
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