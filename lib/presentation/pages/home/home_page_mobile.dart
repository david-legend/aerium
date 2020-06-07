import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/app_drawer.dart';
import 'package:portfoliosite/presentation/widgets/circular_container.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/horizontal_bar.dart';
import 'package:portfoliosite/presentation/widgets/socials.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

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
        selectedItemRouteName: Routes.aboutPage,
      ),
      body: Container(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      ContentWrapper(
                        width: assignWidth(context: context, fraction: 0.8),
                        gradient: Gradients.primaryGradient,
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
                                        color: AppColors.grey200,
                                        letterSpacing: 4,
                                      ),
                                    ),
                                    SpaceH8(),
                                    Text(
                                      StringConst.SPECIALITY,
                                      style: theme.textTheme.headline6.copyWith(
                                        letterSpacing: 4,
                                        color: AppColors.deepBlue300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(flex: 1),
                              Container(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: Column(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: Text(
                                        StringConst.VIEW_PORTFOLIO,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: AppColors.grey400,
                                        ),
                                      ),
                                    ),
                                    SpaceH12(),
                                    CircularContainer(
                                      width: Sizes.WIDTH_24,
                                      height: Sizes.HEIGHT_24,
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.deepBlue300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                        color: AppColors.grey100,
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
                _scaffoldKey.currentState.openDrawer();
              } else {
                _scaffoldKey.currentState.openEndDrawer();
              }
            },
            icon: Icon(Icons.menu),
          ),
          CircularContainer(
            color: AppColors.grey300,
            child: Icon(
              Icons.email,
              color: AppColors.deepBlue300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDevImage() {
    return Positioned(
      left: assignWidth(context: context, fraction: 0.2),
      child: Image.asset(
        ImagePath.DEV,
        width: assignWidth(context: context, fraction: 1),
        height: assignHeight(context: context, fraction: 1),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildSocials() {
    return Positioned(
      right: 16,
      bottom: 30,
      child: Socials(
        isVertical: true,
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
    );
  }
}
