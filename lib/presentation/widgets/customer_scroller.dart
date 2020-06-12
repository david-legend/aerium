import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class CustomScroller extends StatelessWidget {
  CustomScroller({
    this.width = Sizes.WIDTH_24,
    this.padding = const EdgeInsets.all(Sizes.PADDING_0),
    this.scrollColor = AppColors.deepBlue500,
    this.scrollCenterColor = AppColors.grey200,
    this.onUpTap,
    this.onDownTap,
    this.topController,
    this.centerChild,
    this.bottomController,
  });

  final EdgeInsetsGeometry padding;
  final double width;
  final Color scrollColor;
  final Color scrollCenterColor;
  final GestureTapCallback onUpTap;
  final GestureTapCallback onDownTap;
  final Widget topController;
  final Widget bottomController;
  final Widget centerChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: width,
        color: scrollColor,
        child: Column(
          children: [
            InkWell(
              onTap: onUpTap,
              child: topController ??
                  Icon(Icons.keyboard_arrow_up, color: AppColors.grey250),
            ),
            SpaceH8(),
            centerChild ??
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    width: Sizes.WIDTH_6,
                    height: Sizes.HEIGHT_6,
                    color: scrollCenterColor,
                  ),
                ),
            SpaceH8(),
            InkWell(
              onTap: onDownTap,
              child: bottomController ??
                  Icon(Icons.keyboard_arrow_down, color: AppColors.grey250),
            )
          ],
        ),
      ),
    );
  }
}
