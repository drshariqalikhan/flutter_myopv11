import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/AcceptTermsCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

String instruction, journey_point;
var ins;
var instructionListWidgets =  List<Widget>();
bool Isloading = true;
final String url = "http://myop.pythonanywhere.com/api/preopInstruction/";

class instructions extends StatefulWidget {
  @override
  _instructionsState createState() => new _instructionsState();
}

class _instructionsState extends State<instructions> {

  @override
  void initState() {
    instructionListWidgets.clear();
    ins="";
    getSP("journey_point").then((String journey_poin){journey_point = journey_poin; print(journey_point);}).whenComplete((){ getSP("TOKEN").then(getJsonData).then(saveDataFromServer).whenComplete((){setState(() { Isloading = false;});});});
    //getSP("TOKEN").then(getJsonData).then(saveDataFromServer).whenComplete((){setState(() { Isloading = false;});});
    super.initState();
  }

  void createList(){
    print("INS:$ins");
    ins = instruction.split(':');
    if(instructionListWidgets.length == 0){
      for(final x in ins){instructionListWidgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(x,style: TextStyle(fontWeight: FontWeight.bold),),
      ));}}
      if(journey_point == "preopinstruction" && !instruction.startsWith('*')){
      instructionListWidgets.add(
          AcceptTermsCard(Question: "I understand the above instructions",
            Accept_func: (){updateJourneyPointInServer(journey_point).then(gotoNextPage);},));}
    }

   getBody(String journeyPoint){
    switch(journeyPoint){
    //preop
      case "preop":{
        return Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Complete preop assesment!",style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ));

      }
      break;
    //preop_GotoClinic
      case "preop_GotoClinic":{
        return Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Please go to Preop Clinic!",style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ));
      }
      break;
    //preopMedPhoto
      case "preopMedPhoto":{
        return Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Please upload Photo of your medications!",style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ));
      }
      break;
    //preopinstruction
      case "preopinstruction":{
        createList();
        return ListView(children: instructionListWidgets,);
      }
      break;
    //Reminder1
      case "Reminder1":{
        if(instructionListWidgets.isEmpty){createList();};
        return ListView(children: instructionListWidgets,);
      }
      break;
    //Reminder2
      case "Reminder2":{
        if(instructionListWidgets.isEmpty){createList();};
        return ListView(children: instructionListWidgets,);
      }
      break;
    //UnkwnOpStatus
      case "UnkwnOpStatus":{}
      break;
    //POD1
      case "POD1":{}
      break;
    //POD3
      case "POD3":{}
      break;
    //POD5
      case "POD5":{}
      break;
    //POD10
      case "POD10":{}
      break;
    //POD15
      case "POD15":{}
      break;

    //null
      default: {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Loading ...make sure you are connected!",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            CircularProgressIndicator(),
          ],
        );
      }
      break;

    }
  }
  Widget childWidget(BuildContext context){
    return Scaffold(
        appBar:AppBar(
          leading: Hero(tag: "ic", child:Image.asset('assets/images/speroicon.png') ),
          backgroundColor: Colors.black,
          title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Text("My Instructions",style: TextStyle(fontWeight: FontWeight.bold),),
          Hero(tag: "instructions", child:Icon(Icons.directions) )
          ],),
        ) ,
        floatingActionButton:
        new FloatingActionButton(
            child: Icon(Icons.home),
            onPressed: ()=>Navigator.pushNamed(context, '/splash')

        ),

   body: getBody(journey_point) ,
    );

  }
  ChildWidget(BuildContext context) {
    if(!Isloading){
      print(journey_point);
      createList();


      return Scaffold(
        appBar: AppBar(
          leading: Hero(tag: "ic", child:Image.asset('assets/images/speroicon.png') ),
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("My Instructions",style: TextStyle(fontWeight: FontWeight.bold),),
              Hero(tag: "instructions", child:Icon(Icons.directions) )
            ],
          ),


        ),body:ListView(
        children: instructionListWidgets,


      ),
//          persistentFooterButtons: <Widget>[
//        AcceptTermsCard(
//                Question: "I understand the above instructions",
//                Decline_text: "I disagree",
//                Decline_func: (){ },
//                Accept_func: ()async {
//                  //getSP("TOKEN").then(sendData).then(SaveDataFromServer);
//                  },
//              )
//      ],

//
//        body: Center(
//          child: ListView(
//            children: <Widget>[
//
//              AcceptTermsCard(
//                Question: "I understand the above instructions",
//                Decline_text: "I disagree",
//                Decline_func: (){ },
//                Accept_func: ()async {
//                  //getSP("TOKEN").then(sendData).then(SaveDataFromServer);
//                  },
//              )
//
//            ]
//          ),
//        ),
       floatingActionButton:
          new FloatingActionButton(
            child: Icon(Icons.home),
              onPressed: ()=>Navigator.pushNamed(context, '/splash')

        )

      );
    }else{
      return Scaffold(
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
          ],
        )),
      );
    }
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
    return new WillPopScope(child: childWidget(context), onWillPop: () async => false);
  }
}

Future <String> getSP(String key)async{
  print("getting $key");
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(key)?? "100";
}

Future<http.Response> getJsonData(String token) async {
  print("getting response with $token");
  var response = await http.post(
    Uri.encodeFull(url),
    headers: {"AUTHORIZATION": "Token $token"},
  );
  return response;


}

Future<bool> saveDataFromServer(http.Response response)async
{
  if(response.statusCode == 200)
  {
    ServerDataList slist = ServerDataList.fromJson(json.decode(response.body));
    for(ServerData s in slist.serverdata)
    {
      instruction = s.PreopInstructions;
      //journey_point = s.journey_point;

    }
    return true;
  }
  else
  {
    //print in console
    print("cannot get data from server : ${response.statusCode}");
    //goto login page
    return false;

  }
}

Future<int> updateJourneyPointInServer(String jp)async{
  String url = "http://myop.pythonanywhere.com/api/connect/";
  var body = {
    //"journey_point":"$jp",
    "journey_point":"Reminder1",
    "PreopInstructions":"$instruction"
  };
  var response = await http.put(Uri.encodeFull(url),
    headers: {"AUTHORIZATION": "Token ${await getSP("TOKEN")}"},
    body: body,);

  return response.statusCode;

}

class ServerData{
  final String journey_point;
  final String PreopInstructions;




  ServerData({
    this.journey_point,
    this.PreopInstructions,
  });
  factory ServerData.fromJson(Map<String,dynamic> json){
    return ServerData(
      journey_point:json['journey_point'],
      PreopInstructions:json['PreopInstructions'],

    );
  }
}

class ServerDataList{
  final List<ServerData> serverdata;

  ServerDataList({
    this.serverdata,
  });

  factory ServerDataList.fromJson(List<dynamic> parsedJson)
  {
    List<ServerData> serverdata = new List<ServerData>();
    serverdata = parsedJson.map((i)=>ServerData.fromJson(i)).toList();
    return new ServerDataList(
      serverdata: serverdata,
    );
  }
}