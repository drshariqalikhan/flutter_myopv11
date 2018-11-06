import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/ColSlider.dart';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:flutter_myopv10/Components/QuestionCard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


double qsize = 20.0;
bool HasFeverInfecRem1,HasLooseTeethRem1,IsPregnantRem1,IsHavingOpRem1;
bool _onpress = false;
String Q1,Q2,Q3,Q4;
final String url = "http://myop.pythonanywhere.com/api/reminder1/";

class Reminder1 extends StatefulWidget {

  @override
  _Reminder1State createState() => new _Reminder1State();
}

class _Reminder1State extends State<Reminder1> {

  void _handleQ1(bool value) {

    setState(() {
      HasFeverInfecRem1 = value;
      print("q1: $HasFeverInfecRem1");


    });
  }
  void _handleQ2(bool value) {
    setState(() {
      HasLooseTeethRem1 = value;
      print("q2: $HasLooseTeethRem1");


    });
  }
  void _handleQ3(bool value) {
    setState(() {
      IsPregnantRem1 = value;
      print("q3: $IsPregnantRem1");


    });
  }
  void _handleQ4(bool value) {
    setState(() {
      IsHavingOpRem1 = value;
      print("q4: $IsHavingOpRem1");


    });
  }

  var ADL_ScoreRem1,MobilityScoreRem1,Active_ScoreRem1,PainScoreRem1,MoodScoreRem1;

  @override
  initState(){
    ADL_ScoreRem1 = 0.0;
    MobilityScoreRem1 = 0.0;
    Active_ScoreRem1 = 0.0;
    PainScoreRem1 = 0.0;
    MoodScoreRem1 = 0.0;
    super.initState();
  }

  _exec1(double val){setState(() {ADL_ScoreRem1 = val;});}
  _exec2(double val){setState(() {MobilityScoreRem1 = val;});}
  _exec3(double val){setState(() {Active_ScoreRem1 = val;});}
  _exec4(double val){setState(() {PainScoreRem1 = val;});}
  _exec5(double val){setState(() {MoodScoreRem1 = val;});}


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
                    qValue: IsHavingOpRem1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColSlider(
                      Question: "How well can you take care of your self?",
                      QuestionFontsize: 20.0,
                      slider: Slider(divisions: 4, max: 4.0, min: 0.0, value: ADL_ScoreRem1, onChanged: _exec1),
                      options: <Widget>[Text("I have NO PROBLEM washing or dressing myself"),
                      Text("I have SLIGHT PROBLEM washing or dressing myself"),
                      Text("I have MODERATE PROBLEM washing or dressing myself"),
                      Text("I have SEVERE PROBLEM washing or dressing myself"),
                      Text("I am UNABLE washing or dressing myself"),],

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColSlider(
                      Question: "How well can you move about?",
                      QuestionFontsize: 20.0,
                      slider: Slider(
                          divisions: 4,
                          max: 4.0,
                          min: 0.0,
                          value: MobilityScoreRem1,
                          onChanged: _exec2),
                      options: <Widget>[Text("I have NO PROBLEM in walking about"),
                      Text("I have SLIGHT PROBLEM walking about"),
                      Text("I have MODERATE PROBLEM walking about"),
                      Text("I have SEVERE PROBLEM walking about"),
                      Text("I am UNABLE walking about"),],

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColSlider(
                      Question: "How well can you perform usual activities like housework?",
                      QuestionFontsize: 20.0,
                      slider: Slider(
                          divisions: 4,
                          max: 4.0,
                          min: 0.0,
                          value: Active_ScoreRem1,
                          onChanged: _exec3),
                      options: <Widget>[Text("I have NO PROBLEM in usual activities"),
                      Text("I have SLIGHT PROBLEM in usual activities"),
                      Text("I have MODERATE PROBLEM in usual activities"),
                      Text("I have SEVERE PROBLEM in usual activities"),
                      Text("I am UNABLE to perform usual activities"),],

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColSlider(
                      Question: "Do you have pain?",
                      QuestionFontsize: 20.0,
                      slider: Slider(
                          divisions: 4,
                          max: 4.0,
                          min: 0.0,
                          value: PainScoreRem1,
                          onChanged: _exec4),
                      options: <Widget>[Text("I have NO pain or discomfort"),
                      Text("I have SLIGHT pain or discomfort"),
                      Text("I have MODERATE pain or discomfort"),
                      Text("I have SEVERE pain or discomfort"),
                      Text("I have EXTREME pain or discomfort"),],

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColSlider(
                      Question: "Are you Anxious or depressed?",
                      QuestionFontsize: 20.0,
                      slider: Slider(
                          divisions: 4,
                          max: 4.0,
                          min: 0.0,
                          value: MoodScoreRem1,
                          onChanged: _exec5),
                      options: <Widget>[Text("I am NOT anxious or depressed"),
                      Text("I am SLIGHTLY anxious or depressed"),
                      Text("I am MODERATLY anxious or depressed"),
                      Text("I am SEVERELY anxious or depressed"),
                      Text("I am EXTREMELY anxious or depressed"),],

                    ),
                  ),

                  QuestionCard(
                    Question: q1,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ1,
                    qValue: HasFeverInfecRem1,
                  ),
                  QuestionCard(
                    Question: q2,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ2,
                    qValue: HasLooseTeethRem1,
                  ),
                  QuestionCard(
                    Question: q3,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ3,
                    qValue: IsPregnantRem1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.2),
                ],//colum children
              ),

            ],
          ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: ()async{
          if(_press)
          {
            print("success");
            //TODO:  save bools in SP
//
//            print("How well can you take care of your self?:${ADL_ScoreRem1.round()}");
//            print("How well can you move about?:${MobilityScoreRem1.round()}");
//            print("How well can you perform usual activities like housework?:${Active_ScoreRem1.round()}");
//            print("Do you have pain?:${PainScoreRem1.round()}");
//            print("Are you Anxious or depressed?:${MoodScoreRem1.round()}");
//
//
//            print("Do you have any fever , cold or ongoing infection?: $HasFeverInfecRem1");
//            print("Do you have any loose teeth?: $HasLooseTeethRem1");
//            print("Are you pregnant?: $IsPregnantRem1");
//            print("Do you want to cancel or postpone the surgery?: $IsHavingOpRem1");
//            getSP("TOKEN").then(sendData).then(SaveDataFromServer);
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
//  Future<http.Response> sendData(String token)async{
//    int mADL_ScoreRem1 = ADL_ScoreRem1.round();
//    int mMobilityScoreRem1 = MobilityScoreRem1.round();
//    int mActive_ScoreRem1 = Active_ScoreRem1.round();
//    int mPainScoreRem1 = PainScoreRem1.round();
//    int mMoodScoreRem1 = MoodScoreRem1.round();
//
//    print("getting response with $token");
//    var response = await http.put(
//      Uri.encodeFull(url),
//      headers: {"AUTHORIZATION": "Token $token"},
//      body: {
////        "journey_point":"Reminder2",
//        "HasFeverInfecRem1":HasFeverInfecRem1.toString(),
//        "HasLooseTeethRem1":HasLooseTeethRem1.toString(),
//        "IsPregnantRem1":IsPregnantRem1.toString(),
//        "IsHavingOpRem1":IsHavingOpRem1.toString(),
//
//        "ADL_ScoreRem1":mADL_ScoreRem1.toString(),
//        "MobilityScoreRem1":mMobilityScoreRem1.toString(),
//        "Active_ScoreRem1":mActive_ScoreRem1.toString(),
//        "PainScoreRem1":mPainScoreRem1.toString(),
//        "MoodScoreRem1":mMoodScoreRem1.toString()
//      },
//
//    );
//
//    return response;
//  }


  Future<int> sendData(String token)async{
    int mADL_ScoreRem1 = ADL_ScoreRem1.round();
    int mMobilityScoreRem1 = MobilityScoreRem1.round();
    int mActive_ScoreRem1 = Active_ScoreRem1.round();
    int mPainScoreRem1 = PainScoreRem1.round();
    int mMoodScoreRem1 = MoodScoreRem1.round();

        print("getting response with $token");
    var response = await http.put(
      Uri.encodeFull(url),
      headers: {"AUTHORIZATION": "Token $token"},
      body: {
        "journey_point":"Reminder2",
        "HasFeverInfecRem1":HasFeverInfecRem1.toString(),
        "HasLooseTeethRem1":HasLooseTeethRem1.toString(),
        "IsPregnantRem1":IsPregnantRem1.toString(),
        "IsHavingOpRem1":IsHavingOpRem1.toString(),

        "ADL_ScoreRem1":mADL_ScoreRem1.toString(),
        "MobilityScoreRem1":mMobilityScoreRem1.toString(),
        "Active_ScoreRem1":mActive_ScoreRem1.toString(),
        "PainScoreRem1":mPainScoreRem1.toString(),
        "MoodScoreRem1":mMoodScoreRem1.toString()
      },

    );

    return response.statusCode;
  }



  @override
  Widget build(BuildContext context) {
    if(HasFeverInfecRem1 != null && HasLooseTeethRem1 != null && IsPregnantRem1 != null && IsHavingOpRem1 != null ) {_onpress = true;}
    //TODO:get data from SP
    Q1="Do you have any fever , cold or ongoing infection?";
    Q2="Do you have any loose teeth?";
    Q3="Are you pregnant?";
    Q4="Do you want to cancel or postpone the surgery?";

    return new WillPopScope(child: ChildWidget(context,_onpress,Q1,Q2,Q3,Q4), onWillPop: () async => false);
  }
}




Future <String> getSP(String key)async{
  print("getting $key");
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(key)?? "100";
}
//
//Future <int> getIntSP(String key)async{
//  print("getting $key");
//  SharedPreferences pref = await SharedPreferences.getInstance();
//  return pref.getString(key)?? 100;
//}
