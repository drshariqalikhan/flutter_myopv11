import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final String url = "http://myop.pythonanywhere.com/api/connect/";

class NewSplash extends StatefulWidget {
  @override
  _NewSplashState createState() => new _NewSplashState();
}

class _NewSplashState extends State<NewSplash> {




  @override
  void initState() {
    // TODO: implement initState
    print("init state called");
    getSP("TOKEN").then(getJsonData).then(SaveDataFromServer).then(redirect);
    super.initState();
  }

void redirect(bool success)
{
  if(success)
    {
      Navigator.of(context).pushNamed('/tiledash');

    }
    else
      {
        Navigator.of(context).pushNamed('/login');
      }
}

  @override
  Widget build(BuildContext context) {

//    return new WillPopScope(child: MomWidget(getJsonData(_token)), onWillPop: () async => false);
    return new WillPopScope(child: ChildWidget(), onWillPop: () async => false);
  }
}


Widget ChildWidget()
{
  return Scaffold(body:Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(color: Colors.redAccent),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100.0,
                    child: Image.asset('assets/images/spero.png')
                ),
                Padding(padding: EdgeInsets.only(top: 10.0),),
                Text("MyOP",style: TextStyle(fontSize: 24.0),)
              ],),
          ),
          Expanded(
            flex:  1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(padding: EdgeInsets.only(top: 20.0),),
                Text("Loading......",style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ],
      )
    ],

  ));
}

Future <String> getSP(String key)async{
  print("getting $key");
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(key)?? "test";
}

Future<http.Response> getJsonData(String token) async {
  print("getting response with $token");
  var response = await http.post(
    Uri.encodeFull(url),
    headers: {"AUTHORIZATION": "Token $token"},
  );

   return response;


}


Future<bool> SaveDataFromServer(http.Response response)async
{
  if(response.statusCode == 200)
  {
    ServerData serverData = await ServerData.fromJson(json.decode(response.body));
    print(serverData.journey_point);
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
  final String UnixTimeOfLastSync;
  final String op_date;
  final String op_name;
  final String AboutOpSurgeryLinks;
  final String AboutAnesLinks;
  final String AboutPhysioLinks;
  final String AboutWoundCareLinks;
  final bool IsAlertFromServToPt;
  final String AlertMsgFromServToPt;




  ServerData({
    this.journey_point,
    this.UnixTimeOfLastSync,
    this.op_date,
    this.op_name,
    this.AboutOpSurgeryLinks,
    this.AboutAnesLinks,
    this.AboutPhysioLinks,
    this.AboutWoundCareLinks,
    this.AlertMsgFromServToPt,
    this.IsAlertFromServToPt
  });
  factory ServerData.fromJson(Map<String,dynamic> json){
    return ServerData(
      journey_point:json['journey_point'],
      UnixTimeOfLastSync:json['UnixTimeOfLastSync'],
      op_date:json['op_date'],
      op_name:json['op_name'],
      AboutOpSurgeryLinks:json['AboutOpSurgeryLinks'],
      AboutAnesLinks:json['AboutAnesLinks'],
      AboutPhysioLinks:json['AboutPhysioLinks'],
      AboutWoundCareLinks:json['AboutWoundCareLinks'],
      AlertMsgFromServToPt:json['AlertMsgFromServToPt'],
      IsAlertFromServToPt:json['IsAlertFromServToPt'],


    );
  }
}
