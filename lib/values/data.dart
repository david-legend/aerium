part of 'values.dart';



class MenuData {
  MenuData({@required this.title, @required this.routeName});

  final String title;
  final String routeName;
}


class Data {
  static  List<MenuData> menuList =  [
    MenuData(title: StringConst.ABOUT, routeName: Routes.aboutScreen),
    MenuData(title: StringConst.EXPERIENCE, routeName: Routes.experienceScreen),
    MenuData(title: StringConst.WORK, routeName: Routes.workScreen),
    MenuData(title: StringConst.CONTACT, routeName: Routes.contactScreen),
    MenuData(title: StringConst.RESUME, routeName: Routes.resumeScreen),
  ];
}