import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfoliosite/presentation/widgets/horizontal_bar.dart';
import 'package:portfoliosite/values/values.dart';
import 'package:portfoliosite/core/extensions/hover_extensions.dart';

class Socials extends StatelessWidget {
  Socials({
    this.isHorizontal = false,
    this.isVertical = false,
    this.crossAxisAlignment,
    this.color,
  }) : assert(isHorizontal == false || isVertical == false,
            'Both isHorizontal and isVertical cannot be true');

  final bool isVertical;
  final bool isHorizontal;
  final Color color;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return isVertical
        ? Container(
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              children: [
                Icon(
                  FontAwesomeIcons.github,
                  color: color,
                ),
                HorizontalBar(
                  width: Sizes.WIDTH_40,
                  margin: EdgeInsets.symmetric(vertical: Sizes.MARGIN_8),
                ),
                Icon(
                  FontAwesomeIcons.linkedin,
                  color: color,
                ),
                HorizontalBar(
                  width: Sizes.WIDTH_40,
                  margin: EdgeInsets.symmetric(vertical: Sizes.MARGIN_8),
                ),
                Icon(
                  FontAwesomeIcons.twitter,
                  color: color,
                ),
              ],
            ),
          ).showCursorOnHover
        : IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.github,
                  color: color ?? AppColors.deepBlue400,
                ),
                VerticalDivider(
                  width: Sizes.WIDTH_30,
                  thickness: 2,
                ),
                Icon(
                  FontAwesomeIcons.linkedin,
                  color: color ?? AppColors.deepBlue400,
                ),
                VerticalDivider(
                  width: Sizes.WIDTH_30,
                  thickness: 2,
                ),
                Icon(
                  FontAwesomeIcons.twitter,
                  color: color ?? AppColors.deepBlue400,
                ),
              ],
            ),
          ).showCursorOnHover;
  }
}
