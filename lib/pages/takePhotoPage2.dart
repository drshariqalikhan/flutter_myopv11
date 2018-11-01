import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:image/image.dart' as img;
import 'package:path/path.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';


class takePhoto2 extends StatefulWidget {

  takePhoto2({Key key, this.imageSource}) : super(key: key);

  final ImageSource imageSource;

  @override
  _takePhoto2State createState() => new _takePhoto2State();

}

class _takePhoto2State extends State<takePhoto2> {
  String token;
  String _DoseFreq;
  String _display="Please select dose";
  static const baseUrl = 'http://myop.pythonanywhere.com/api';
  File imageFile;
  bool HasImage;
  List<DropdownMenuItem<String>> listDrop = [];
  bool _sending = false;

  void loadData()
  {
    listDrop =[];
    listDrop.add(new DropdownMenuItem(child: Text("Once a day"),value: 'One',));
    listDrop.add(new DropdownMenuItem(child: Text("Twice a day"),value: 'Two',));
    listDrop.add(new DropdownMenuItem(child: Text("Thrice a day"),value: 'Three',));
    listDrop.add(new DropdownMenuItem(child: Text("Four times a day"),value: 'Four',));
    listDrop.add(new DropdownMenuItem(child: Text("Five times a day"),value: 'Five',));
    listDrop.add(new DropdownMenuItem(child: Text("Six times a day"),value: 'Six',));


  }
  @override
  void initState() {
    // TODO: implement initState
    HasImage =false;
    loadData();
    getImage(widget.imageSource);
    getSP("TOKEN").then((String tk){token = "Token $tk";print(token); setState((){});});
    super.initState();
  }

//   getImage() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.camera);
//    if(image == null){HasImage = false;}else{HasImage = true;}
//
//    setState(() {
//      if(HasImage){ imageFile = image;}else{print("no image");}
//    });
//  }
  getImage(ImageSource src) async {
    var image = await ImagePicker.pickImage(source: src);
    if(image == null){HasImage = false;}else{HasImage = true;}

    setState(() {
      if(HasImage){ imageFile = image;}else{print("no image");}
    });
  }


  void _submit(BuildContext context)async
  {
    //show toast

    if(HasImage && _display !="Please select dose") {

      setState(() {
        _sending = true;
      });

      //Simulate a service call
      print('submitting to backend...');

      await _uploadImage('medpic')
          .then((int val){
        val == 200?showDialog(context: context,
            builder: (context){return AlertDialog(
              title: Text("Myop"),
              content: Text("Do you want upload more?"),
              actions: <Widget>[
                FlatButton(onPressed: ()=>Navigator.pushNamed(context,'/preopMedPhoto')
                    , child: Text("Yes")),
                FlatButton(onPressed: ()=>Navigator.pushNamed(context, '/splash'),
                    child: Text("No"))
              ],
            );})
            :showDialog(context: context,builder: (context){return AlertDialog(
          title: Text("SomeThing went wrong!"),
          content: Text("Error code: $val"),
          actions: <Widget>[
            FlatButton(onPressed: ()=>Navigator.pushNamed(context,'/preopMedPhoto'),
                child: Text("Close"))
          ],
        );});});


      setState(() {
        _sending = false;
      });
    }
    else if (HasImage && _display =="Please select dose"){
      Fluttertoast.showToast(
          msg: "Please select dose",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 3,
          bgcolor: "#e74c3c",
          textcolor: '#ffffff'
      );

    }
    else{
      Fluttertoast.showToast(
          msg: "No image found!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 3,
          bgcolor: "#e74c3c",
          textcolor: '#ffffff'
      );
      Navigator.pushNamed(context, '/preopMedPhoto');
    }
  }


  Future<int> _uploadImage(String API_endpoint)async
  {

      final url = Uri.parse('$baseUrl/medpic/');
      final fileName = path.basename(imageFile.path);
      final bytes = await compute(compress, imageFile.readAsBytesSync());
      var request = new http.MultipartRequest("PUT", url);
      request.headers['AUTHORIZATION'] = token;
      request.files.add(new http.MultipartFile.fromBytes('image', bytes,filename: "$_DoseFreq.jpg"));
      request.fields['journey_point']="preopinstruction";
      var response = await request.send();
      print(response.statusCode);
      return response.statusCode;

  }





  Widget _babyWid(BuildContext context){
    return Scaffold(
      body: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Center(child: SizedBox(child: imageFile == null? CircularProgressIndicator(): Image.file(imageFile))),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> _submit(context),
        child: Icon(Icons.file_upload),

      ),
    );
  }


  Widget ChildWid(BuildContext context){
    switch (imageFile){
      case null:{
        print("image is null");
        return Scaffold(
          appBar: AppBar(leading:Hero(tag: "ic",child: Image.asset('assets/images/speroicon.png',)) ,
            title: FittedBox(child: Text("Something went wrong! click arrow ")),
            backgroundColor: Colors.black,),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(child: Icon(Icons.arrow_back),onPressed: ()=>Navigator.pop(context))
              ],
            ),
          ),
        );
      }
      break;
      default:{
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            leading: Hero(tag: "ic",child: Image.asset('assets/images/speroicon.png',)) ,
            title: FittedBox(
              child: DropdownButton(
                style: TextStyle(color: Colors.blue,),
                hint: Text("Select dose frequency:",style: TextStyle(color: Colors.white,fontSize: 40.0),),
                items: listDrop,
                value: _DoseFreq,
                onChanged: (value){_DoseFreq = value;  setState(() {

                }); },

              ),
            ),


          ),
          bottomNavigationBar:FittedBox(child: Text(_display,style: TextStyle(fontWeight: FontWeight.bold),)),
          body: ModalProgressHUD(

            inAsyncCall: _sending,
            child: _babyWid(context),
            color: Colors.redAccent,


          ),

        );
      }
      break;
    }

  }


  @override
  Widget build(BuildContext context) {
    if(_DoseFreq != null){_display = 'You Selected : $_DoseFreq time(s) per day';}
    if(_sending){ Fluttertoast.showToast(
        msg: "uploading .. please wait",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 5,
        bgcolor: "#e74c3c",
        textcolor: '#ffffff'
    );}
//    loadData();
    return new WillPopScope(child: ChildWid(context), onWillPop: () async => false);
  }
}


List<int> compress(List<int> bytes) {
  var image = img.decodeImage(bytes);
  var resize = img.copyResize(image, 240);
  return img.encodePng(resize, level: 1);
}

Future <String> getSP(String key)async{
  print("getting $key");
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(key)?? "100";
}
