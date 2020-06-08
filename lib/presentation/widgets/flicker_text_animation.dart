import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfoliosite/values/values.dart';

class FlickerTextAnimation extends StatefulWidget {
  FlickerTextAnimation({
    Key key,
    this.controller,
    this.textColor,
    this.fadeInColor,
    this.text,
    this.textStyle,
    this.fontSize = Sizes.TEXT_SIZE_16,
  })  : color = ColorTween(
          begin: textColor,
          end: fadeInColor,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.1,
              curve: Curves.easeIn,
            ),
          ),
        ),
        title = IntTween(
          begin: (Random().nextDouble() * pow(10, text.length)).toInt(),
          end: (Random().nextDouble() * pow(10, text.length)).toInt(),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              1,
              curve: Curves.easeIn,
            ),
          ),
        ),
        super(key: key);

  final Animation<double> controller;
  final Animation<Color> color;
  final Animation<int> title;
  final Color textColor;
  final Color fadeInColor;
  final String text;
  final double fontSize;
  final TextStyle textStyle;

  @override
  _FlickerTextAnimationState createState() => _FlickerTextAnimationState();
}

class _FlickerTextAnimationState extends State<FlickerTextAnimation> {
  bool isAnimating = false;

  @override
  void initState() {
    widget.controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          isAnimating = true;
        });
      }
      if (status == AnimationStatus.completed) {
        setState(() {
          isAnimating = false;
        });
      }
    });

    super.initState();
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    ThemeData theme = Theme.of(context);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isAnimating ? widget.title.value.toString() : widget.text,
            style: widget.textStyle ??
                theme.textTheme.bodyText1.copyWith(
                  color: widget.color.value,
                  fontSize: widget.fontSize,
                ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: widget.controller,
    );
  }
}
