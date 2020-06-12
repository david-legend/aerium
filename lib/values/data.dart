part of 'values.dart';

class MenuData {
  MenuData({
    @required this.title,
    @required this.routeName,
  });

  final String title;
  final String routeName;
}

class SkillData {
  SkillData({
    @required this.skillName,
    @required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    @required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String content;
  final List<SkillData> skillData;
  bool isAnimation;
  bool isSelected;
}

class Data {
  static List<MenuData> menuList = [
    MenuData(title: StringConst.HOME, routeName: HomePage.homePageRoute),
    MenuData(title: StringConst.ABOUT_ME, routeName: AboutPage.aboutPageRoute),
    MenuData(
      title: StringConst.PORTFOLIO,
      routeName: PortfolioPage.portfolioPageRoute,
    ),
    MenuData(
      title: StringConst.CONTACT,
      routeName: ContactPage.contactPageRoute,
    ),
    MenuData(
      title: StringConst.EXPERIENCE,
      routeName: ExperiencePage.experiencePageRoute,
    ),
    MenuData(title: StringConst.RESUME, routeName: ResumePage.resumePageRoute),
    MenuData(
      title: StringConst.CERTIFICATIONS,
      routeName: "CertificationPage.certficationPageRoute",
    ),
  ];

  static List<SkillData> skillData = [
    SkillData(skillLevel: 95, skillName: StringConst.FLUTTER),
    SkillData(skillLevel: 70, skillName: StringConst.JAVA),
    SkillData(skillLevel: 78, skillName: StringConst.ANDROID),
    SkillData(skillLevel: 70, skillName: StringConst.KOTLIN),
    SkillData(skillLevel: 80, skillName: StringConst.JAVASCRIPT),
    SkillData(skillLevel: 80, skillName: StringConst.PHP),
    SkillData(skillLevel: 80, skillName: StringConst.LARAVEL),
    SkillData(skillLevel: 80, skillName: StringConst.SQL),
    SkillData(skillLevel: 90, skillName: StringConst.WORDPRESS),
    SkillData(skillLevel: 80, skillName: StringConst.BOOTSTRAP),
    SkillData(skillLevel: 80, skillName: StringConst.HTML_CSS),
  ];

  static List<SubMenuData> subMenuData = [
    SubMenuData(
      title: StringConst.KEY_SKILLS,
      isSelected: true,
      isAnimation: true,
      skillData: skillData,
    ),
    SubMenuData(
      title: StringConst.EDUCATION,
      isSelected: false,
      content: "super education",
    ),
    SubMenuData(
      title: StringConst.EXPERIENCE,
      isSelected: false,
      content: "super experience",
    ),
  ];
  static List<String> portfolioImages = [
    ImagePath.PORTFOLIO_2,
    ImagePath.PORTFOLIO_3,
    ImagePath.PORTFOLIO_4,
    ImagePath.PORTFOLIO_5,
    ImagePath.PORTFOLIO_6,
    ImagePath.PORTFOLIO_2,
    ImagePath.PORTFOLIO_3,
    ImagePath.PORTFOLIO_4,
  ];
  static List<double> imageSizesForPortfolioGallery = [
    0.15,
    0.15,
    0.3,
    0.45,
    0.15,
    0.3,
    0.15,
    0.15,
  ];
}
