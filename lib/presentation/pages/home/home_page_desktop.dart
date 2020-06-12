import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/pages/home/home_page.dart';
import 'package:portfoliosite/presentation/widgets/circular_container.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/menu_list.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/presentation/widgets/trailing_info.dart';
import 'package:portfoliosite/values/values.dart';

class HomePageDesktop extends StatefulWidget {
  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double widthOfImage = assignWidth(context: context, fraction: 0.4);
    return Container(
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
                          selectedItemRouteName: HomePage.homePageRoute,
                        ),
                      ),
                    ),
                    ContentWrapper(
                      width: assignWidth(context: context, fraction: 0.5),
                      color: AppColors.grey100,
                      child: TrailingInfo(
                        leadingWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              StringConst.SEND_ME_A_MESSAGE,
                              style: theme.textTheme.bodyText1.copyWith(
                                color: AppColors.deepBlue250,
                              ),
                            ),
                            SpaceW8(),
                            CircularContainer(
                              width: Sizes.WIDTH_24,
                              height: Sizes.HEIGHT_24,
                              color: AppColors.grey450,
                              child: Icon(
                                Icons.add,
                                color: AppColors.deepBlue200,
                                size: Sizes.ICON_SIZE_20,
                              ),
                            )
                          ],
                        ),
                        trailingWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              StringConst.VIEW_PORTFOLIO,
                              style: theme.textTheme.bodyText1.copyWith(
                                color: AppColors.deepBlue250,
                              ),
                            ),
                            SpaceW8(),
                            CircularContainer(
                              color: AppColors.deepBlue800,
                              width: Sizes.WIDTH_24,
                              height: Sizes.HEIGHT_24,
                              child: Icon(
                                Icons.chevron_right,
                                color: AppColors.grey250,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: assignHeight(context: context, fraction: 0.0),
            left:
                assignWidth(context: context, fraction: 0.5) - widthOfImage / 2,
            child: Container(
              child: Image.asset(
                ImagePath.DEV,
                width: widthOfImage,
                height: assignHeight(context: context, fraction: 1),
                fit: BoxFit.fitHeight,
                scale: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
