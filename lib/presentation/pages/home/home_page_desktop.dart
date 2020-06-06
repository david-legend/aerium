
import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/widgets/circular_container.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/menu_list.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

import 'package:portfoliosite/core/extensions/hover_extensions.dart';

class HomePageDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    TextStyle menuTextStyle = theme.textTheme.bodyText1.copyWith(
      color: AppColors.grey100,
      fontSize: Sizes.TEXT_SIZE_16,
    );

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ContentWrapper(
                          width: assignWidth(context: context, fraction: 0.5),
                          gradient: Gradients.primaryGradient,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: Sizes.MARGIN_20,
                              top: Sizes.MARGIN_20,
                              bottom: Sizes.MARGIN_20,
                            ),
                            child: MenuList(
                              menuList: Data.menuList,
                            ),
                          ),
                        ),
                        ContentWrapper(
                          width: assignWidth(context: context, fraction: 0.5),
                          color: AppColors.grey100,
                          child: Container(
                            margin: EdgeInsets.only(
                              top: Sizes.MARGIN_30,
                              right: Sizes.MARGIN_30,
                              bottom: Sizes.MARGIN_20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      StringConst.SEND_ME_A_MESSAGE,
                                      style: theme.textTheme.bodyText1.copyWith(
                                        color: AppColors.deepBlue100,
                                      ),
                                    ),
                                    SpaceW8(),
                                    CircularContainer(
                                      width: Sizes.WIDTH_24,
                                      height: Sizes.HEIGHT_24,
                                      color: AppColors.grey300,
                                      child: Icon(
                                        Icons.add,
                                        color: AppColors.deepBlue200,
                                        size: Sizes.ICON_SIZE_20,
                                      ),
                                    )
                                  ],
                                ).showCursorOnHover,
                                Spacer(flex: 1),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Text(
                                    StringConst.DEV_EMAIL,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: AppColors.grey400,
                                    ),
                                  ),
                                ),
                                Spacer(flex: 1),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      StringConst.VIEW_PORTFOLIO,
                                      style: theme.textTheme.bodyText1.copyWith(
                                        color: AppColors.deepBlue100,
                                      ),
                                    ),
                                    SpaceW8(),
                                    CircularContainer(
                                      color: Color(0xFF242D36),
                                      width: Sizes.WIDTH_24,
                                      height: Sizes.HEIGHT_24,
                                      child: Icon(Icons.chevron_right),
                                    )
                                  ],
                                ).showCursorOnHover,
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Center(
                child: Image.asset(
                  ImagePath.DEV,
                  width: widthOfScreen(context),
                  height: heightOfScreen(context),
                  fit: BoxFit.fitHeight,
                  scale: 2.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
