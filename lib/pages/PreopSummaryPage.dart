import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_myopv10/Components/QuestionCard.dart';

double qsize = 20.0;

bool _q1Value;
bool _onpress = false;
String Q1;

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => new _SummaryState();
}

class _SummaryState extends State<Summary> {
  void _handleQ1(bool value) {

    setState(() {
      _q1Value = value;
      print("q1: $_q1Value");


    });
  }

  Widget ChildWidget(BuildContext context, bool _press,String q1){

    return Scaffold(
      appBar: MyAppbar(),
      body: new CustomScrollView(
        primary: true,
        slivers: <Widget>[
          new SliverToBoxAdapter(child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            children: <Widget>
            [
              Column(
                mainAxisAlignment:MainAxisAlignment.start,
                children: <Widget>
                [
                  Card(child: Text("List here"),),//TODO: show list of positive responses
                  QuestionCard(
                    Question: q1,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ1,
                    qValue: _q1Value,
                  ),

                  SizedBox(height: 50.0,),
                ],//colum children
              ),

            ],
          ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: (){
          if(_press)
          {
            //TODO:  save bools in SP
            print(_q1Value);
            if(_q1Value){btnAxn();}else{ Navigator.of(context).pushNamed('/splash');}
          }
          else
          {
            print("unsuccess");
            Fluttertoast.showToast(
                msg: "Please answer the question before next page",
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
    sendData().whenComplete(gotonext);
  }
  Future sendData()async{
    saveBoolSP("HasCompletedPreopTask", _q1Value);
    //TODO: send data to server and get back a status 200 before going back to the splash


  }
  void gotonext() {
//    Navigator.of(context).pushNamed('/splash');
  }

  @override
  Widget build(BuildContext context) {
    if(_q1Value != null ) {_onpress = true;}
    //TODO:get data from SP
    Q1=" Do you agree with this summary of your responses?";


    return new WillPopScope(child: ChildWidget(context,_onpress,Q1), onWillPop: () async => false);
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