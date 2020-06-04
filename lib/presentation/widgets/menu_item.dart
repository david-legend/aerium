import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/widgets/horizontal_bar.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

import 'package:portfoliosite/core/extensions/hover_extensions.dart';

class MenuItem extends StatelessWidget {
  MenuItem({
    @required this.title,
    this.titleStyle,
    this.onTap,
    this.selectedStyle,
    this.isMobile = false,
    this.selected = false,
  });

  final String title;
  final TextStyle titleStyle;
  final TextStyle selectedStyle;
  final bool selected;
  final bool isMobile;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    TextStyle menuTextStyle = theme.textTheme.bodyText1.copyWith(
      color: isMobile ? AppColors.grey200 : AppColors.grey100,
      fontSize: Sizes.TEXT_SIZE_16,
    );

    TextStyle selectedMenuTextStyle = theme.textTheme.bodyText1.copyWith(
      color: isMobile ? AppColors.deepBlue : Colors.red,
      fontSize: Sizes.TEXT_SIZE_18,
    );

    return InkWell(
      onTap: onTap,
      child: Container(
        child: !isMobile
            ? Row(
                children: [
                  selected
                      ? Container(
                          width: 2,
                          height: 18,
                          color: AppColors.grey,
                        )
                      : Container(),
                  selected ? SpaceW12() : Container(),
                  Text(
                    title,
                    style: selected
                        ? (selectedStyle ?? menuTextStyle)
                        : (titleStyle ?? menuTextStyle),
                  ),
                ],
              )
            : //This menuList shows only on mobile
            Column(
                children: [
                  Text(
                    title,
                    style: selected
                        ? (selectedStyle ?? selectedMenuTextStyle)
                        : (titleStyle ?? menuTextStyle),
                  ),
                  selected ? SpaceH8() : Container(),
                  selected
                      ? HorizontalBar(
                          color: AppColors.deepBlue,
                        )
                      : Container(),
                ],
              ),
      ),
    );
  }
}
