import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:flutter_myopv10/Components/QuestionCard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

double qsize = 20.0;
double PR0GRESS = 2/7;
bool _q1Value,_q2Value,_q3Value,_q4Value,_q5Value;
bool _onpress = false;
String Q1,Q2,Q3,Q4,Q5;

class preopTwo extends StatefulWidget {

  @override
  _preopTwoState createState() => new _preopTwoState();
}

class _preopTwoState extends State<preopTwo> {

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
      //appBar: MyAppbar(myWidget: LinearProgressIndicator(value: PR0GRESS,),),
      appBar: AppBar(
        title: Center(child: LinearProgressIndicator(value: PR0GRESS,)),
        leading: Hero(tag: "ic", child: Image.asset('assets/images/speroicon.png')),
        backgroundColor: Colors.black,
      ),
      body: new CustomScrollView(
        primary: true,
        slivers: <Widget>[
          new SliverToBoxAdapter(child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            children: <Widget>
            [
              QuestionCard(
                Question: q1,
                QuestionFontsize: qsize,
                qValue: _q1Value,
                handleQ:_handleQ1 ,
              ),
              QuestionCard(
                Question: q2,
                QuestionFontsize: qsize,
                qValue: _q2Value,
                handleQ:_handleQ2 ,
              ),QuestionCard(
                Question: q3,
                QuestionFontsize: qsize,
                qValue: _q3Value,
                handleQ:_handleQ3 ,
              ),QuestionCard(
                Question: q4,
                QuestionFontsize: qsize,
                qValue: _q4Value,
                handleQ:_handleQ4 ,
              ),QuestionCard(
                Question: q5,
                QuestionFontsize: qsize,
                qValue: _q5Value,
                handleQ:_handleQ5 ,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),


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
    Q1="Can you easily climb 2 flights of stairs?";
    Q2="Do you have a fever, cold or infection?";
    Q3="Do you have any loose teeth?";
    Q4="Do you have teeth implants or crowns?";
    Q5="Are you pregnant?";

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