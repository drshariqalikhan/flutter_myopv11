import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


class AcceptTermsCard extends StatelessWidget {

  final String Question, Accept_text,Decline_text;
  final double QuestionFontsize;
  final Function Accept_func;
  final Function Decline_func;
  const AcceptTermsCard({this.Question, this.QuestionFontsize,this.Accept_func,this.Decline_func,this.Accept_text,this.Decline_text });

  @override
  Widget build(BuildContext context) {
    return      Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        /////////////////////
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AutoSizeText("$Question",style: TextStyle(fontSize: QuestionFontsize??20.0,fontWeight: FontWeight.bold,),maxLines: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
                    RaisedButton(child: Text(Accept_text??"I Accept"),onPressed: Accept_func??(){})
                   ],),
                  Row(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[
                    RaisedButton(child: Text(Decline_text??"I Decline"),onPressed: Decline_func??(){})
                   ],),

                ],
              ),

            ],
          ),
        ),

      ),
    );
  }
}
