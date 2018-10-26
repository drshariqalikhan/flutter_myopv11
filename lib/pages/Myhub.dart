import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/MyAppbar.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

String Url = 'https://www.healthhub.sg/myhealth';

class myhub extends StatefulWidget {
  @override
  _myhubState createState() => new _myhubState();
}

class _myhubState extends State<myhub> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: Url,
      userAgent: kAndroidUserAgent,
      withZoom: true,
      enableAppScheme: true,
      withLocalStorage: true,
      withJavascript: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("My Appointments",style: TextStyle(fontWeight: FontWeight.bold),),
            Hero(tag: "ic", child: Image.asset('assets/images/speroicon.png')),
          ],
        ),
        //leading: Hero(tag: "ic", child: Image.asset('assets/images/speroicon.png')),
        backgroundColor: Colors.black,
      ),

    );

  }
}