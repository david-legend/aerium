import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/pages/about/about_page.dart';
import 'package:portfoliosite/presentation/widgets/app_drawer.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/custom_app_bar.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class AboutPageMobile extends StatefulWidget {
  @override
  _AboutPageMobileState createState() => _AboutPageMobileState();
}

class _AboutPageMobileState extends State<AboutPageMobile> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: StringConst.ABOUT_ME,
          onLeadingPressed: () {},
          onActionsPressed: () {},
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
                  'Heading goes Here',
                  style: theme.textTheme.headline4,
                ),
                SpaceH4(),
                Text(
                  'subtitle goes here ',
                  style: theme.textTheme.bodyText1
                      .copyWith(color: AppColors.bodyText1),
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
            right: -assignWidth(context: context, fraction: 0.35),
            child: Image.asset(
              ImagePath.DEV,
              height: heightOfScreen(context),
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
