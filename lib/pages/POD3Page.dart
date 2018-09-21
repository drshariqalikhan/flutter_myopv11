import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/ColSlider.dart';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:flutter_myopv10/Components/QuestionCard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

double qsize = 20.0;
double PR0GRESS = 0.1;
bool _q1Value,_q2Value,_q3Value,_q4Value,_q5Value,_q6Value,_q7Value,_q8Value;
bool _onpress = false;
String Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8;

class POD3 extends StatefulWidget {

  @override
  _POD3State createState() => new _POD3State();
}

class _POD3State extends State<POD3> {

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
  void _handleQ6(bool value) {
    setState(() {
      _q6Value = value;
      print("q6: $_q6Value");


    });
  }
  void _handleQ7(bool value) {
    setState(() {
      _q7Value = value;
      print("q7: $_q7Value");


    });
  }
  void _handleQ8(bool value) {
    setState(() {
      _q8Value = value;
      print("q8: $_q8Value");


    });
  }



  var _val1,_val2,_val3,_val4,_val5,_val6,_val7,_val8;
  @override
  initState(){
    _val1 = 0.0;
    _val2 = 0.0;
    _val3 = 0.0;
    _val4 = 0.0;
    _val5 = 0.0;
    _val6 = 0.0;
    super.initState();
  }

  _exec1(double val){setState(() {_val1 = val;});}
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
                      Question: "Do you have pain at REST?",
                      QuestionFontsize: 20.0,
                      slider: Slider(
                          divisions: 4,
                          max: 4.0,
                          min: 0.0,
                          value: _val1,
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
                          value: _val2,
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
                    qValue: _q1Value,
                  ),
                  QuestionCard(
                    Question: q2,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ2,
                    qValue: _q2Value,
                  ),
                  QuestionCard(
                    Question: q3,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ3,
                    qValue: _q3Value,
                  ),
                  QuestionCard(
                    Question: q4,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ4,
                    qValue: _q4Value,
                  ),
                  QuestionCard(
                    Question: q5,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ5,
                    qValue: _q5Value,
                  ),
                  QuestionCard(
                    Question: q6,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ6,
                    qValue: _q6Value,
                  ),
                  QuestionCard(
                    Question: q7,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ7,
                    qValue: _q7Value,
                  ),
                  QuestionCard(
                    Question: q8,
                    QuestionFontsize: qsize,
                    handleQ: _handleQ8,
                    qValue: _q8Value,
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
            print("${_val1.round()}");
//            btnAxn();
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
    saveBoolSP("HasFeverPOD3", _q1Value);
    saveBoolSP("HasWoundRedOrDischargePOD3", _q2Value);
    saveBoolSP("HasCalfTenderPOD3", _q3Value);
    saveBoolSP("HasSOBPOD3", _q4Value);
    saveBoolSP("HasDysuriaRetenPOD3", _q5Value);
    saveBoolSP("HasNumbnessPOD3", _q6Value);

  }
  void gotonext() {
    //TODO: send to upload wound photo page
    Navigator.of(context).pushNamed('/splash');
  }


  @override
  Widget build(BuildContext context) {
    if(_q1Value != null && _q2Value != null && _q3Value != null && _q4Value != null && _q5Value != null && _q6Value != null && _q7Value != null&& _q8Value != null ) {_onpress = true;}
    //TODO:get data from SP
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
