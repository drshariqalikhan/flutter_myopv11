import 'package:flutter/material.dart';
import 'package:flutter_myopv10/Components/fancy_fab.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void gotoNext(){
    Navigator.pushNamed(context, '/second');
  }



  @override
  Widget build(BuildContext context) {
    return  new WillPopScope(
      onWillPop: () async => false,
      child: buildScaffold(context)
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),automaticallyImplyLeading: false,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //widgets here
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(

          onPressed: _incrementCounter
      ),
    );
  }
}
