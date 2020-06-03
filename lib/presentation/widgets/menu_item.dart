import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

import 'package:portfoliosite/core/extensions/hover_extensions.dart';

class MenuItem extends StatelessWidget {
  MenuItem({
    @required this.title,
    this.titleStyle,
    this.onTap,
    this.selectedStyle,
    this.selected = false,
  });

  final String title;
  final TextStyle titleStyle;
  final TextStyle selectedStyle;
  final bool selected;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    TextStyle menuTextStyle = theme.textTheme.bodyText1.copyWith(
      color: AppColors.grey100,
      fontSize: Sizes.TEXT_SIZE_16,
    );

    TextStyle selectedMenuTextStyle = theme.textTheme.bodyText1.copyWith(
      color: Colors.red, //AppColors.primaryColor,
      fontSize: Sizes.TEXT_SIZE_18,
    );

    return InkWell(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
           selected ? Container(
              width: 2,
              height: 18,
              color: AppColors.grey,
            ) : Container(),
            selected ? SpaceW12() : Container(),
            Text(
              title,
              style: selected
                  ? (selectedStyle ?? menuTextStyle)
                  : (titleStyle ?? menuTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}
