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
        appBar: MyAppbar(myWidget: Text("MyOp",style: TextStyle(color: Colors.white),),BarHieght: 30.0,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Please add a clear photo of your medication NAME"),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.whatshot,size: 300.0,),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  tooltip: "Take a Photo",
                  icon: Icon(Icons.add_a_photo,size: 50.0,),
                    onPressed: (){
                      print("goto TakePhoto page");
                      Navigator.pushNamed(context, '/takePhoto');
                    }
                ),
                IconButton(
                  tooltip:"Pick from Gallery",
                    icon: Icon(Icons.image,size: 50.0,),
                    onPressed: (){
                      print("goto PicPhoto page");
                      Navigator.pushNamed(context, '/picPhoto');
                    }
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


