import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:image/image.dart' as img;
import 'package:path/path.dart';


class preopMedPhoto extends StatefulWidget {
  @override
  _preopMedPhotoState createState() => new _preopMedPhotoState();
}

class _preopMedPhotoState extends State<preopMedPhoto> {


  Widget ChildWidget(BuildContext context)
  {
    return new Scaffold(

      backgroundColor: Colors.white,
      appBar:AppBar(
        leading: Hero(tag: "ic", child:Image.asset('assets/images/speroicon.png') ),
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("My Medications",style: TextStyle(fontWeight: FontWeight.bold),),

          ],),
      ) ,
        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(child:Text("Take a photo of your medication NAME",style: TextStyle(fontSize: 100.0,fontWeight: FontWeight.bold))),
          ),
         // Hero(tag: "ic", child:Image.asset('assets/images/speroicon.png') ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  IconButton(
                      tooltip: "Take a Photo",
                      icon: Icon(Icons.add_a_photo,size: 50.0,),
                      onPressed: (){
                        print("goto TakePhoto page");
                        Navigator.pushNamed(context, '/takePhoto2');
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Take a Photo"),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                      tooltip:"Pick from Gallery",
                      icon: Icon(Icons.image,size: 50.0,),
                      onPressed: (){
                        print("goto PicPhoto page");
                        Navigator.pushNamed(context, '/picPhoto2');
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Pick from Gallery"),
                  )
                ],
              )
            ],
          )
        ],
      )
      ,floatingActionButton:
    FloatingActionButton(child: Icon(Icons.home),
      heroTag: "Home",
      onPressed: (){
        print("goto splash page");
        Navigator.pushNamed(context, '/splash');
      },
    ),
    );
  }



  @override
  Widget build(BuildContext context) {

    return new WillPopScope(child: ChildWidget(context), onWillPop: () async => false);
  }
}
