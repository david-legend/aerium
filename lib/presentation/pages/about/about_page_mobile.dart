import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/pages/about/about_page.dart';
import 'package:portfoliosite/presentation/pages/contact/contact_page.dart';
import 'package:portfoliosite/presentation/widgets/app_drawer.dart';
import 'package:portfoliosite/presentation/widgets/bottom_draggable_scrollable_sheet.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/custom_app_bar.dart';
import 'package:portfoliosite/presentation/widgets/horizontal_bar.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class AboutPageMobile extends StatefulWidget {
  @override
  _AboutPageMobileState createState() => _AboutPageMobileState();
}

class _AboutPageMobileState extends State<AboutPageMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: StringConst.ABOUT_ME,
          onLeadingPressed: () {
            if (_scaffoldKey.currentState.isEndDrawerOpen) {
              _scaffoldKey.currentState.openEndDrawer();
            } else {
              _scaffoldKey.currentState.openDrawer();
            }
          },
          onActionsPressed: () {
            Navigator.pushNamed(
              context,
              ContactPage.contactPageRoute,
            );
          },
        ),
      ),
      drawer: AppDrawer(
        menuList: Data.menuList,
        selectedItemRouteName: AboutPage.aboutPageRoute,
      ),
      body: Stack(
        children: [
          ContentWrapper(
            child: ListView(
              padding: EdgeInsets.only(
                top: Sizes.PADDING_24,
                left: Sizes.PADDING_24,
              ),
              children: [
                Text(
                  StringConst.INTRO,
                  style: theme.textTheme.bodyText1.copyWith(
                    fontSize: Sizes.TEXT_SIZE_18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.accentColor2,
                  ),
                ),
                Text(
                  StringConst.DEV_NAME,
                  style: theme.textTheme.headline6.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: Sizes.TEXT_SIZE_24,
                  ),
                ),
                Text(
                  StringConst.PUNCH_LINE,
                  style: theme.textTheme.headline6.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: Sizes.TEXT_SIZE_24,
                  ),
                ),
                SpaceH16(),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: assignWidth(context: context, fraction: 0.65),
                        child: Text(
                          StringConst.ABOUT_DEV_TEXT,
                          style: theme.textTheme.bodyText1
                              .copyWith(color: AppColors.bodyText1),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: -assignWidth(context: context, fraction: 0.45),
            child: Image.asset(
              ImagePath.DEV,
              height: heightOfScreen(context),
              fit: BoxFit.cover,
            ),
          ),
          BottomDraggableScrollableSheet(),
        ],
      ),
    );
  }
}
