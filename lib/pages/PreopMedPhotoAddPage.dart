import 'dart:async';
import 'dart:io';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_myopv10/Components/fancy_fab.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';


double qsize = 20.0;

class preopMedPhotoAdd extends StatefulWidget {

  @override
  _preopMedPhotoAddState createState() => new _preopMedPhotoAddState();
}

class _preopMedPhotoAddState extends State<preopMedPhotoAdd> {
  File _image;
  bool HasImage;
  List<DropdownMenuItem<int>> listDrop = [];

  void loadData()
  {
    listDrop.add(new DropdownMenuItem(child: Text("Once a day"),value: 1,));
    listDrop.add(new DropdownMenuItem(child: Text("Twice a day"),value: 2,));
    listDrop.add(new DropdownMenuItem(child: Text("Thrice a day"),value: 3,));
    listDrop.add(new DropdownMenuItem(child: Text("Four times a day"),value: 4,));
    listDrop.add(new DropdownMenuItem(child: Text("Five times a day"),value: 5,));
    listDrop.add(new DropdownMenuItem(child: Text("Six times a day"),value: 6,));


  }
  @override
  void initState() {
    // TODO: implement initState
    HasImage =false;
    loadData();
    getImage();
    super.initState();
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if(image == null){HasImage = false;}else{HasImage = true;}

    setState(() {
      if(HasImage){ _image = image;}else{print("no image");}
    });
  }


  NextPage()
  {
    Navigator.pushNamed(context, '/splash');

  }

   Future UploadPhotoToServer()
  {
   print("in server");
   Timer(Duration(seconds: 8),()=> true);
  }


  void dialog(BuildContext context)
  {
      new Future.delayed(Duration.zero, () {
        showDialog(context: context, builder: (context) =>
        new AlertDialog(title: Text(
          "ALERT!", style: TextStyle(color: Colors.orange),
          textAlign: TextAlign.center,),
          content: new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/medicine.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  'Are you done?',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 30.0),
                ),
              )
            ],
          ),
          actions: <Widget>[
            new FlatButton(onPressed: ()async {
              //upload to server and then goto splash
              CircularProgressIndicator();
             await UploadPhotoToServer();
              NextPage();

            }, child: new Text('yes')),
            new FlatButton(onPressed: () {
              print("adding.....");
              Navigator.pushNamed(context, '/MedPhotoAdd');
            }, child: new Text('Add more medication photo')),
          ],
        ));
      });


  }


  Widget ChildWidget()
  {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppbar(myWidget: Text("MyOp",style: TextStyle(color: Colors.white),),BarHieght: 30.0,),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              SizedBox(child: _image == null? Icon(Icons.image,size: 200.0,): Image.file(_image),height: 200.0,width: 200.0,),
              SizedBox(child: _image == null? CircularProgressIndicator(strokeWidth: 20.0,): Image.file(_image),height: 200.0,width: 200.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  hint: Text("HOW MANY TIME A DAY?"),
                  items: listDrop ,
                  onChanged: null,
                ),
              )


            ],
          ),
        ),floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[

        FloatingActionButton(child: Icon(Icons.done),heroTag: "Done",onPressed: (){if(!HasImage){ Navigator.pushNamed(context, '/MedPhotoAdd');} else{dialog(context);}}),
        SizedBox(height: 20.0,),

      ],
    )


    );
  }


  @override
  Widget build(BuildContext context) {
//    loadData();
    return new WillPopScope(child: ChildWidget(), onWillPop: () async => false);
  }
}

