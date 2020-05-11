import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfoliosite/layout/adaptive.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/content_view.dart';
import 'package:portfoliosite/presentation/widgets/desktop_navigation.dart';
import 'package:portfoliosite/presentation/widgets/menu_item.dart';
import 'package:portfoliosite/presentation/widgets/menu_list.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class HomeScreen extends StatelessWidget {
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
                        DesktopNavigation(
                          width: width(context: context, fraction: 0.5),
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
                        ContentView(
                          width: width(context: context, fraction: 0.5),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Center(
                child: Image.asset(
                  ImagePath.DEV,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
