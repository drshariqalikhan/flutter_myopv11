import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final _UNcontroller = new TextEditingController();
  final _PWcontroller = new TextEditingController();

  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();


  @override
  void initState() {
    // TODO: implement initState



        super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _UNcontroller.dispose();
    _PWcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Widget ChildWidget(BuildContext context){

      final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/images/spero.png'),
        ),
      );

      final username = TextField(
        keyboardType: TextInputType.text,
        autofocus: false,
        controller: _UNcontroller,
        decoration: InputDecoration(
          hintText: 'USERNAME',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      );

      final password = TextField(
        autofocus: false,
        controller: _PWcontroller,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'PASSWORD',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),),

        ),
      );

      Future getLoginToken() async{
        String url = "http://myop.pythonanywhere.com/api/auth/login/";
        String UN =_UNcontroller.text;
        String PW = _PWcontroller.text;
        print("USERNAME: $UN");
        print("PASSWORD: $PW");

        var body = {
          "username": UN,
          "password": PW
        };
        try {
          var response = await http.post(Uri.encodeFull(url), body: body,);
          if(response.statusCode != 200){
            AlertDialog(
              title: Text("Error in Login : ${response.statusCode}"),
              content: Text("Please check username and password"),
            );
            setState(() {

            });

          }else{

            Post p =  Post.fromJson(json.decode(response.body));
            print (p.TOKEN);




            //save tokens in shared pref
            saveSP("TOKEN",p.TOKEN);




          }
        }
        catch (e){

          return AlertDialog(
            title: Text("Error in Logoin : $e"),
            content: Text("Please contact admin"),
          );

        }

      }




      Future getFCMtoken ()async
      {
        //get FCM Token
        firebaseMessaging.configure(
            onLaunch: (Map<String,dynamic> msg){
              print("onLaunch called $msg");
            },
            onResume: (Map<String,dynamic> msg){
              print("onResume called $msg");
            },
            onMessage: (Map<String,dynamic> msg){
              print("onMessage called $msg");
            }
        );

        //for IOS
        firebaseMessaging.requestNotificationPermissions(
            const IosNotificationSettings(
                alert: true,
                badge: true,
                sound: true
            )
        );
        //for IOS
        firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings){
          print("IOS setting regs");
        });
        print ("getting fcm");
        await firebaseMessaging.getToken().then((token){
          //save FCM token in SP
          print(token);
          saveSP("FCM",token);
        });
      }

      void gotonext()
      {
        Navigator.of(context).pushNamed('/splash2');
      }

      void loginPush(){
//        getLoginToken().whenComplete(getFCMtoken).whenComplete(saveSharedPref).whenComplete(gotonext);
      getLoginToken().whenComplete(getFCMtoken).whenComplete(gotonext);
      }

      final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          shadowColor: Colors.lightBlueAccent.shade100,
          elevation: 5.0,
          child: MaterialButton(
            minWidth: 200.0,
            height: 42.0,
            onPressed:loginPush,
            color: Colors.lightBlueAccent,
            child: Text('Log In', style: TextStyle(color: Colors.white)),
          ),
        ),
      );


      return Scaffold(
        backgroundColor: Colors.redAccent,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              username,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              SizedBox(height: 24.0),


            ],
          ),
        ),
      );
    }
    return new WillPopScope(child: ChildWidget(context), onWillPop: () async => false);
  }
}

class Post{
  final String TOKEN;

  Post({this.TOKEN});
  factory Post.fromJson(Map<String,dynamic> json){
    return Post(
      TOKEN:json['token'],
    );
  }
}

Future<bool> saveSP(String key,String value)async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.setString(key, value);
}