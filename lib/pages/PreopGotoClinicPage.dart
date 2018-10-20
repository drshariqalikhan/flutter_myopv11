import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:fluttertoast/fluttertoast.dart';


class preop_GotoClinic extends StatefulWidget {

  @override
  _preop_GotoClinicState createState() => new _preop_GotoClinicState();
}

class _preop_GotoClinicState extends State<preop_GotoClinic> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child:ChildWidget(), onWillPop: () async => false);
  }

  Widget ChildWidget(){
    return Scaffold(
      appBar: MyAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: AutoSizeText("Pleae goto the Preop Clinic at SGH for the rest of the Check up, Click on Image below",
                style: TextStyle(fontWeight: FontWeight.bold),maxLines: 3,minFontSize: 20.0,),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Image.asset('assets/images/spero.png',scale: 1.0,),
                onTap: ()=>Navigator.pushNamed(context, '/myhealth'),

              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.home),
    onPressed:()=>Navigator.pushNamed(context, '/splash'),)
    );
  }

}

