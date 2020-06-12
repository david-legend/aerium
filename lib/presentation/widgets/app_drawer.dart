import 'package:flutter/material.dart';
import 'package:portfoliosite/core/extensions/hover_extensions.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
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
    this.onClose,
  });

  final Color color;
  final double width;
  final String selectedItemRouteName;
  final List<MenuData> menuList;
  final GestureTapCallback onClose;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle selectedStyle = theme.textTheme.headline4.copyWith(
      color: AppColors.deepBlue400,
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
                  InkWell(
                    onTap: onClose ?? () {},
                    child: CircularContainer(
                      color: AppColors.grey300,
                      width: Sizes.WIDTH_30,
                      height: Sizes.HEIGHT_30,
                      child: Icon(
                        Icons.close,
                        size: Sizes.ICON_SIZE_20,
                        color: AppColors.deepBlue400,
                      ),
                    ),
                  ).showCursorOnHover,
                ],
              ),
            ),
            Spacer(flex: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ..._buildMenuList(menuList: menuList, context: context),
              ],
            ),
            Spacer(flex: 1),
            Socials(
              isHorizontal: true,
              color: AppColors.deepBlue400,
              alignment: Alignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            SpaceH44(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMenuList({
    @required BuildContext context,
    @required List<MenuData> menuList,
  }) {
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        MenuItem(
          onTap: () => Navigator.of(context).pushNamed(menuList[i].routeName),
          title: menuList[i].title,
          isMobile: true,
          selected:
              selectedItemRouteName == menuList[i].routeName ? true : false,
        ),
      );
      menuItems.add(SpaceH16());
    }
    return menuItems;
  }
}
