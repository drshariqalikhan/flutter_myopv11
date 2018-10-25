import 'package:flutter/material.dart';
import 'package:flutter_myopv10/pages/AboutSurgeryPage.dart';
import 'package:flutter_myopv10/pages/InfoPage.dart';
import 'package:flutter_myopv10/pages/InstructionPage.dart';
import 'package:flutter_myopv10/pages/LoginPage.dart';
import 'package:flutter_myopv10/pages/MessagePage.dart';
import 'package:flutter_myopv10/pages/Myhub.dart';
import 'package:flutter_myopv10/pages/NewSplashPage.dart';
import 'package:flutter_myopv10/pages/POD10Page.dart';
import 'package:flutter_myopv10/pages/POD15Page.dart';
import 'package:flutter_myopv10/pages/POD1Page.dart';
import 'package:flutter_myopv10/pages/POD3Page.dart';
import 'package:flutter_myopv10/pages/POD5Page.dart';
import 'package:flutter_myopv10/pages/PreopGotoClinicPage.dart';
import 'package:flutter_myopv10/pages/PreopMedPhotoPage.dart';
import 'package:flutter_myopv10/pages/PreopPageFive.dart';
import 'package:flutter_myopv10/pages/PreopPageFour.dart';
import 'package:flutter_myopv10/pages/PreopPageOne.dart';
import 'package:flutter_myopv10/pages/PreopPageSeven.dart';
import 'package:flutter_myopv10/pages/PreopPageSix.dart';
import 'package:flutter_myopv10/pages/PreopPageThree.dart';
import 'package:flutter_myopv10/pages/PreopPageTwo.dart';
import 'package:flutter_myopv10/pages/PreopSummaryPage.dart';
import 'package:flutter_myopv10/pages/Reminder1Page.dart';
import 'package:flutter_myopv10/pages/Reminder2Page.dart';
import 'package:flutter_myopv10/pages/SuperSyncPage.dart';
import 'package:flutter_myopv10/pages/TaskSelectPage.dart';
import 'package:flutter_myopv10/pages/TileDash.dart';
import 'package:flutter_myopv10/pages/UnkwnOpStatusPage.dart';
import 'package:flutter_myopv10/pages/picPhotoPage.dart';
import 'package:flutter_myopv10/pages/takePhotoPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
        cardColor: Colors.white,

      ),
      home: NewSplash(),
     // home: Reminder2(),
        routes: {
          '/splash':(context)=> NewSplash(),
          '/login':(context)=> Login(),
          '/tiledash':(context)=>TileDash(),
          '/messages':(context)=>messages(),
          '/info':(context)=>info(),
          '/instructions':(context)=>instructions(),
          '/aboutsurg':(context)=>AboutSurgery(),
          '/taskSelect':(context)=>TaskSelect(),
          '/myhealth': (context)=>myhub(),
          '/preop': (context)=>preop(),//journey_point
          '/preop2': (context)=>preopTwo(),
          '/preop3': (context)=>preopThree(),
          '/preop4': (context)=>preopFour(),
          '/preop5': (context)=>preopFive(),
          '/preop6': (context)=>preopSix(),
          '/preop7': (context)=>preopSeven(),
          '/summary': (context)=>Summary(),
          '/preop_GotoClinic': (context)=>preop_GotoClinic(),//journey_point
          '/preopMedPhoto': (context)=>preopMedPhoto(),//journey_point
          '/takePhoto': (context)=>takePhoto(),
          '/picPhoto':(context)=> picPhoto(),
          '/Reminder1': (context)=>Reminder1(),//journey_point
          '/Reminder2': (context)=>Reminder2(),//journey_point
          '/UnkwnOpStatus': (context)=>UnkwnOpStatus(),//journey_point
          '/POD1': (context)=>POD1(),//journey_point
          '/POD3': (context)=>POD3(),//journey_point
          '/POD5': (context)=>POD5(),//journey_point
          '/POD10': (context)=>POD10(),//journey_point
          '/POD15': (context)=>POD15(),//journey_point
          '/SuperSync': (context)=>SuperSync(),


        },
    );
  }
}
