import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/pages/about_page.dart';
import 'package:portfoliosite/presentation/routes/router.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/menu_list.dart';
import 'package:portfoliosite/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
                          gradient:  Gradients.primaryGradient,
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
