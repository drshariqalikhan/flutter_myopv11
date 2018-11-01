import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class UnkwnOpStatus extends StatefulWidget {

  @override
  _UnkwnOpStatusState createState() => new _UnkwnOpStatusState();
}

class _UnkwnOpStatusState extends State<UnkwnOpStatus> {



childWidget (){
  return Scaffold(
    appBar: AppBar(backgroundColor: Colors.black,leading:Hero(tag: "ic", child:Image.asset('assets/images/speroicon.png')),title: FittedBox(child: Text("OPERATION DAY"),),),
    floatingActionButton: FloatingActionButton(child: Icon(Icons.home),onPressed: ()=>Navigator.pushNamed(context, '/splash')),

  );

}
  @override
  Widget build(BuildContext context) {

    return new WillPopScope(child: childWidget() , onWillPop: () async => false);
  }
}

