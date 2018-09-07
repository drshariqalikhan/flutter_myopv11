import 'package:flutter/material.dart';
import 'package:flutter_myopv10/pages/AboutSurgeryPage.dart';
import 'package:flutter_myopv10/pages/HomePage.dart';
import 'package:flutter_myopv10/pages/InfoPage.dart';
import 'package:flutter_myopv10/pages/InstructionPage.dart';
import 'package:flutter_myopv10/pages/LoginPage.dart';
import 'package:flutter_myopv10/pages/MessagePage.dart';
import 'package:flutter_myopv10/pages/NewSplashPage.dart';
import 'package:flutter_myopv10/pages/TilesDashPage.dart';

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
//        primarySwatch: Colors.blue,
//        fontFamily: 'Nunito',

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


        },
    );
  }
}
