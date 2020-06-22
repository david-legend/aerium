import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfoliosite/core/utils/functions.dart';
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
        ..._buildMenuList(menuList: menuList, context: context),
        Spacer(
          flex: 1,
        ),
        Socials(
          isVertical: true,
          alignment: Alignment.centerLeft,
          color: AppColors.secondaryColor,
          barColor: AppColors.secondaryColor,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        Spacer(
          flex: 1,
        ),
        Text(
          StringConst.DEV_NAME,
          style: theme.textTheme.headline4.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
        Text(
          StringConst.SPECIALITY,
          style: theme.textTheme.headline6.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
        SpaceH20(),
        Row(
          children: [
            Text(
              StringConst.DESIGNED_IN,
              style: theme.textTheme.bodyText1.copyWith(
                color: AppColors.secondaryColor,
                fontSize: Sizes.TEXT_SIZE_10,
              ),
            ),
            SpaceW4(),
            Icon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
              size: Sizes.ICON_SIZE_10,
            )
          ],
        ),
        Wrap(
          children: [
            Text(
              StringConst.BUILT_BY + ", " + StringConst.DESIGNED_BY,
              style: theme.textTheme.bodyText1.copyWith(
                color: AppColors.secondaryColor,
                fontSize: Sizes.TEXT_SIZE_10,
              ),
            ),
          ],
        ),
      ],
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
          onTap: () {
            if (menuList[i].title == StringConst.RESUME) {
              Functions.launchUrl(DocumentPath.CV);
            } else {
              print(menuList[i].routeName);
              Navigator.of(context).pushNamed(menuList[i].routeName);
            }
          },
          title: menuList[i].title,
          selected:
              selectedItemRouteName == menuList[i].routeName ? true : false,
        ),
      );
      menuItems.add(SpaceH4());
    }
    return menuItems;
  }
}
