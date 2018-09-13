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


class takePhoto extends StatefulWidget {
  @override
  _takePhotoState createState() => new _takePhotoState();
}

class _takePhotoState extends State<takePhoto> {
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
    getImage();
    token = getToken();
    super.initState();
  }

getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
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

      await _uploadImage('medpic');
      Navigator.pushNamed(context, '/preopMedPhoto');


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


  _uploadImage(String API_endpoint)async
  {
    try{

      final url = Uri.parse('$baseUrl/medpic/');
      final fileName = path.basename(imageFile.path);
      final bytes = await compute(compress, imageFile.readAsBytesSync());
      var request = new http.MultipartRequest("PUT", url);
      request.headers['AUTHORIZATION'] = token;
      request.files.add(new http.MultipartFile.fromBytes('image', bytes,filename: "$_DoseFreq.jpg"));
      var response = await request.send();
      print(response.statusCode);
      if(response.statusCode == 200){
        //set SP to true if response in 200
        print('true');
      }else{
        print('false');
      }



    }catch(e){}
  }





  Widget _babyWid(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: SizedBox(child: imageFile == null? CircularProgressIndicator(strokeWidth: 20.0,): Image.file(imageFile))),

        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:()=> _submit(context),
        child: Icon(Icons.file_upload),

      ),
    );
  }

  Widget ChildWid2(BuildContext context)
  {
    return Scaffold(
      bottomNavigationBar:Text(_display,style: TextStyle(fontSize: 20.0),),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,

        title: DropdownButton(
          hint: Text("Select dose frequency:",style: TextStyle(color: Colors.white),),
          items: listDrop,
          value: _DoseFreq,
          onChanged: (value){_DoseFreq = value;  setState(() {

          }); },

        ),

      ),

      body: ModalProgressHUD(

        inAsyncCall: _sending,
        child: _babyWid(context),
        color: Colors.redAccent,


      ),
    );
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
    return new WillPopScope(child: ChildWid2(context), onWillPop: () async => false);
  }
}


String getToken()=>"Token b959d32cd0001f63b30e24da5d7ae40f89683c74";

List<int> compress(List<int> bytes) {
  var image = img.decodeImage(bytes);
  var resize = img.copyResize(image, 240);
  return img.encodePng(resize, level: 1);
}

