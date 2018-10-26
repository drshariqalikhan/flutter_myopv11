import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/AcceptTermsCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

String instruction, journey_point;
List<String> ins;
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
    getSP("TOKEN").then(getJsonData).then(saveDataFromServer).whenComplete((){setState(() {Isloading = false;});});
    super.initState();
  }

  void createList(){
    ins = instruction.split(':');
    if(instructionListWidgets.length == 0){
      for(final x in ins){instructionListWidgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(x,style: TextStyle(fontWeight: FontWeight.bold),),
      ));}
      instructionListWidgets.add(
          AcceptTermsCard(Question: "I understand the above instructions",));}
  }
  ChildWidget(BuildContext context) {
    if(!Isloading){
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
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child: ChildWidget(context), onWillPop: () async => false);
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
      journey_point = s.journey_point;

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