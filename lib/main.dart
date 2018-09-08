import 'package:flutter/material.dart';
import 'package:flutter_myopv10/pages/AboutSurgeryPage.dart';
import 'package:flutter_myopv10/pages/HomePage.dart';
import 'package:flutter_myopv10/pages/InfoPage.dart';
import 'package:flutter_myopv10/pages/InstructionPage.dart';
import 'package:flutter_myopv10/pages/LoginPage.dart';
import 'package:flutter_myopv10/pages/MessagePage.dart';
import 'package:flutter_myopv10/pages/NewSplashPage.dart';
import 'package:flutter_myopv10/pages/POD10Page.dart';
import 'package:flutter_myopv10/pages/POD15Page.dart';
import 'package:flutter_myopv10/pages/POD1Page.dart';
import 'package:flutter_myopv10/pages/POD3Page.dart';
import 'package:flutter_myopv10/pages/POD5Page.dart';
import 'package:flutter_myopv10/pages/PreopGotoClinicPage.dart';
import 'package:flutter_myopv10/pages/PreopMedPhotoPage.dart';
import 'package:flutter_myopv10/pages/PreopPageFour.dart';
import 'package:flutter_myopv10/pages/PreopPageOne.dart';
import 'package:flutter_myopv10/pages/PreopPageThree.dart';
import 'package:flutter_myopv10/pages/PreopPageTwo.dart';
import 'package:flutter_myopv10/pages/Reminder1Page.dart';
import 'package:flutter_myopv10/pages/Reminder2Page.dart';
import 'package:flutter_myopv10/pages/SuperSyncPage.dart';
import 'package:flutter_myopv10/pages/TaskSelectPage.dart';
import 'package:flutter_myopv10/pages/TilesDashPage.dart';
import 'package:flutter_myopv10/pages/UnkwnOpStatusPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(

        brightness: Brightness.light,
        accentColor: Colors.deepOrangeAccent


      ),
        initialRoute: '/splash',
        routes: {
          '/':(context)=> MyHomePage(title: "Home screen",),
          '/splash':(context)=> NewSplash(),
          '/login':(context)=> Login(),
          '/tiledash':(context)=>TileDash(),
          '/messages':(context)=>messages(),
          '/info':(context)=>info(),
          '/instructions':(context)=>instructions(),
          '/aboutsurg':(context)=>AboutSurgery(),
          '/taskSelect':(context)=>TaskSelect(),
          '/preop': (context)=>preop(),//journey_point = preop
          '/preop2': (context)=>preopTwo(),//journey_point = preop
          '/preop3': (context)=>preopThree(),//journey_point = preop
          '/preop4': (context)=>preopFour(),//journey_point = preop
          '/preop_GotoClinic': (context)=>preop_GotoClinic(),//journey_point
          '/preopMedPhoto': (context)=>preopMedPhoto(),//journey_point
          '/Reminder1': (context)=>Reminder1(),//journey_point
          '/Reminder2': (context)=>Reminder2(),//journey_point
          '/UnkwnOpStatus': (context)=>UnkwnOpStatus(),//journey_point
          '/POD1': (context)=>POD1(),//journey_point
          '/POD3': (context)=>POD3(),//journey_point
          '/POD5': (context)=>POD5(),//journey_point
          '/POD10': (context)=>POD10(),//journey_point
          '/POD15': (context)=>POD15(),//journey_point
          '/SuperSync': (context)=>SuperSync(),//journey_point


        },
    );
  }
}
