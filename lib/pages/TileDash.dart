import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/MyTile.dart';

import 'package:unicorndial/unicorndial.dart';
import 'package:shared_preferences/shared_preferences.dart';


int DAYS = 00;
String JOURNEY_POINT="J_P";
Color message_AlertColor =Colors.black;
Color task_AlertColor =Colors.black;
Color About_AlertColor =Colors.black;
Color Instructions_AlertColor =Colors.black;

bool _ShowDialog = false;
String JpIcon, journeyPoint;
bool isloading = true;

class TileDash extends StatefulWidget {
  @override
  _TileDashState createState() => new _TileDashState();
}

class _TileDashState extends State<TileDash> {
  @override
  void initState() {
    JpIcon = "1";
    _ShowDialog = true;
    dialog(context,_ShowDialog);
    getAndSave().whenComplete((){setState(() {isloading = false;});});
    //show alert dialog if bool is true
    super.initState();
  }

 Widget childWid()
 {

   var childButtons = List<UnicornButton>();

   childButtons.add(UnicornButton(
       hasLabel: true,
       labelText: "My Instructions",
       currentButton: FloatingActionButton(
         heroTag: "instructions",
         backgroundColor: Colors.orangeAccent,
         mini: true,
         child: Icon(Icons.directions),
         onPressed: ()=>Navigator.pushNamed(context, '/instructions'),
       )));


   childButtons.add(UnicornButton(
       hasLabel: true,
       labelText: "About my surgery",
       currentButton: FloatingActionButton(
         heroTag: "info",
         backgroundColor: Colors.amberAccent,
         mini: true,
         child: Icon(Icons.info),
         onPressed: ()=>Navigator.pushNamed(context, '/info'),
       )));

   childButtons.add(UnicornButton(
     hasLabel: true,
       labelText: "Complete task",
       currentButton: FloatingActionButton(
         onPressed: ()=> dialog(context,_ShowDialog),
           heroTag: "task",
           backgroundColor: Colors.greenAccent,
           mini: true,
           child: Icon(Icons.gavel))));

   childButtons.add(UnicornButton(
     hasLabel: true,
       labelText: "Talk to my medical team",
       currentButton: FloatingActionButton(
         onPressed: ()=>Navigator.pushNamed(context, '/messages'),
           heroTag: "message",
           backgroundColor: Colors.blueAccent,
           mini: true,
           child: Icon(Icons.message))));

   childButtons.add(UnicornButton(
       hasLabel: true,
       labelText: "My Appointments",
       currentButton: FloatingActionButton(
           onPressed: ()=>Navigator.pushNamed(context, '/myhealth'),
           heroTag: "myhealth",
           backgroundColor: Colors.indigoAccent,
           mini: true,
           child: Icon(Icons.stars))));



   if(!isloading){return Scaffold(
     backgroundColor: Colors.transparent,
     floatingActionButton: UnicornDialer(
           orientation: UnicornOrientation.VERTICAL,
           parentButton: Icon(Icons.menu),
           childButtons: childButtons),
       appBar: AppBar(
           title: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text("Your journey to recovery:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
           ),
           backgroundColor: Colors.black,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Surgery in :\n $DAYS DAYS",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),),
          ),
       ),


   body: Card(
     shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),side: BorderSide(width: 1.0)),
     margin: EdgeInsets.all(8.0),
     elevation: 10.0,
     child:ListView(
       children: JourneyTimeline(journeyPoint),

     ),
   )
   );}else{
     return Scaffold(
       body:CircularProgressIndicator(),

     );
   }
 }



 List<Widget> JourneyTimeline(String Ongoing_Jp)
 {
   var mylist = List<Widget>();
   switch (Ongoing_Jp)
   {
    // case "Preoperative Assessment":{
     case "preop":{
       mylist.add(MyTile(StageName:"Preoperative Assessment",StageStatus: "ONGOING",UpNext: "First Reminder",));
       mylist.add(MyTile(StageName:"First Reminder",StageStatus: "PENDING",UpNext: "Second Reminder",));
       mylist.add(MyTile(StageName:"Second Reminder",StageStatus: "PENDING",UpNext: "Operation day",));
       mylist.add(MyTile(StageName:"Operation day",StageStatus: "PENDING",UpNext: "First day Postoperative review",));
       mylist.add(MyTile(StageName:"First day Postoperative review",StageStatus: "PENDING",UpNext: "Third day Postoperative review",));
       mylist.add(MyTile(StageName:"Third day Postoperative review",StageStatus: "PENDING",UpNext: "Fifth day Postoperative review",));
       mylist.add(MyTile(StageName:"Fifth day Postoperative review",StageStatus: "PENDING",UpNext: "Tenth day Postoperative review",));
       mylist.add(MyTile(StageName:"Tenth day Postoperative review",StageStatus: "PENDING",UpNext: "Fifteenth day Postoperative review",));
       mylist.add(MyTile(StageName:"Fifteenth day Postoperative review",StageStatus: "PENDING",UpNext: "",));
       mylist.add(SizedBox(height: 50.0,));

     }
     return mylist;
     break;

     case "preop_GotoClinic":{
       mylist.add(MyTile(StageName:"Preoperative Assessment",StageStatus: "ONGOING",UpNext: "First Reminder",));
       mylist.add(MyTile(StageName:"First Reminder",StageStatus: "PENDING",UpNext: "Second Reminder",));
       mylist.add(MyTile(StageName:"Second Reminder",StageStatus: "PENDING",UpNext: "Operation day",));
       mylist.add(MyTile(StageName:"Operation day",StageStatus: "PENDING",UpNext: "First day Postoperative review",));
       mylist.add(MyTile(StageName:"First day Postoperative review",StageStatus: "PENDING",UpNext: "Third day Postoperative review",));
       mylist.add(MyTile(StageName:"Third day Postoperative review",StageStatus: "PENDING",UpNext: "Fifth day Postoperative review",));
       mylist.add(MyTile(StageName:"Fifth day Postoperative review",StageStatus: "PENDING",UpNext: "Tenth day Postoperative review",));
       mylist.add(MyTile(StageName:"Tenth day Postoperative review",StageStatus: "PENDING",UpNext: "Fifteenth day Postoperative review",));
       mylist.add(MyTile(StageName:"Fifteenth day Postoperative review",StageStatus: "PENDING",UpNext: "",));
       mylist.add(SizedBox(height: 50.0,));

     }
     return mylist;
     break;

     case "preopMedPhoto":{
       mylist.add(MyTile(StageName:"Preoperative Assessment",StageStatus: "ONGOING",UpNext: "First Reminder",));
       mylist.add(MyTile(StageName:"First Reminder",StageStatus: "PENDING",UpNext: "Second Reminder",));
       mylist.add(MyTile(StageName:"Second Reminder",StageStatus: "PENDING",UpNext: "Operation day",));
       mylist.add(MyTile(StageName:"Operation day",StageStatus: "PENDING",UpNext: "First day Postoperative review",));
       mylist.add(MyTile(StageName:"First day Postoperative review",StageStatus: "PENDING",UpNext: "Third day Postoperative review",));
       mylist.add(MyTile(StageName:"Third day Postoperative review",StageStatus: "PENDING",UpNext: "Fifth day Postoperative review",));
       mylist.add(MyTile(StageName:"Fifth day Postoperative review",StageStatus: "PENDING",UpNext: "Tenth day Postoperative review",));
       mylist.add(MyTile(StageName:"Tenth day Postoperative review",StageStatus: "PENDING",UpNext: "Fifteenth day Postoperative review",));
       mylist.add(MyTile(StageName:"Fifteenth day Postoperative review",StageStatus: "PENDING",UpNext: "",));
       mylist.add(SizedBox(height: 50.0,));

     }
     return mylist;
     break;


    // case "First Reminder":{
     case "Reminder1":{
       mylist.add(MyTile(StageName:"Preoperative Assessment",StageStatus: "DONE",UpNext: "First Reminder",));
       mylist.add(MyTile(StageName:"First Reminder",StageStatus: "ONGOING",UpNext: "Second Reminder",));
       mylist.add(MyTile(StageName:"Second Reminder",StageStatus: "PENDING",UpNext: "Operation day",));
       mylist.add(MyTile(StageName:"Operation day",StageStatus: "PENDING",UpNext: "First day Postoperative review",));
       mylist.add(MyTile(StageName:"First day Postoperative review",StageStatus: "PENDING",UpNext: "Third day Postoperative review",));
       mylist.add(MyTile(StageName:"Third day Postoperative review",StageStatus: "PENDING",UpNext: "Fifth day Postoperative review",));
       mylist.add(MyTile(StageName:"Fifth day Postoperative review",StageStatus: "PENDING",UpNext: "Tenth day Postoperative review",));
       mylist.add(MyTile(StageName:"Tenth day Postoperative review",StageStatus: "PENDING",UpNext: "Fifteenth day Postoperative review",));
       mylist.add(MyTile(StageName:"Fifteenth day Postoperative review",StageStatus: "PENDING",UpNext: "",));
       mylist.add(SizedBox(height: 50.0,));

     }
     return mylist;
     break;

     //case "Second Reminder":{
     case "Reminder2":{
       mylist.add(MyTile(StageName:"Preoperative Assessment",StageStatus: "DONE",UpNext: "First Reminder",));mylist.add(MyTile(StageName:"First Reminder",StageStatus: "DONE",UpNext: "Second Reminder",));
     mylist.add(MyTile(StageName:"Second Reminder",StageStatus: "ONGOING",UpNext: "Operation day",));
     mylist.add(MyTile(StageName:"Operation day",StageStatus: "PENDING",UpNext: "First day Postoperative review",));
     mylist.add(MyTile(StageName:"First day Postoperative review",StageStatus: "PENDING",UpNext: "Third day Postoperative review",));
     mylist.add(MyTile(StageName:"Third day Postoperative review",StageStatus: "PENDING",UpNext: "Fifth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifth day Postoperative review",StageStatus: "PENDING",UpNext: "Tenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Tenth day Postoperative review",StageStatus: "PENDING",UpNext: "Fifteenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifteenth day Postoperative review",StageStatus: "PENDING",UpNext: "",));
     mylist.add(SizedBox(height: 50.0,));

     }
     return mylist;
     break;


     //case "Operation day":
     case "UnkwnOpStatus":
       {   mylist.add(MyTile(StageName:"Preoperative Assessment",StageStatus: "DONE",UpNext: "First Reminder",));
     mylist.add(MyTile(StageName:"First Reminder",StageStatus: "DONE",UpNext: "Second Reminder",));
     mylist.add(MyTile(StageName:"Second Reminder",StageStatus: "DONE",UpNext: "Operation day",));
     mylist.add(MyTile(StageName:"Operation day",StageStatus: "ONGOING",UpNext: "First day Postoperative review",));
     mylist.add(MyTile(StageName:"First day Postoperative review",StageStatus: "PENDING",UpNext: "Third day Postoperative review",));
     mylist.add(MyTile(StageName:"Third day Postoperative review",StageStatus: "PENDING",UpNext: "Fifth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifth day Postoperative review",StageStatus: "PENDING",UpNext: "Tenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Tenth day Postoperative review",StageStatus: "PENDING",UpNext: "Fifteenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifteenth day Postoperative review",StageStatus: "PENDING",UpNext: "",));
     mylist.add(SizedBox(height: 50.0,));

     }
     return mylist;
     break;


     //case "First day Postoperative review":
     case "POD1":
       {   mylist.add(MyTile(StageName:"Preoperative Assessment",StageStatus: "DONE",UpNext: "First Reminder",));
     mylist.add(MyTile(StageName:"First Reminder",StageStatus: "DONE",UpNext: "Second Reminder",));
     mylist.add(MyTile(StageName:"Second Reminder",StageStatus: "DONE",UpNext: "Operation day",));
     mylist.add(MyTile(StageName:"Operation day",StageStatus: "DONE",UpNext: "First day Postoperative review",));
     mylist.add(MyTile(StageName:"First day Postoperative review",StageStatus: "ONGOING",UpNext: "Third day Postoperative review",));
     mylist.add(MyTile(StageName:"Third day Postoperative review",StageStatus: "PENDING",UpNext: "Fifth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifth day Postoperative review",StageStatus: "PENDING",UpNext: "Tenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Tenth day Postoperative review",StageStatus: "PENDING",UpNext: "Fifteenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifteenth day Postoperative review",StageStatus: "PENDING",UpNext: "",));
     mylist.add(SizedBox(height: 50.0,));

     }
     return mylist;
     break;


     //case "Third day Postoperative review":
     case "POD3":
       {   mylist.add(MyTile(StageName:"Preoperative Assessment",StageStatus: "DONE",UpNext: "First Reminder",));
     mylist.add(MyTile(StageName:"First Reminder",StageStatus: "DONE",UpNext: "Second Reminder",));
     mylist.add(MyTile(StageName:"Second Reminder",StageStatus: "DONE",UpNext: "Operation day",));
     mylist.add(MyTile(StageName:"Operation day",StageStatus: "DONE",UpNext: "First day Postoperative review",));
     mylist.add(MyTile(StageName:"First day Postoperative review",StageStatus: "DONE",UpNext: "Third day Postoperative review",));
     mylist.add(MyTile(StageName:"Third day Postoperative review",StageStatus: "ONGOING",UpNext: "Fifth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifth day Postoperative review",StageStatus: "PENDING",UpNext: "Tenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Tenth day Postoperative review",StageStatus: "PENDING",UpNext: "Fifteenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifteenth day Postoperative review",StageStatus: "PENDING",UpNext: "",));
     mylist.add(SizedBox(height: 50.0,));

     }
     return mylist;
     break;


     //case "Fifth day Postoperative review":
     case "POD5":
       {   mylist.add(MyTile(StageName:"Preoperative Assessment",StageStatus: "DONE",UpNext: "First Reminder",));
     mylist.add(MyTile(StageName:"First Reminder",StageStatus: "DONE",UpNext: "Second Reminder",));
     mylist.add(MyTile(StageName:"Second Reminder",StageStatus: "DONE",UpNext: "Operation day",));
     mylist.add(MyTile(StageName:"Operation day",StageStatus: "DONE",UpNext: "First day Postoperative review",));
     mylist.add(MyTile(StageName:"First day Postoperative review",StageStatus: "DONE",UpNext: "Third day Postoperative review",));
     mylist.add(MyTile(StageName:"Third day Postoperative review",StageStatus: "DONE",UpNext: "Fifth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifth day Postoperative review",StageStatus: "ONGOING",UpNext: "Tenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Tenth day Postoperative review",StageStatus: "PENDING",UpNext: "Fifteenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifteenth day Postoperative review",StageStatus: "PENDING",UpNext: "",));
     mylist.add(SizedBox(height: 50.0,));

     }
     return mylist;
     break;


     //case "Tenth day Postoperative review":
     case "POD10":
       {   mylist.add(MyTile(StageName:"Preoperative Assessment",StageStatus: "DONE",UpNext: "First Reminder",));
     mylist.add(MyTile(StageName:"First Reminder",StageStatus: "DONE",UpNext: "Second Reminder",));
     mylist.add(MyTile(StageName:"Second Reminder",StageStatus: "DONE",UpNext: "Operation day",));
     mylist.add(MyTile(StageName:"Operation day",StageStatus: "DONE",UpNext: "First day Postoperative review",));
     mylist.add(MyTile(StageName:"First day Postoperative review",StageStatus: "DONE",UpNext: "Third day Postoperative review",));
     mylist.add(MyTile(StageName:"Third day Postoperative review",StageStatus: "DONE",UpNext: "Fifth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifth day Postoperative review",StageStatus: "DONE",UpNext: "Tenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Tenth day Postoperative review",StageStatus: "ONGOING",UpNext: "Fifteenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifteenth day Postoperative review",StageStatus: "PENDING",UpNext: "",));
     mylist.add(SizedBox(height: 50.0,));

     }
     return mylist;
     break;


     //case "Fifteenth day Postoperative review":
     case "POD15":
       {   mylist.add(MyTile(StageName:"Preoperative Assessment",StageStatus: "DONE",UpNext: "First Reminder ",));
     mylist.add(MyTile(StageName:"First Reminder",StageStatus: "DONE",UpNext: "Second Reminder",));
     mylist.add(MyTile(StageName:"Second Reminder",StageStatus: "DONE",UpNext: "Operation day",));
     mylist.add(MyTile(StageName:"Operation day",StageStatus: "DONE",UpNext: "First day Postoperative review",));
     mylist.add(MyTile(StageName:"First day Postoperative review",StageStatus: "DONE",UpNext: "Third day Postoperative review",));
     mylist.add(MyTile(StageName:"Third day Postoperative review",StageStatus: "DONE",UpNext: "Fifth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifth day Postoperative review",StageStatus: "DONE",UpNext: "Tenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Tenth day Postoperative review",StageStatus: "DONE",UpNext: "Fifteenth day Postoperative review",));
     mylist.add(MyTile(StageName:"Fifteenth day Postoperative review",StageStatus: "ONGOING",UpNext: "JourneyComplete",));
     mylist.add(SizedBox(height: 50.0,));

     }
     return mylist;
     break;

   }



 }


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child: childWid(), onWillPop: () async => false);
  }
}


void dialog(BuildContext context, bool IsAlert)
{
  if(IsAlert) {
    new Future.delayed(Duration.zero, () {
      showDialog(context: context, builder: (context) =>
      new AlertDialog(title: Text(
        "ALERT!", style: TextStyle(color: Colors.orange),
        textAlign: TextAlign.center,),
        content: new Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                'PLEASE CLICK BELOW TO COMPLETE INCOMPLETE TASKS',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 30.0),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(onPressed: () {
            Navigator.pop(context);
          }, child: new Text('Later')),
          new FlatButton(onPressed: () {
            Navigator.pushNamed(context, '/taskSelect');
          }, child: new Text('Complete Task')),
        ],
      ));
    });
  }

}

Future <String> getSP(String key)async{
  print("getting $key");
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(key)?? "100";
}

Future<Null> getAndSave()async{
  journeyPoint = await getSP("journey_point");
}