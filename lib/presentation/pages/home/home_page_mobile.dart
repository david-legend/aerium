import 'package:flutter/material.dart';
import 'package:portfoliosite/core/extensions/hover_extensions.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/pages/contact/contact_page.dart';
import 'package:portfoliosite/presentation/pages/portfolio/portfolio_page.dart';
import 'package:portfoliosite/presentation/widgets/app_drawer.dart';
import 'package:portfoliosite/presentation/widgets/circular_container.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/socials.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_page.dart';

class HomePageMobile extends StatefulWidget {
  @override
  _HomePageMobileState createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(
        menuList: Data.menuList,
        selectedItemRouteName: HomePage.homePageRoute,
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    ContentWrapper(
                      width: assignWidth(context: context, fraction: 0.8),
                      color: AppColors.primaryColor,
//                        gradient: Gradients.primaryGradient,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: assignHeight(
                                context: context,
                                fraction: 0.2,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: ListBody(
                                children: [
                                  Text(
                                    StringConst.DEV_NAME,
                                    style: theme.textTheme.headline4.copyWith(
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                  SpaceH8(),
                                  Text(
                                    StringConst.SPECIALITY,
                                    style: theme.textTheme.headline6.copyWith(
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(flex: 1),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  PortfolioPage.portfolioPageRoute,
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: Column(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: Text(
                                        StringConst.VIEW_PORTFOLIO,
                                        textAlign: TextAlign.end,
                                        style:
                                            theme.textTheme.bodyText1.copyWith(
                                          color: AppColors.secondaryColor,
                                          fontSize: Sizes.TEXT_SIZE_18,
                                        ),
                                      ),
                                    ),
                                    SpaceH12(),
                                    CircularContainer(
                                      width: Sizes.WIDTH_24,
                                      height: Sizes.HEIGHT_24,
                                      color: AppColors.secondaryColor,
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).showCursorOnHover,
                            SizedBox(
                              height: assignHeight(
                                context: context,
                                fraction: 0.05,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ContentWrapper(
                      width: assignWidth(context: context, fraction: 0.2),
                      color: AppColors.secondaryColor,
                      child: Container(),
                    ),
                  ],
                )
              ],
            ),
            _buildAppBar(),
            _buildDevImage(),
            _buildSocials(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_16,
        vertical: Sizes.PADDING_16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (_scaffoldKey.currentState.isEndDrawerOpen) {
                _scaffoldKey.currentState.openEndDrawer();
              } else {
                _scaffoldKey.currentState.openDrawer();
              }
            },
            icon: Icon(Icons.menu),
          ),
          CircularContainer(
            color: AppColors.primaryColor,
            child: InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                ContactPage.contactPageRoute,
              ),
              child: Icon(
                Icons.email,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDevImage() {
    return Positioned(
      top: 56,
      right: widthOfScreen(context) > 480
          ? -assignWidth(context: context, fraction: 0.4)
          : -assignWidth(context: context, fraction: 0.65),
      child: Container(
        child: Image.asset(
          ImagePath.DEV,
          height: assignHeight(context: context, fraction: 1),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  double figureOutWidth() {
    if (widthOfScreen(context) > 480 && widthOfScreen(context) < 600) {
      return -assignWidth(context: context, fraction: 0.4);
    } else if (widthOfScreen(context) >= 600 && widthOfScreen(context) < 700) {
      return -assignWidth(context: context, fraction: 0.3);
    } else if (widthOfScreen(context) >= 700 && widthOfScreen(context) < 950) {
      return -assignWidth(context: context, fraction: 0.2);
    } else {
      return -assignWidth(context: context, fraction: 0.6);
    }
  }

  Widget _buildSocials() {
    return Positioned(
      right: 16,
      bottom: 30,
      child: Socials(
        isVertical: true,
        alignment: Alignment.centerRight,
        color: AppColors.secondaryColor,
        barColor: AppColors.secondaryColor,
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
    );
  }
}
