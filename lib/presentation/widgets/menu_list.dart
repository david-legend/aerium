import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/menu_item.dart';
import 'package:portfoliosite/presentation/widgets/socials.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class MenuList extends StatelessWidget {
  MenuList({
    @required this.menuList,
    this.selectedItemRouteName,
  });

  final List<MenuData> menuList;
  final String selectedItemRouteName;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ..._buildMenuList(menuList),

        Spacer(
          flex: 1,
        ),
        Socials(isVertical: true, crossAxisAlignment: CrossAxisAlignment.start),
        Spacer(
          flex: 1,
        ),
        Text(
          StringConst.DEV_NAME,
          style: theme.textTheme.headline4.copyWith(
            color: AppColors.grey200,
            letterSpacing: 4,
          ),
        ),
        Text(
          StringConst.SPECIALITY,
          style: theme.textTheme.headline6.copyWith(
            letterSpacing: 4,
            color: AppColors.deepBlue300,
          ),
        ),
      ],
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
          selected: selectedItemRouteName == menuList[i].routeName ? true : false,
        ),
      );
      menuItems.add(SpaceH8());
    }
    return menuItems;
  }
}
