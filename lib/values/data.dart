part of 'values.dart';



class MenuData {
  MenuData({@required this.title, @required this.routeName});

  final String title;
  final String routeName;
}


class Data {
  static  List<MenuData> menuList =  [
    MenuData(title: StringConst.ABOUT_ME, routeName: Routes.aboutPage),
    MenuData(title: StringConst.PORTFOLIO, routeName: Routes.portfolioPage),
    MenuData(title: StringConst.EXPERIENCE, routeName: Routes.experiencePage),
    MenuData(title: StringConst.CONTACT, routeName: Routes.contactPage),
    MenuData(title: StringConst.RESUME, routeName: Routes.resumePage),
  ];

  static List<String> portfolioImages  = [
    ImagePath.PORTFOLIO_2,
    ImagePath.PORTFOLIO_3,
    ImagePath.PORTFOLIO_4,
    ImagePath.PORTFOLIO_5,
    ImagePath.PORTFOLIO_6,
    ImagePath.PORTFOLIO_2,
    ImagePath.PORTFOLIO_3,
    ImagePath.PORTFOLIO_4,
  ];
  static List<double> imageSizesForPortfolioGallery =  [
    0.15, 0.15, 0.3,
    0.45, 0.15,
    0.3, 0.15, 0.15,
  ];
}