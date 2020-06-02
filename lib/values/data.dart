part of 'values.dart';



class MenuData {
  MenuData({@required this.title, @required this.routeName});

  final String title;
  final String routeName;
}


class Data {
  static  List<MenuData> menuList =  [
    MenuData(title: StringConst.ABOUT, routeName: Routes.aboutPage),
    MenuData(title: StringConst.EXPERIENCE, routeName: Routes.experiencePage),
    MenuData(title: StringConst.WORK, routeName: Routes.workPage),
    MenuData(title: StringConst.CONTACT, routeName: Routes.contactPage),
    MenuData(title: StringConst.RESUME, routeName: Routes.resumePage),
  ];
}