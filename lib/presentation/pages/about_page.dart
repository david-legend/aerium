import 'package:flutter/material.dart';
import 'package:portfoliosite/layout/adaptive.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/content_view.dart';
import 'package:portfoliosite/presentation/widgets/desktop_navigation.dart';
import 'package:portfoliosite/presentation/widgets/menu_list.dart';
import 'package:portfoliosite/values/values.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                            selectedItemRouteName: Routes.aboutScreen,
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
    );
  }
}
