import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/flex.dart';


class ColSlider extends StatelessWidget {

  final Slider slider;
  final String Question;
  final double QuestionFontsize;
  final List<Widget> options;

  const ColSlider({this.slider,this.Question,this.options, this.QuestionFontsize});

  @override
  Widget build(BuildContext context) {
     Widget showOptions(){
       int val = (slider.value).round();
       return options[val];
    }

    return Card(
      child: Column(
        children: <Widget>[
          Text("$Question",style: TextStyle(fontSize: QuestionFontsize,fontWeight: FontWeight.bold),),
          slider,
          showOptions(),


        ],
      ),
    );
  }
















  // TODO: implement children
  @override
  List<Widget> get children => null;







  @override
  RenderFlex createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
  }

  // TODO: implement crossAxisAlignment
  @override
  CrossAxisAlignment get crossAxisAlignment => null;

  @override
  void didUnmountRenderObject(RenderObject renderObject) {
    // TODO: implement didUnmountRenderObject
  }

  // TODO: implement direction
  @override
  Axis get direction => null;

  @override
  TextDirection getEffectiveTextDirection(BuildContext context) {
    // TODO: implement getEffectiveTextDirection
  }

  // TODO: implement mainAxisAlignment
  @override
  MainAxisAlignment get mainAxisAlignment => null;

  // TODO: implement mainAxisSize
  @override
  MainAxisSize get mainAxisSize => null;

  // TODO: implement textBaseline
  @override
  TextBaseline get textBaseline => null;

  // TODO: implement textDirection
  @override
  TextDirection get textDirection => null;

  @override
  void updateRenderObject(BuildContext context, RenderFlex renderObject) {
    // TODO: implement updateRenderObject
  }

  // TODO: implement verticalDirection
  @override
  VerticalDirection get verticalDirection => null;



}
