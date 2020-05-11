import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfoliosite/layout/adaptive.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/content_view.dart';
import 'package:portfoliosite/presentation/widgets/desktop_navigation.dart';
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('About', style: menuTextStyle),
                                SpaceH8(),
                                Text('Experience', style: menuTextStyle),
                                SpaceH8(),
                                Text('Work', style: menuTextStyle),
                                SpaceH8(),
                                Text('Contact', style: menuTextStyle),
                                SpaceH8(),
                                Text('Resume', style: menuTextStyle),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  'DAVID COBBINA',
                                  style: theme.textTheme.headline4.copyWith(
                                    color: AppColors.grey200,
                                    letterSpacing: 4,
                                  ),
                                ),
                                Text(
                                  'FLUTTER DEV',
                                  style: theme.textTheme.headline6.copyWith(
                                      letterSpacing: 4, color: Colors.grey),
                                ),
                              ],
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
                child: Image.asset(ImagePath.MALE),
              )
            ],
          ),
        ),
      ),
    );
  }
}
