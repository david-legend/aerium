import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/widgets/circular_container.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

//TODO:: Add selected menu underline styles
//TODO:: Add VK, INST to bottom of app drawer
class AppDrawer extends StatelessWidget {
  AppDrawer({
    this.color = AppColors.grey100,
    this.width,
  });

  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle selectedStyle = theme.textTheme.headline4.copyWith(
      color: AppColors.deepBlue,
    );
    TextStyle unSelectedStyle = theme.textTheme.headline5.copyWith(
      color: AppColors.grey200,
    );
    return Container(
      color: color,
      width: width ?? widthOfScreen(context),
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Sizes.PADDING_16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircularContainer(
                    color: AppColors.grey300,
                    width: Sizes.WIDTH_30,
                    height: Sizes.HEIGHT_30,
                    child: Icon(
                      Icons.close,
                      size: Sizes.ICON_SIZE_20,
                      color: AppColors.deepBlue,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Menu 1', style: selectedStyle),
                SpaceH16(),
                Text('Menu 2', style: unSelectedStyle),
                 SpaceH16(),
                Text('Menu 3', style: unSelectedStyle),
                 SpaceH16(),
                Text('Menu 4', style: unSelectedStyle),
              ],
            ),
            Spacer(flex: 1),
            Row(
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }
}
