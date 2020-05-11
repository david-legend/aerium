import 'package:flutter/material.dart';
import 'package:portfoliosite/layout/adaptive.dart';
import 'package:portfoliosite/values/values.dart';

class ContentView extends StatelessWidget {
  ContentView({
    this.width,
    this.height,
    this.color = AppColors.grey100,
    this.gradient,
    this.child,
  });

  final double width;
  final double height;
  final Color color;
  final Gradient gradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? widthOfScreen(context),
      height: height ?? heightOfScreen(context),
      decoration: BoxDecoration(color: color, gradient: gradient),
      child: child,
    );
  }
}
