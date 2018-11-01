import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/ColSlider.dart';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:flutter_myopv10/Components/QuestionCard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

double qsize = 20.0;
double PR0GRESS = 0.1;
bool HasFeverInfecRem2,HasLooseTeethRem2,IsPregnantRem2,IsHavingOpRem2;
bool _onpress = false;
String Q1,Q2,Q3,Q4,Q5;
final String url = "http://myop.pythonanywhere.com/api/reminder2/";

class Reminder2 extends StatefulWidget {

  @override
  _Reminder2State createState() => new _Reminder2State();
}

class _Reminder2State extends State<Reminder2> {

  void _handleQ1(bool value) {

    setState(() {
      HasFeverInfecRem2 = value;
      print("q1: $HasFeverInfecRem2");


    });
  }
  void _handleQ2(bool value) {
    setState(() {
      HasLooseTeethRem2 = value;
      print("q2: $HasLooseTeethRem2");


    });
  }
  void _handleQ3(bool value) {
    setState(() {
      IsPregnantRem2 = value;
      print("q3: $IsPregnantRem2");


    });
  }
  void _handleQ4(bool value) {
    setState(() {
      IsHavingOpRem2 = value;
      print("q4: $IsHavingOpRem2");


    });
  }

  @override
  initState(){

    super.initState();
  }



  Widget ChildWidget(BuildContext context, bool _press,String q1,String q2,String q3, String q4){

    return Scaffold(
      appBar: AppBar(leading: Hero(tag: "ic", child:Image.asset('assets/images/speroicon.png') ),title:Text("Please answer the following questions:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
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


                  QuestionCard(
                    Question: q4,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ4,
                    qValue: IsHavingOpRem2,
                  ),

                  QuestionCard(
                    Question: q1,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ1,
                    qValue: HasFeverInfecRem2,
                  ),
                  QuestionCard(
                    Question: q2,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ2,
                    qValue: HasLooseTeethRem2,
                  ),
                  QuestionCard(
                    Question: q3,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ3,
                    qValue: IsPregnantRem2,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.2,),
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
            print("success");
            getSP("TOKEN").then(sendData)
                .then((int res){res == 200?Navigator.pushNamed(context, '/splash')
                :showDialog(context: context,builder: (context){return AlertDialog(
              title: Text("Error code: $res"),
              actions: <Widget>[
                FlatButton(onPressed: ()=>Navigator.pushNamed(context, '/splash'), child: Text("Close"))
              ],
            );});});
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
  Future<int> sendData(String token)async{

    print("getting response with $token");
    var response = await http.put(
      Uri.encodeFull(url),
      headers: {"AUTHORIZATION": "Token $token"},
      body: {
        "journey_point":"UnkwnOpStatus",
        "HasFeverInfecRem2":HasFeverInfecRem2.toString(),
        "HasLooseTeethRem2":HasLooseTeethRem2.toString(),
        "IsPregnantRem2":IsPregnantRem2.toString(),
        "IsHavingOpRem2":IsHavingOpRem2.toString(),
      },

    );

    return response.statusCode;
  }


//
//  void btnAxn(){
//    saveData().whenComplete(gotonext);
//  }
//  Future saveData()async{
//    saveBoolSP("HasFeverInfecRem2", _q1Value);
//    saveBoolSP("HasLooseTeethRem2", _q2Value);
//    saveBoolSP("IsPregnantRem2", _q3Value);
//    saveBoolSP("IsHavingOpRem2", _q4Value);
//
//
//  }
//  void gotonext() {
//    Navigator.of(context).pushNamed('/splash');
//  }


  @override
  Widget build(BuildContext context) {
    if(HasFeverInfecRem2 != null && HasLooseTeethRem2 != null && IsPregnantRem2 != null && IsHavingOpRem2 != null ) {_onpress = true;}
    //TODO:get data from SP
    Q1="Do you have any fever , cold or ongoing infection?";
    Q2="Do you have any loose teeth?";
    Q3="Are you pregnant?";
    Q4="Do you want to cancel or postpone the surgery?";

    return new WillPopScope(child: ChildWidget(context,_onpress,Q1,Q2,Q3,Q4), onWillPop: () async => false);
  }
}


//Future<bool> saveSP(String key,String value)async{
//  SharedPreferences pref = await SharedPreferences.getInstance();
//  return pref.setString(key, value);
//}
//
//Future<bool> saveBoolSP(String key,bool value)async{
//  SharedPreferences pref = await SharedPreferences.getInstance();
//  return pref.setBool(key, value);
//}

//Future saveIntSP(String key,int value)async{
//  SharedPreferences pref = await SharedPreferences.getInstance();
//  return pref.setInt(key, value);
//}

Future <String> getSP(String key)async{
  print("getting $key");
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(key)?? "100";
}

//Future <int> getIntSP(String key)async{
//  print("getting $key");
//  SharedPreferences pref = await SharedPreferences.getInstance();
//  return pref.getString(key)?? 100;
//}
