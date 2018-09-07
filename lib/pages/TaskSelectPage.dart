import 'dart:async';

import 'package:flutter/material.dart';



class TaskSelect extends StatefulWidget {
  @override
  _TaskSelectState createState() => new _TaskSelectState();
}

class _TaskSelectState extends State<TaskSelect> {



  @override
  void initState() {
    // TODO: implement initState
    //TODO: set pagetogoto based on sever Json 'journey_point' response
    getSP('preop').then(redirect);
    super.initState();

  }

  void redirect (String page)
  {
    print(page);
    Navigator.pushNamed(context, page);
  }

  @override
  Widget build(BuildContext context) {
//    Navigator.pushNamed(context, PageToGoTo);
    return new Scaffold(
      body: Text("redirect"),


    );
  }
}

Future <String> getSP(String key)async{
  print("getting $key");
//  SharedPreferences pref = await SharedPreferences.getInstance();
//  return pref.getString(key)?? "100";
    return '/$key';
}
