import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


class QuestionCard extends StatelessWidget{

  final String Question;
  final double QuestionFontsize;
  final bool qValue;
  final Function handleQ;

  const QuestionCard({this.Question, this.QuestionFontsize, this.handleQ, this.qValue});


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
              AutoSizeText("$Question",style: TextStyle(fontSize: QuestionFontsize,fontWeight: FontWeight.bold,),maxLines: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
                    Text("YES"),
                  Radio(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      value: true,
                      groupValue: qValue,
                      onChanged: handleQ),],),
                  Row(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[
                    Text("NO"),
                  Radio(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      value: false,
                      groupValue: qValue,
                      onChanged: handleQ)],),

                ],
              ),

            ],
          ),
        ),

      ),
    );
  }

}