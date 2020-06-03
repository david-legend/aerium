import 'package:flutter/material.dart';
import 'package:portfoliosite/values/values.dart';

class HorizontalBar extends StatelessWidget {
  HorizontalBar({
    this.width = Sizes.WIDTH_20,
    this.height = Sizes.HEIGHT_2,
    this.color = AppColors.grey300,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
