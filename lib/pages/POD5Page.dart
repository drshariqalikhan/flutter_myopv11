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
bool HasFeverPOD5,
    HasWoundRedOrDischargePOD5,
    HasCalfTenderPOD5,
    HasSOBPOD5,
    HasDysuriaPOD5,
    HasNeededToVisitAePOD5,
    HasNeededToReadmitPOD5,
    _q8Value;
bool _onpress = false;
String Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8;

final String url = "http://myop.pythonanywhere.com/api/POD5/";


class POD5 extends StatefulWidget {

  @override
  _POD5State createState() => new _POD5State();
}

class _POD5State extends State<POD5> {

  void _handleQ1(bool value) {

    setState(() {
      HasFeverPOD5 = value;
      print("q1: $HasFeverPOD5");


    });
  }
  void _handleQ2(bool value) {
    setState(() {
      HasWoundRedOrDischargePOD5 = value;
      print("q2: $HasWoundRedOrDischargePOD5");


    });
  }
  void _handleQ3(bool value) {
    setState(() {
      HasCalfTenderPOD5 = value;
      print("q3: $HasCalfTenderPOD5");


    });
  }
  void _handleQ4(bool value) {
    setState(() {
      HasSOBPOD5 = value;
      print("q4: $HasSOBPOD5");


    });
  }
  void _handleQ5(bool value) {
    setState(() {
      HasDysuriaPOD5 = value;
      print("q5: $HasDysuriaPOD5");


    });
  }
  void _handleQ6(bool value) {
    setState(() {
      HasNeededToVisitAePOD5 = value;
      print("q6: $HasNeededToVisitAePOD5");


    });
  }
  void _handleQ7(bool value) {
    setState(() {
      HasNeededToReadmitPOD5 = value;
      print("q7: $HasNeededToReadmitPOD5");


    });
  }
  void _handleQ8(bool value) {
    setState(() {
      _q8Value = value;
      print("q8: $_q8Value");


    });
  }



  var PainScorePOD5,_val2,_val3,_val4,_val5,_val6,_val7,_val8;
  @override
  initState(){
    PainScorePOD5 = 0.0;
    _val2 = 0.0;
    _val3 = 0.0;
    _val4 = 0.0;
    _val5 = 0.0;
    _val6 = 0.0;
    super.initState();
  }

  _exec1(double val){setState(() {PainScorePOD5 = val;});}
  _exec2(double val){setState(() {_val2 = val;});}
  _exec3(double val){setState(() {_val3 = val;});}
  _exec4(double val){setState(() {_val4 = val;});}
  _exec5(double val){setState(() {_val5 = val;});}
  _exec6(double val){setState(() {_val6 = val;});}


  Widget ChildWidget(BuildContext context, bool _press,String q1,String q2,String q3, String q4, String q5,String q6,String q7,String q8){

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
                      Question: "Do you have pain?",
                      QuestionFontsize: 20.0,
                      slider: Slider(
                          divisions: 4,
                          max: 4.0,
                          min: 0.0,
                          value: PainScorePOD5,
                          onChanged: _exec1),
                      options: <Widget>[Text("I have NO pain or discomfort"),
                      Text("I have SLIGHT pain or discomfort"),
                      Text("I have MODERATE pain or discomfort"),
                      Text("I have SEVERE pain or discomfort"),
                      Text("I have EXTREME pain or discomfort"),],

                    ),
                  ),


                  QuestionCard(
                    Question: q1,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ1,
                    qValue: HasFeverPOD5,
                  ),
                  QuestionCard(
                    Question: q2,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ2,
                    qValue: HasWoundRedOrDischargePOD5,
                  ),
                  QuestionCard(
                    Question: q3,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ3,
                    qValue: HasCalfTenderPOD5,
                  ),
                  QuestionCard(
                    Question: q4,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ4,
                    qValue: HasSOBPOD5,
                  ),
                  QuestionCard(
                    Question: q5,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ5,
                    qValue: HasDysuriaPOD5,
                  ),
                  QuestionCard(
                    Question: q6,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ6,
                    qValue: HasNeededToVisitAePOD5,
                  ),
                  QuestionCard(
                    Question: q7,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ7,
                    qValue: HasNeededToReadmitPOD5,
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
            print("success");
            //TODO:  save bools in SP
            print("${PainScorePOD5.round()}");
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
    int mPainScorePOD5 = PainScorePOD5.round();



    print("getting response with $token");
    var response = await http.put(
      Uri.encodeFull(url),
      headers: {"AUTHORIZATION": "Token $token"},
      body: {
        "journey_point":"POD5WoundPhoto",
        "HasCalfTenderPOD5":HasCalfTenderPOD5.toString(),
        "HasSOBPOD5":HasSOBPOD5.toString(),
        "HasFeverPOD5":HasFeverPOD5.toString(),
        "HasDysuriaPOD5":HasDysuriaPOD5.toString(),
        "HasWoundRedOrDischargePOD5":HasWoundRedOrDischargePOD5.toString(),
        "HasNeededToVisitAePOD5":HasNeededToVisitAePOD5.toString(),
        "HasNeededToReadmitPOD5":HasNeededToReadmitPOD5.toString(),


        "PainScorePOD5":mPainScorePOD5.toString(),

      },

    );

    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    if(HasFeverPOD5 != null && HasWoundRedOrDischargePOD5 != null && HasCalfTenderPOD5 != null && HasSOBPOD5 != null && HasDysuriaPOD5 != null && HasNeededToVisitAePOD5 != null && HasNeededToReadmitPOD5 != null&& _q8Value != null ) {_onpress = true;}
    //TODO:get data from SP
    Q1="Do you have any fever , cold or ongoing infection?";
    Q2="Do you have any wound Reddness or discharge?";
    Q3="Does your calf look unusually red or feel tender and firm?";
    Q4="Do you have any shortness of breath?";
    Q5="Do you have any new urinary retention, burning or increased urge to pass urine?";
    Q6="Have you had any unplanned VISIT to hospital?";
    Q7 = "Have you had any unplanned READMISSION to hospital?";


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
