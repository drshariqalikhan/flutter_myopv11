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

    getSP("TOKEN").then(getJsonData).then(saveDataFromServer).then(redirect);

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
    return new WillPopScope(child: ChildWidget(), onWillPop: () async => false);
  }
}


Widget ChildWidget()
{
  return Scaffold(
      body:Stack(
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
                Text("MyOP",style: TextStyle(fontSize: 24.0),),
              ],),
          ),
//          FutureBuilder<ServerDataList>(
//              future: getDataObjectFromServer(token),
//              builder: (context,snapshot)
//          {
//            if(snapshot.hasData)
//              {
//
//               ServerDataList slist = snapshot.data;
//
//               for(ServerData s in slist.serverdata)
//                 {
//                   print(s.journey_point);
//
//                 }
//
//
//              }
//              else if (snapshot.hasError){
//              return Text("${snapshot.error}");
//
////              Navigator.of(context).pushNamed('/login');
//            }
//            return CircularProgressIndicator();
//          }
//          ),
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
      print(s.op_name);

      //TODO: save json data into SP
//      if(int.tryParse(s.UnixTimeOfLastSync) > (getIntSP("UnixTimeOfLastSync") as int))
//      {
      saveSP("journey_point", s.journey_point);//journey_point
//      }
      saveSP("op_date", s.op_date);//op_date
      saveSP("op_name", s.op_name);//op_name
      saveSP("AboutOpSurgeryLinks", s.AboutOpSurgeryLinks);//AboutOpSurgeryLinks
      saveSP("AboutAnesLinks", s.AboutAnesLinks);//AboutAnesLinks
      saveSP("AboutPhysioLinks", s.AboutPhysioLinks);//AboutPhysioLinks
      saveSP("AboutWoundCareLinks", s.AboutWoundCareLinks);//AboutWoundCareLinks
      saveBoolSP("IsAlertFromServToPt", s.IsAlertFromServToPt);//IsAlertFromServToPt
      saveSP("AlertMsgFromServToPt", s.AlertMsgFromServToPt);//AlertMsgFromServToPt

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

//bool saveDataFromDataObject(ServerData serverdata)
//{
//  print("getting response with Data Object");
//  if(serverdata !=null)
//    {
//      print (serverdata.journey_point);
//      return true;
//
//    }
//    else
//      {
//        return false;
//      }
//}
//Future<ServerDataList> getDataObjectFromServer(String token)async{
//  print("getting response with $token");
//
//  final response = await http.post(
//    Uri.encodeFull(url),
//    headers: {"AUTHORIZATION": "Token $token"},
//  );
//
//  if(response.statusCode == 200)
//  {
////    print(response.body);
//    return ServerDataList.fromJson(json.decode(response.body));
////    var res = response.body;
////    return ServerData.fromJson(json.decode(res));
//
//  }
//  else
//  {
//    //print in console
//    print("cannot get data from server : ${response.statusCode}");
//    //goto login page
//    throw Exception('Failed to load post');
//
//  }
//}


class ServerData{
  final String journey_point;
  final int UnixTimeOfLastSync;
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
    this.IsAlertFromServToPt,
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

Future <int> getIntSP(String key)async{
  print("getting $key");
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(key)?? 1;
}