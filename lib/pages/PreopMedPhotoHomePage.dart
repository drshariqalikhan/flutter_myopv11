import 'dart:async';
import 'dart:io';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_myopv10/Components/fancy_fab.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';


double qsize = 20.0;

class preopMedPhoto extends StatefulWidget {

  @override
  _preopMedPhotoState createState() => new _preopMedPhotoState();
}

class _preopMedPhotoState extends State<preopMedPhoto> {



Widget ChildWidget()
{
  return new Scaffold(
    backgroundColor: Colors.white,
    appBar: MyAppbar(myWidget: Text("MyOp",style: TextStyle(color: Colors.white),),BarHieght: 30.0,),
   body: Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         SizedBox(child: Icon(Icons.image,size: 200.0,),height: 200.0,width: 200.0,),
         Padding(
           padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 50.0,right: 50.0),
           child: Text('PLEASE TAKE A CLEAR PHOTO OF YOUR MEDICATION NAME',),
         ),
         
       ],
     ),
   ),floatingActionButton: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      FloatingActionButton(child: Icon(Icons.add_a_photo),heroTag: "Add_photo",onPressed: (){Navigator.pushNamed(context, '/MedPhotoAdd');}),
      SizedBox(height: 20.0,),
      FloatingActionButton(child: Icon(Icons.home),heroTag: "Home",onPressed: (){Navigator.pushNamed(context, '/splash');}),
      SizedBox(height: 20.0,),

    ],
  )


  );
}

  @override
  Widget build(BuildContext context) {

    return new WillPopScope(child: ChildWidget(), onWillPop: () async => false);
  }
}

