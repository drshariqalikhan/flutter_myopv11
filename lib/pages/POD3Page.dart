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
bool HasFeverPOD3,HasWoundRedOrDischargePOD3,HasCalfTenderPOD3,HasSOBPOD3,HasDysuriaRetenPOD3,HasNumbnessPOD3,HasNeededToVisitAePOD3,HasNeededToReadmitPOD3;
bool _onpress = false;
String Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8;

final String url = "http://myop.pythonanywhere.com/api/POD3/";


class POD3 extends StatefulWidget {

  @override
  _POD3State createState() => new _POD3State();
}

class _POD3State extends State<POD3> {

  void _handleQ1(bool value) {

    setState(() {
      HasFeverPOD3 = value;
      print("q1: $HasFeverPOD3");


    });
  }
  void _handleQ2(bool value) {
    setState(() {
      HasWoundRedOrDischargePOD3 = value;
      print("q2: $HasWoundRedOrDischargePOD3");


    });
  }
  void _handleQ3(bool value) {
    setState(() {
      HasCalfTenderPOD3 = value;
      print("q3: $HasCalfTenderPOD3");


    });
  }
  void _handleQ4(bool value) {
    setState(() {
      HasSOBPOD3 = value;
      print("q4: $HasSOBPOD3");


    });
  }
  void _handleQ5(bool value) {
    setState(() {
      HasDysuriaRetenPOD3 = value;
      print("q5: $HasDysuriaRetenPOD3");


    });
  }
  void _handleQ6(bool value) {
    setState(() {
      HasNumbnessPOD3 = value;
      print("q6: $HasNumbnessPOD3");


    });
  }
  void _handleQ7(bool value) {
    setState(() {
      HasNeededToVisitAePOD3 = value;
      print("q7: $HasNeededToVisitAePOD3");


    });
  }
  void _handleQ8(bool value) {
    setState(() {
      HasNeededToReadmitPOD3 = value;
      print("q8: $HasNeededToReadmitPOD3");


    });
  }



  var PainScoreRestPOD3,PainScoreMovPOD3,_val3,_val4,_val5,_val6,_val7,_val8;
  @override
  initState(){
    PainScoreRestPOD3 = 0.0;
    PainScoreMovPOD3 = 0.0;
    _val3 = 0.0;
    _val4 = 0.0;
    _val5 = 0.0;
    _val6 = 0.0;
    super.initState();
  }

  _exec1(double val){setState(() {PainScoreRestPOD3 = val;});}
  _exec2(double val){setState(() {PainScoreMovPOD3 = val;});}
  _exec3(double val){setState(() {_val3 = val;});}
  _exec4(double val){setState(() {_val4 = val;});}
  _exec5(double val){setState(() {_val5 = val;});}
  _exec6(double val){setState(() {_val6 = val;});}


  Widget ChildWidget(BuildContext context, bool _press,String q1,String q2,String q3, String q4, String q5,String q6,String q7,String q8){

    return Scaffold(
      appBar: MyAppbar(myWidget: Text("Please answer the following questions:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
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
                          value: PainScoreRestPOD3,
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
                          value: PainScoreMovPOD3,
                          onChanged: _exec2),
                      options: <Widget>[Text("I have NO pain or discomfort at MOVEMENT"),
                      Text("I have SLIGHT pain or discomfort at MOVEMENT"),
                      Text("I have MODERATE pain or discomfort at MOVEMENT"),
                      Text("I have SEVERE pain or discomfort at MOVEMENT"),
                      Text("I have EXTREME pain or discomfort at MOVEMENT"),],

                    ),
                  ),

                  QuestionCard(
                    Question: q1,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ1,
                    qValue: HasFeverPOD3,
                  ),
                  QuestionCard(
                    Question: q2,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ2,
                    qValue: HasWoundRedOrDischargePOD3,
                  ),
                  QuestionCard(
                    Question: q3,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ3,
                    qValue: HasCalfTenderPOD3,
                  ),
                  QuestionCard(
                    Question: q4,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ4,
                    qValue: HasSOBPOD3,
                  ),
                  QuestionCard(
                    Question: q5,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ5,
                    qValue: HasDysuriaRetenPOD3,
                  ),
                  QuestionCard(
                    Question: q6,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ6,
                    qValue: HasNumbnessPOD3,
                  ),
                  QuestionCard(
                    Question: q7,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ7,
                    qValue: HasNeededToVisitAePOD3,
                  ),
                  QuestionCard(
                    Question: q8,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ8,
                    qValue: HasNeededToReadmitPOD3,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.2,),
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
            print("${PainScoreRestPOD3.round()}");
            getSP("TOKEN").then(sendData)
                .then((int res){res == 200?Navigator.pushNamed(context, '/splash')
                :showDialog(context: context,builder: (context){return AlertDialog(
              title: Text("Error code: $res"),
              actions: <Widget>[
                FlatButton(onPressed: ()=>Navigator.pushNamed(context, '/splash'), child: Text("Close"))
              ],
            );});});          }
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
    int mPainScoreRestPOD3 = PainScoreRestPOD3.round();
    int mPainScoreMovPOD3 = PainScoreMovPOD3.round();


    print("getting response with $token");
    var response = await http.put(
      Uri.encodeFull(url),
      headers: {"AUTHORIZATION": "Token $token"},
      body: {
        "journey_point":"POD3WoundPhoto",
        "HasDysuriaRetenPOD3":HasDysuriaRetenPOD3.toString(),
        "HasNumbnessPOD3":HasNumbnessPOD3.toString(),
        "HasCalfTenderPOD3":HasCalfTenderPOD3.toString(),
        "HasSOBPOD3":HasSOBPOD3.toString(),
        "HasFeverPOD3":HasFeverPOD3.toString(),
        "HasWoundRedOrDischargePOD3":HasWoundRedOrDischargePOD3.toString(),
        "HasNeededToVisitAePOD3":HasNeededToVisitAePOD3.toString(),
        "HasNeededToReadmitPOD3":HasNeededToReadmitPOD3.toString(),

        "PainScoreRestPOD3":mPainScoreRestPOD3.toString(),
        "PainScoreMovPOD3":mPainScoreMovPOD3.toString(),
      },

    );

    return response.statusCode;
  }


  @override
  Widget build(BuildContext context) {
    if(HasFeverPOD3 != null && HasWoundRedOrDischargePOD3 != null && HasCalfTenderPOD3 != null && HasSOBPOD3 != null && HasDysuriaRetenPOD3 != null && HasNumbnessPOD3 != null && HasNeededToVisitAePOD3 != null&& HasNeededToReadmitPOD3 != null ) {_onpress = true;}
    Q1="Do you have any fever , cold or ongoing infection?";
    Q2="Do you have any wound Reddness or discharge?";
    Q3="Does your calf look unusually red or feel tender and firm?";
    Q4="Do you have any shortness of breath?";
    Q5="Do you have any new urinary retention, burning or increased urge to pass urine?";
    Q6="Do you have any new numbness or weakness?";
    Q7 = "Have you had any unplanned VISIT to hospital?";
    Q8 = "Have you had any unplanned READMISSION to hospital?";


    return new WillPopScope(child: ChildWidget(context,_onpress,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8), onWillPop: () async => false);
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
