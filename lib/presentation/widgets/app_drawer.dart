import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/circular_container.dart';
import 'package:portfoliosite/presentation/widgets/socials.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

import 'menu_item.dart';

//TODO:: Add selected menu underline styles
//TODO:: Add VK, INST to bottom of app drawer
class AppDrawer extends StatelessWidget {
  AppDrawer({
    @required this.menuList,
    this.color = AppColors.grey100,
    this.width,
    this.selectedItemRouteName,
  });

  final Color color;
  final double width;
  final String selectedItemRouteName;
  final List<MenuData> menuList;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle selectedStyle = theme.textTheme.headline4.copyWith(
      color: AppColors.deepBlue300,
    );
    TextStyle unSelectedStyle = theme.textTheme.headline5.copyWith(
      color: AppColors.grey200,
    );
    return Container(
      color: color,
      width: width ?? widthOfScreen(context),
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Sizes.PADDING_16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircularContainer(
                    color: AppColors.grey300,
                    width: Sizes.WIDTH_30,
                    height: Sizes.HEIGHT_30,
                    child: Icon(
                      Icons.close,
                      size: Sizes.ICON_SIZE_20,
                      color: AppColors.deepBlue300,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ..._buildMenuList(menuList),
              ],
            ),
            Spacer(flex: 1),
            Socials(isHorizontal: true),
            SpaceH44(),
          ],
        ),
      ),
    );
  }


  List<Widget> _buildMenuList(List<MenuData> menuList) {
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        MenuItem(
          onTap: () => ExtendedNavigator.ofRouter<Router>()
              .pushNamed(menuList[i].routeName),
          title: menuList[i].title,
          isMobile: true,
          selected: selectedItemRouteName == menuList[i].routeName ? true : false,
        ),
      );
      menuItems.add(SpaceH16());
    }
    return menuItems;
  }
}
