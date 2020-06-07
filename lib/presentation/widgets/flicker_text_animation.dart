import 'package:flutter/material.dart';
import 'package:portfoliosite/values/values.dart';

class FlickerTextAnimation extends StatelessWidget {
  FlickerTextAnimation({
    Key key,
    this.controller,
    this.textColor,
    this.fadeInColor,
    this.text
  })  : color = Tween<Color>(
          begin: textColor,
          end: fadeInColor,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              1.0,
              curve: Curves.ease,
            ),
          ),
        ),
//        quarterTurns = Tween<int>(
//          begin: 0,
//          end: 2,
//        ).animate(
//          CurvedAnimation(
//            parent: controller,
//            curve: Interval(
//              0.0,
//              0.250,
//              curve: Curves.ease,
//            ),
//          ),
//        ),
//        rectifyQuarterTurns = Tween<int>(
//          begin: 2,
//          end: 0,
//        ).animate(
//          CurvedAnimation(
//            parent: controller,
//            curve: Interval(
//              0.250,
//              0.500,
//              curve: Curves.ease,
//            ),
//          ),
//        ),
        super(key: key);
  final Animation<double> controller;
  final Animation<Color> color;
//  final Animation<int> quarterTurns;
//  final Animation<int> rectifyQuarterTurns;
  final Color textColor;
  final Color fadeInColor;
  final String text;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: 0,
            child: Text(
              text,
              style: TextStyle(
//                color: color.value,
              ),
            ),
          )
//          ...rotatedText(
//            title: text,
//            quarterTurns: 0, //quarterTurns.value,
//            textColor: color.value,
//          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }

  List<Widget> rotatedText({String title, int quarterTurns, Color textColor}) {
    List<Widget> text = [];
    for (var i = 0; i < title.length; i++) {
      text.add(
        RotatedBox(
          quarterTurns: quarterTurns,
          child: Text(
            title[i],
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      );
    }
    return text;
  }
}
