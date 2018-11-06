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
bool HasFeverPOD1,
    HasDentalDamagePOD1,
    HasCalfTenderPOD1,
    HasSOBPOD1,
    HasDysuriaRetenPOD1,
    HasNumbnessPOD1;
bool _onpress = false;
String Q1,Q2,Q3,Q4,Q5,Q6;
final String url = "http://myop.pythonanywhere.com/api/POD1/";

class POD1 extends StatefulWidget {

  @override
  _POD1State createState() => new _POD1State();
}

class _POD1State extends State<POD1> {

  void _handleQ1(bool value) {

    setState(() {
      HasFeverPOD1 = value;
      print("q1: $HasFeverPOD1");


    });
  }
  void _handleQ2(bool value) {
    setState(() {
      HasDentalDamagePOD1 = value;
      print("q2: $HasDentalDamagePOD1");


    });
  }
  void _handleQ3(bool value) {
    setState(() {
      HasCalfTenderPOD1 = value;
      print("q3: $HasCalfTenderPOD1");


    });
  }
  void _handleQ4(bool value) {
    setState(() {
      HasSOBPOD1 = value;
      print("q4: $HasSOBPOD1");


    });
  }
  void _handleQ5(bool value) {
    setState(() {
      HasDysuriaRetenPOD1 = value;
      print("q5: $HasDysuriaRetenPOD1");


    });
  }
  void _handleQ6(bool value) {
    setState(() {
      HasNumbnessPOD1 = value;
      print("q6: $HasNumbnessPOD1");


    });
  }

  var PainScoreRestPOD1,PainScoreMovPOD1,PONVScorePOD1,SoreThroatScorePOD1,ItchyScorePOD1,SatisfactionScorePOD1;
  @override
  initState(){
    PainScoreRestPOD1 = 0.0;
    PainScoreMovPOD1 = 0.0;
    PONVScorePOD1 = 0.0;
    SoreThroatScorePOD1 = 0.0;
    ItchyScorePOD1 = 0.0;
    SatisfactionScorePOD1 = 0.0;
    super.initState();
  }

  _exec1(double val){setState(() {PainScoreRestPOD1 = val;});}
  _exec2(double val){setState(() {PainScoreMovPOD1 = val;});}
  _exec3(double val){setState(() {PONVScorePOD1 = val;});}
  _exec4(double val){setState(() {SoreThroatScorePOD1 = val;});}
  _exec5(double val){setState(() {ItchyScorePOD1 = val;});}
  _exec6(double val){setState(() {SatisfactionScorePOD1 = val;});}


  Widget ChildWidget(BuildContext context, bool _press,String q1,String q2,String q3, String q4, String q5,String q6){

    return Scaffold(
      appBar: MyAppbar(myWidget: Text("Please asnwer the following questions:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColSlider(
                      Question: "Do you have pain at REST?",
                      QuestionFontsize: 20.0,
                      slider: Slider(
                          divisions: 4,
                          max: 4.0,
                          min: 0.0,
                          value: PainScoreRestPOD1,
                          onChanged: _exec1),
                      options: <Widget>[Text("I have NO pain or discomfort at REST"),
                      Text("I have SLIGHT pain or discomfort at REST"),
                      Text("I have MODERATE pain or discomfort at REST"),
                      Text("I have SEVERE pain or discomfort at REST"),
                      Text("I have EXTREME pain or discomfort at REST"),],

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColSlider(
                      Question: "Do you have pain at MOVEMENT?",
                      QuestionFontsize: 20.0,
                      slider: Slider(
                          divisions: 4,
                          max: 4.0,
                          min: 0.0,
                          value: PainScoreMovPOD1,
                          onChanged: _exec2),
                      options: <Widget>[Text("I have NO pain or discomfort at MOVEMENT"),
                      Text("I have SLIGHT pain or discomfort at MOVEMENT"),
                      Text("I have MODERATE pain or discomfort at MOVEMENT"),
                      Text("I have SEVERE pain or discomfort at MOVEMENT"),
                      Text("I have EXTREME pain or discomfort at MOVEMENT"),],

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColSlider(
                      Question: "Do you have any Nausea or Vomiting",
                      QuestionFontsize: 20.0,
                      slider: Slider(
                          divisions: 3,
                          max: 3.0,
                          min: 0.0,
                          value: PONVScorePOD1,
                          onChanged: _exec3),
                      options: <Widget>[Text("I have a NO Nausea or Vomitting"),
                      Text("I have SLIGHT Nausea or Voimitting"),
                      Text("I have MODERATE Nausea or Voimitting"),
                      Text("I have SEVERE Nausea or Voimitting"),],

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColSlider(
                      Question: "Do you have any Sorethroat?",
                      QuestionFontsize: 20.0,
                      slider: Slider(
                          divisions: 3,
                          max: 3.0,
                          min: 0.0,
                          value: SoreThroatScorePOD1,
                          onChanged: _exec4),
                      options: <Widget>[Text("I have NO pain or discomfort"),
                      Text("I have SLIGHT pain or discomfort"),
                      Text("I have MODERATE pain or discomfort"),
                      Text("I have SEVERE pain or discomfort"),],


                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColSlider(
                      Question: "Do you have any Itchiness?",
                      QuestionFontsize: 20.0,
                      slider: Slider(
                          divisions: 3,
                          max: 3.0,
                          min: 0.0,
                          value: ItchyScorePOD1,
                          onChanged: _exec5),
                      options: <Widget>[Text("I have NO Itchiness"),
                      Text("I have SLIGHT Itchiness"),
                      Text("I have MODERATE Itchiness"),
                      Text("I have SEVERE Itchiness"),],


                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColSlider(
                      Question: "Are you happy with your care experiance with our hospital so far?",
                      QuestionFontsize: 20.0,
                      slider: Slider(
                          divisions: 4,
                          max: 4.0,
                          min: 0.0,
                          value: SatisfactionScorePOD1,
                          onChanged: _exec6),
                      options: <Widget>[Text("I had a VERY BAD experiance"),
                      Text("I had a SLIGHTLY BAD experiance"),
                      Text("I had an AVERAGE experiance"),
                      Text("I had a VERY GOOD experiance"),
                      Text("I had a EXECELLENT experiance"),],
                    ),
                  ),



                  QuestionCard(
                    Question: q1,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ1,
                    qValue: HasFeverPOD1,
                  ),
                  QuestionCard(
                    Question: q2,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ2,
                    qValue: HasDentalDamagePOD1,
                  ),
                  QuestionCard(
                    Question: q3,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ3,
                    qValue: HasCalfTenderPOD1,
                  ),
                  QuestionCard(
                    Question: q4,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ4,
                    qValue: HasSOBPOD1,
                  ),
                  QuestionCard(
                    Question: q5,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ5,
                    qValue: HasDysuriaRetenPOD1,
                  ),
                  QuestionCard(
                    Question: q6,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ6,
                    qValue: HasNumbnessPOD1,
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
            //TODO:  save bools in SP
//            print("${PainScoreRestPOD1.round()}");
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
    int mSatisfactionScorePOD1 = SatisfactionScorePOD1.round();
    int mPainScoreRestPOD1 = PainScoreRestPOD1.round();
    int mPainScoreMovPOD1 = PainScoreMovPOD1.round();
    int mPONVScorePOD1 = PONVScorePOD1.round();
    int mSoreThroatScorePOD1 = SoreThroatScorePOD1.round();
    int mItchyScorePOD1 = ItchyScorePOD1.round();


    print("getting response with $token");
    var response = await http.put(
      Uri.encodeFull(url),
      headers: {"AUTHORIZATION": "Token $token"},
      body: {
        "journey_point":"POD3",
        "HasDentalDamagePOD1":HasDentalDamagePOD1.toString(),
        "HasCalfTenderPOD1":HasCalfTenderPOD1.toString(),
        "HasSOBPOD1":HasSOBPOD1.toString(),
        "HasFeverPOD1":HasFeverPOD1.toString(),
        "HasDysuriaRetenPOD1":HasDysuriaRetenPOD1.toString(),
        "HasNumbnessPOD1":HasNumbnessPOD1.toString(),


        "SatisfactionScorePOD1":mSatisfactionScorePOD1.toString(),
        "PainScoreRestPOD1":mPainScoreRestPOD1.toString(),
        "PainScoreMovPOD1":mPainScoreMovPOD1.toString(),
        "PONVScorePOD1":mPONVScorePOD1.toString(),
        "SoreThroatScorePOD1":mSoreThroatScorePOD1.toString(),
        "ItchyScorePOD1":mItchyScorePOD1.toString()

      },

    );

    return response.statusCode;
  }


  @override
  Widget build(BuildContext context) {
    if(HasFeverPOD1 != null && HasDentalDamagePOD1 != null && HasCalfTenderPOD1 != null && HasSOBPOD1 != null && HasDysuriaRetenPOD1 != null && HasNumbnessPOD1 != null ) {_onpress = true;}
    //TODO:get data from SP
    Q1="Do you have any fever , cold or ongoing infection?";
    Q2="Do you have any damaged or chipped teeth after surgery?";
    Q3="Does your calf look unusually red or feel tender and firm?";
    Q4="Do you have any shortness of breath?";
    Q5="Do you have any new urinary retention, burning or increased urge to pass urine?";
    Q6="Do you have any new numbness or weakness?";

    return new WillPopScope(child: ChildWidget(context,_onpress,Q1,Q2,Q3,Q4,Q5,Q6), onWillPop: () async => false);
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

//TODO : check
Future saveIntSP(String key,int value)async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.setInt(key, value);
}

Future <String> getSP(String key)async{
  print("getting $key");
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(key)?? "100";
}

Future <int> getIntSP(String key)async{
  print("getting $key");
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(key)?? 100;
}
