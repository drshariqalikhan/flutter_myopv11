import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/AcceptTermsCard.dart';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


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
    HasGastricReflux,
    HasStroke,
    HasEpilepsy,
    HasPsychDs,
    HasBloodDs,
    HasCtOrMsDs,
    HasAllergies,
    HasOsaOrRespDs,
    HasLoudSnore,
    HasDaySomno,
    HasSleepApneaEpisodes,
    IsSmoker,
    IsAlcoholic,
    IsOnTcm,
    IsOnMeds,
    HasFHOAnesRxn,
    HasPrevOps,
    HasPONV;


bool Isloading = true;
final String url = "http://myop.pythonanywhere.com/api/preop/";

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => new _SummaryState();
}

class _SummaryState extends State<Summary> {


  @override
  void initState() {
   getAndSave().whenComplete((){setState(() {Isloading = false;});});
    super.initState();
  }


  Widget ChildWidget(BuildContext context){


    if(!Isloading) {

      return Scaffold(
        appBar: MyAppbar(myWidget: Text(
          "Please check your response summary",
          style: TextStyle(color: Colors.white),),),
          body: ListView(
            children: <Widget>[
              MakeSummary(),
              AcceptTermsCard(
                Question: "I agree with the summary of my responses above",
                Decline_text: "Make Changes",
                Decline_func: (){ Navigator.of(context).pushNamed('/splash');},
                Accept_func: ()async {getSP("TOKEN").then(sendData).then(SaveDataFromServer);},
              )
            ],
          ),




      );
    }else{return Scaffold(appBar: MyAppbar(),body: CircularProgressIndicator(),);}
  }

  Future<http.Response> sendData(String token)async{
    print("getting response with $token");
    var response = await http.put(
      Uri.encodeFull(url),
      headers: {"AUTHORIZATION": "Token $token"},
      body: {
        "HasAdeqMouthOpening": HasAdeqMouthOpening.toString(),
        "HasAdeqNeckMov":HasAdeqNeckMov.toString(),
        "CanClimbStairs":CanClimbStairs.toString(),
        "HasFeverInfec":HasFeverInfec.toString(),
        "HasLooseTeeth":HasLooseTeeth.toString(),
        "HasDentalImplant":HasDentalImplant.toString(),
        "IsPregnant":IsPregnant.toString(),
        "HasSobAtRest":HasSobAtRest.toString(),
        "HasHeartAttacks":HasHeartAttacks.toString(),
        "HasChestPain":HasChestPain.toString(),
        "HasIrregHR":HasIrregHR.toString(),
        "HasHtn":HasHtn.toString(),
        "HasDiabetes":HasDiabetes.toString(),
        "HasThyroidDs":HasThyroidDs.toString(),
        "HasKidneyDs":HasKidneyDs.toString(),
        "HasLiverDs":HasLiverDs.toString(),
        "HasGastricReflux":HasGastricReflux.toString(),
        "HasStroke":HasStroke.toString(),
        "HasEpilepsy":HasEpilepsy.toString(),
        "HasPsychDs":HasPsychDs.toString(),
        "HasBloodDs":HasBloodDs.toString(),
        "HasCtOrMsDs":HasCtOrMsDs.toString(),
        "HasAllergies":HasAllergies.toString(),
        "HasOsaOrRespDs":HasOsaOrRespDs.toString(),
        "HasLoudSnore":HasLoudSnore.toString(),
        "HasDaySomno":HasDaySomno.toString(),
        "HasSleepApneaEpisodes":HasSleepApneaEpisodes.toString(),
        "IsSmoker":IsSmoker.toString(),
        "IsAlcoholic":IsAlcoholic.toString(),
        "IsOnTcm":IsOnTcm.toString(),
        "IsOnMeds":IsOnMeds.toString(),
        "HasFHOAnesRxn":HasFHOAnesRxn.toString(),
        "HasPrevOps":HasPrevOps.toString(),
        "HasPONV":HasPONV.toString()
      },

    );

    return response;
  }
  Future<Null> SaveDataFromServer(http.Response response){
    print("processing response");
    if(response.statusCode == 200){
      //TODO save journey point & canUpdate to True
      String journey_point = response.body.toString().substring(1,response.body.toString().lastIndexOf('"'));



      Fluttertoast.showToast(
          msg: "$journey_point",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 5,
          bgcolor: "#e74c3c",
          textcolor: '#ffffff'
      );
      dialog(context);
      updateJourneyPointInServer(journey_point).then(gotoNextPage);

    }else{
      //TODO show error message and ask user to try again/troubleshoot
      Fluttertoast.showToast(
          msg: "cannot send:"+response.statusCode.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 5,
          bgcolor: "#e74c3c",
          textcolor: '#ffffff'
      );
    }
  }
  void dialog(BuildContext context)
  {
      new Future.delayed(Duration.zero, () {
        showDialog(context: context, builder: (context) =>
        new AlertDialog(title: Text(
          "Connecting to server!", style: TextStyle(color: Colors.orange),
          textAlign: TextAlign.center,),
          content: new Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  'PLEASE WAIT....',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              CircularProgressIndicator(),

            ],
          ),
          actions: <Widget>[

          ],
        ));
      });


  }
  Future<int> updateJourneyPointInServer(String jp)async{
    String url = "http://myop.pythonanywhere.com/api/connect/";
    var body = {
      "journey_point":"$jp"
    };
    var response = await http.put(Uri.encodeFull(url),
      headers: {"AUTHORIZATION": "Token ${await getSP("TOKEN")}"},
      body: body,);

    return response.statusCode;

  }

  void gotoNextPage(int responseCode){
    if(responseCode == 200){
      Navigator.of(context).pushNamed('/splash');
    }
    else
      {
        Fluttertoast.showToast(
            msg: "cannot go:"+responseCode.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 5,
            bgcolor: "#e74c3c",
            textcolor: '#ffffff'
        );
      }

  }

  @override
  Widget build(BuildContext context) {
    //TODO:get data from SP
    return new WillPopScope(child: ChildWidget(context), onWillPop: () async => false);
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
//5
void SaveToHasStroke(bool value){HasStroke = value;}
void SaveToHasEpilepsy(bool value){HasEpilepsy = value;}
void SaveToHasPsychDs(bool value){HasPsychDs = value;}
void SaveToHasBloodDs(bool value){HasBloodDs = value;}
void SaveToHasCtOrMsDs(bool value){HasCtOrMsDs = value;}
//6
void SaveToHasAllergies(bool value){HasAllergies = value;}
void SaveToHasOsaOrRespDs(bool value){HasOsaOrRespDs = value;}
void SaveToHasLoudSnore(bool value){HasLoudSnore = value;}
void SaveToHasDaySomno(bool value){HasDaySomno = value;}
void SaveToHasSleepApneaEpisodes(bool value){HasSleepApneaEpisodes = value;}
//7
void SaveToIsSmoker(bool value){IsSmoker = value;}
void SaveToIsAlcoholic(bool value){IsAlcoholic = value;}
void SaveToIsOnTcm(bool value){IsOnTcm = value;}
void SaveToIsOnMeds(bool value){IsOnMeds = value;}
void SaveToHasFHOAnesRxn(bool value){HasFHOAnesRxn = value;}
void SaveToHasPrevOps(bool value){HasPrevOps = value;}
void SaveToHasPONV(bool value){HasPONV = value;}

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
  //5
  await getBoolSP("HasStroke").then(SaveToHasStroke);
  await getBoolSP("HasEpilepsy").then(SaveToHasEpilepsy);
  await getBoolSP("HasPsychDs").then(SaveToHasPsychDs);
  await getBoolSP("HasBloodDs").then(SaveToHasBloodDs);
  await getBoolSP("HasCtOrMsDs").then(SaveToHasCtOrMsDs);
  //6
  await getBoolSP("HasAllergies").then(SaveToHasAllergies);
  await getBoolSP("HasOsaOrRespDs").then(SaveToHasOsaOrRespDs);
  await getBoolSP("HasLoudSnore").then(SaveToHasLoudSnore);
  await getBoolSP("HasDaySomno").then(SaveToHasDaySomno);
  await getBoolSP("HasSleepApneaEpisodes").then(SaveToHasSleepApneaEpisodes);
  //7
  await getBoolSP("IsSmoker").then(SaveToIsSmoker);
  await getBoolSP("IsAlcoholic").then(SaveToIsAlcoholic);
  await getBoolSP("IsOnTcm").then(SaveToIsOnTcm);
  await getBoolSP("IsOnMeds").then(SaveToIsOnMeds);
  await getBoolSP("HasFHOAnesRxn").then(SaveToHasFHOAnesRxn);
  await getBoolSP("HasPrevOps").then(SaveToHasPrevOps);
  await getBoolSP("HasPONV").then(SaveToHasPONV);

}

Widget MakeSummary(){
  StringBuffer summary = new StringBuffer();
  if(HasAdeqMouthOpening){summary.write("\n I CAN open my mouth atleast 2 fingers wide.");}
  if(!HasAdeqMouthOpening){summary.write("\n I CANNOT open my mouth atleast 2 fingers wide.");}

  if(HasAdeqNeckMov){summary.write("\n I can easily move my neck up-down.");}
  if(!HasAdeqNeckMov){summary.write("\n I CANNOT easily move my neck up-down.");}

  if(CanClimbStairs){summary.write("\n I can easily climb 2 stories of stairs.");}
  if(!CanClimbStairs){summary.write("\n I CANNOT easily climb 2 stories of stairs.");}

  if(HasFeverInfec){summary.write("\n I HAVE a cold,fever or infections");}
  if(!HasFeverInfec){summary.write("\n I do not have any cold,fever or infections");}

  if(!HasLooseTeeth){summary.write("\n I do not have any have loose teeth");}
  if(HasLooseTeeth){summary.write("\n I HAVE loose teeth");}

  if(HasDentalImplant){summary.write("\n I have dental implants");}

  if(IsPregnant){summary.write("\n I AM pregnant");}
  if(!IsPregnant){summary.write("\n I am not pregnant");}

  if(HasSobAtRest){summary.write("\n I feel breathless on lying flat or resting");}
  if(HasHeartAttacks){summary.write("\n I have heart disease or heart attacks");}
  if(HasChestPain){summary.write("\n I get chest pains");}
  if(HasIrregHR){summary.write("\n I get irregular heart beats");}
  if(HasHtn){summary.write("\n I have high blood pressure");}
  if(HasDiabetes){summary.write("\n I have Diabetes");}
  if(HasThyroidDs){summary.write("\n I have thyroid problems");}
  if(HasKidneyDs){summary.write("\n I have kidney problems or dialysis");}
  if(HasLiverDs){summary.write("\n I have liver problems or jaundice");}
  if(HasGastricReflux){summary.write("\n I get stomach acid in my mouth when I lie flat");}
  if(HasStroke){summary.write("\n I have previously had a stroke , mini stroke or paralysis");}
  if(HasEpilepsy){summary.write("\n I have epilepsy or fits");}
  if(HasPsychDs){summary.write("\n I have a psychiatric illness");}
  if(HasBloodDs){summary.write("\n I have a blood disease or anaemia");}
  if(HasCtOrMsDs){summary.write("\n I have bone or muscle disease");}
  if(HasAllergies){summary.write("\n I have Allergies");}
  if(HasOsaOrRespDs){summary.write("\n I have lung problems or sleep apnea");}
  if(HasLoudSnore){summary.write("\n I snore loudly");}
  if(HasDaySomno){summary.write("\n I feel tired/sleepy in daytime");}
  if(HasSleepApneaEpisodes){summary.write("\n I sometimes stop breathing in sleep");}
  if(IsSmoker){summary.write("\n I am a Smoker");}
  if(IsAlcoholic){summary.write("\n I regularly consume alcohol");}
  if(IsOnTcm){summary.write("\n I am taking herbal medications");}
  if(IsOnMeds){summary.write("\n I take medications at home");}
  if(HasFHOAnesRxn){summary.write("\n I have a family history of reactions to Anaesthesia");}
  if(HasPONV){summary.write("\n I get nausea or vomiting after operations");}



  return Card(child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(summary.toString(),style: TextStyle(fontWeight: FontWeight.bold,),),
  ));
}

