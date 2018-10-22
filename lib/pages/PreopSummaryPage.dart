import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_myopv10/Components/QuestionCard.dart';

double qsize = 20.0;
String summary = "";
bool _q1Value;
bool _onpress = false;
String Q1;
bool HasAdeqMouthOpening,
    HasAdeqNeckMov,
    CanClimbStairs,
    HasFeverInfec,
    HasLooseTeeth,
    HasDentalImplant,
    IsPregnant,
    HasSobAtRest,
    HasHeartAttacks,
    HasChestPain,
    HasIrregHR,
    HasHtn,
    HasDiabetes,
    HasThyroidDs,
    HasKidneyDs,
    HasLiverDs,
    HasGastricReflux;



bool Isloading = true;

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

  @override
  void initState() {
    //assign values to local bools TODO: may need to do this is a page before coming to this page
   getAndSave().whenComplete((){setState(() {Isloading = false;});});
    super.initState();
  }

/*
//1
Bool   : HasAdeqMouthOpening //TODO
Bool   : HasAdeqNeckMov //TODO
//2
Bool   : CanClimbStairs //TODO
Bool   : HasFeverInfec //TODO
Bool   : HasLooseTeeth //TODO
Bool   : HasDentalImplant //TODO
Bool   : IsPregnant //TODO
//3
Bool   : HasSobAtRest //TODO
Bool   : HasHeartAttacks //TODO
Bool   : HasChestPain //TODO
Bool   : HasIrregHR //TODO
Bool   : HasHtn //TODO
//4
Bool   : HasDiabetes //TODO
Bool   : HasThyroidDs //TODO
Bool   : HasKidneyDs //TODO
Bool   : HasLiverDs //TODO
Bool   : HasGastricReflux //TODO
//5
Bool   : HasStroke //TODO
Bool   : HasEpilepsy //TODO
Bool   : HasPsychDs //TODO
Bool   : HasBloodDs //TODO
Bool   : HasCtOrMsDs //TODO
//6
Bool   : HasAllergies //TODO
Bool   : HasOsaOrRespDs //TODO
Bool   : HasLoudSnore //TODO
Bool   : HasDaySomno //TODO
Bool   : HasSleepApneaEpisodes //TODO
//7
Bool   : IsSmoker //TODO
Bool   : IsAlcoholic //TODO
Bool   : IsOnTcm //TODO
Bool   : IsOnMeds //TODO
Bool   : HasFHOAnesRxn //TODO
Bool   : HasPrevOps //TODO
Bool   : HasPONV //TODO

 */

  Widget ChildWidget(BuildContext context, bool _press,String q1){


    List<Widget> ChosenItems = [ AutoSizeText("HasIrregHR:${HasIrregHR},HasAdeqNeckMov:${HasAdeqNeckMov}",minFontSize: 20.0,),QuestionCard(Question: q1, QuestionFontsize: qsize, handleQ: _handleQ1, qValue: _q1Value),SizedBox(height: 50.0,),
    ];
    if(!Isloading) {
      return Scaffold(
        appBar: MyAppbar(myWidget: Text(
          "click AGREE if the following is correct",
          style: TextStyle(color: Colors.white),),),
        body: ListView.builder(
          itemCount: ChosenItems.length,
          itemBuilder: (context, index) {
            return ChosenItems[index];
          },
        ),

//      body: new CustomScrollView(
//        primary: true,
//        slivers: <Widget>[
//
//          new SliverToBoxAdapter(child: Column(
//            mainAxisAlignment:MainAxisAlignment.start,
//            children: <Widget>
//            [
//              Column(
//                mainAxisAlignment:MainAxisAlignment.start,
//                children: <Widget>
//                [
//                  //TODO: show list of positive responses
////                  Expanded(
////
////                    child: ListView.builder(
////
////                    itemCount:ChosenItems.length,
////                    itemBuilder: (context,index){
////                      return ListTile(
////                        title: Text('${ChosenItems[index]}'),
////                      );
////                    },
////                  ),
////                  ),
//
//
//                  QuestionCard(
//                    Question: q1,
//                    QuestionFontsize: qsize,
//                    handleQ: _handleQ1,
//                    qValue: _q1Value,
//                  ),
//
//                  SizedBox(height: 50.0,),
//                ],//colum children
//              ),
//
//            ],
//          ),
//          ),
//        ],
//      ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () {
            if (_press) {
              //TODO:  save bools in SP
              print(_q1Value);
              if (_q1Value) {
                btnAxn();
              } else {
                Navigator.of(context).pushNamed('/splash');
              }
            }
            else {
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
    }else{return Scaffold(appBar: MyAppbar(),body: CircularProgressIndicator(),);}
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
Future <bool> getBoolSP(String key)async{
  print("getting $key");
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getBool(key)?? false;
}

Future <int> getIntSP(String key)async{
  print("getting $key");
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(key)?? 1;
}
//1
void SaveToHasAdeqMouthOpening(bool value){HasAdeqMouthOpening = value;}
void SaveToHasAdeqNeckMov(bool value){HasAdeqNeckMov = value;}
//2
void SaveToCanClimbStairs(bool value){CanClimbStairs = value;}
void SaveToHasFeverInfec(bool value){HasFeverInfec = value;}
void SaveToHasLooseTeeth(bool value){HasLooseTeeth = value;}
void SaveToHasDentalImplant(bool value){HasDentalImplant = value;}
void SaveToIsPregnant(bool value){IsPregnant = value;}
//3
void SaveToHasSobAtRest(bool value){HasSobAtRest = value;}
void SaveToHasHeartAttacks(bool value){HasHeartAttacks = value;}
void SaveToHasChestPain(bool value){HasChestPain = value;}
void SaveToHasIrregHR(bool value){HasIrregHR = value;}
void SaveToHasHtn(bool value){HasHtn = value;}
//4
void SaveToHasDiabetes(bool value){HasDiabetes = value;}
void SaveToHasThyroidDs(bool value){HasThyroidDs = value;}
void SaveToHasKidneyDs(bool value){HasKidneyDs = value;}
void SaveToHasLiverDs(bool value){HasLiverDs = value;}
void SaveToHasGastricReflux(bool value){HasGastricReflux = value;}

Future<Null> getAndSave()async{
  //1
  await getBoolSP("HasAdeqMouthOpening").then(SaveToHasAdeqMouthOpening);
  await getBoolSP("HasAdeqNeckMov").then(SaveToHasAdeqNeckMov);
  //2
  await getBoolSP("CanClimbStairs").then(SaveToCanClimbStairs);
  await getBoolSP("HasFeverInfec").then(SaveToHasFeverInfec);
  await getBoolSP("HasLooseTeeth").then(SaveToHasLooseTeeth);
  await getBoolSP("HasDentalImplant").then(SaveToHasDentalImplant);
  await getBoolSP("IsPregnant").then(SaveToIsPregnant);
  //3
  await getBoolSP("HasSobAtRest").then(SaveToHasSobAtRest);
  await getBoolSP("HasHeartAttacks").then(SaveToHasHeartAttacks);
  await getBoolSP("HasChestPain").then(SaveToHasChestPain);
  await getBoolSP("HasIrregHR").then(SaveToHasIrregHR);
  await getBoolSP("HasHtn").then(SaveToHasHtn);
  //4
  await getBoolSP("HasDiabetes").then(SaveToHasDiabetes);
  await getBoolSP("HasThyroidDs").then(SaveToHasThyroidDs);
  await getBoolSP("HasKidneyDs").then(SaveToHasKidneyDs);
  await getBoolSP("HasLiverDs").then(SaveToHasLiverDs);
  await getBoolSP("HasGastricReflux").then(SaveToHasGastricReflux);
}

