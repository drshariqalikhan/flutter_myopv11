import 'dart:async';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class info extends StatefulWidget {


  @override
  _infoState createState() => new _infoState();
}

class _infoState extends State<info> {
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _controller = new VideoPlayerController.network(
//      'https://github.com/flutter/assets-for-api-docs/blob/master/assets/videos/butterfly.mp4?raw=true',
//    );
  }





  ChildWidget() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //widgets here
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                Column(
                  children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Image.asset('assets/images/surgeryicon.png',scale: 2.0,),
                      onTap: ()=>Navigator.pushNamed(context, '/aboutsurg'),

                    ),
                  ),
                  Text("About Surgery"),
                ],),

                Column(
                  children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Image.asset('assets/images/anesthicon.png',scale: 2.0,),
                      onTap: ()=>Navigator.pushNamed(context, '/aboutsurg'),

                    ),
                  ),
                  Text("About Anaesthesia"),
                ],),


              ],),
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
               Column(children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: GestureDetector(
                     child: Image.asset('assets/images/woundcareicon.jpg',scale: 2.0,),
                     onTap: ()=>Navigator.pushNamed(context, '/aboutsurg'),

                   ),
                 ),
                 Text("About Wound Care"),

               ],),
              Column(children: <Widget>[
                Padding(

                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Image.asset('assets/images/Physiotherapyicon.png',scale: 2.0,),
                    onTap: ()=>Navigator.pushNamed(context, '/aboutsurg'),

                  ),
                ),
                Text("About Physio Therapy"),
              ],),


             ],),
           ),



          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.home),
        onPressed:()=>Navigator.pushNamed(context, '/splash'),

      ),
    );
  }

  Widget ListWidget()
  {
    return Scaffold(
        body: ListView(
          children: <Widget>[

            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
              onTap: ()=>Navigator.pushNamed(context, '/aboutsurg'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),

          ],
        )
    );

  }

  @override
    Widget build(BuildContext context) {
    return WillPopScope(child: ChildWidget(), onWillPop: () async => false);
  }

}







