import 'package:flutter/material.dart';

class MyTile extends StatelessWidget implements ListTile{

  final String StageName;
  final String StageStatus;
  final String UpNext;

  const MyTile({this.StageName,this.UpNext,this.StageStatus});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int _act = 1;
    return ListTile(
        leading:StageStatus == "PENDING"? const Icon(Icons.adjust,color: Colors.grey,):const Icon(Icons.check_circle_outline,color: Colors.blueAccent,),
        title: Text("$StageName",style: StageStatus == "ONGOING"?TextStyle(color:Colors.black,fontWeight: FontWeight.bold,):null,),
        trailing: Text("$StageStatus"),
        subtitle: StageStatus == "ONGOING"?Text("Up Next : $UpNext"):null,
        enabled: StageStatus == "PENDING"? false:true,
        onTap: () { /* react to the tile being tapped */ }

    );
  }

  // TODO: implement contentPadding
  @override
  EdgeInsetsGeometry get contentPadding => null;

  // TODO: implement dense
  @override
  bool get dense => null;

  // TODO: implement enabled
  @override
  bool get enabled => null;

  // TODO: implement isThreeLine
  @override
  bool get isThreeLine => null;

  // TODO: implement leading
  @override
  Widget get leading => null;

  // TODO: implement onLongPress
  @override
  GestureLongPressCallback get onLongPress => null;

  // TODO: implement onTap
  @override
  GestureTapCallback get onTap => null;

  // TODO: implement selected
  @override
  bool get selected => null;

  // TODO: implement subtitle
  @override
  Widget get subtitle => null;

  // TODO: implement title
  @override
  Widget get title => null;

  // TODO: implement trailing
  @override
  Widget get trailing => null;
}