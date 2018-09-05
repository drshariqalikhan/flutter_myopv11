import 'package:flutter/material.dart';
import 'package:flutter_myopv10/pages/HomePage.dart';
import 'package:flutter_myopv10/pages/LoginPage.dart';
import 'package:flutter_myopv10/pages/NewSplashPage.dart';
import 'package:flutter_myopv10/pages/SplashPage.dart';
import 'package:flutter_myopv10/pages/TilesDashPage.dart';
import 'package:flutter_myopv10/pages/secondPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.grey
//        primarySwatch: Colors.blue,
//        fontFamily: 'Nunito',

      ),
        initialRoute: '/splash2',
        routes: {
        '/':(context)=> MyHomePage(title: "Home screen",),
        '/second':(context)=>  SecondScreen(title: "Second Screen",),
        '/splash':(context)=> Splash(),
          '/splash2':(context)=> NewSplash(),
        '/login':(context)=> Login(),
        '/tiledash':(context)=>TileDash(),

        },
    );
  }
}
