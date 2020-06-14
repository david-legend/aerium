part of 'values.dart';

class MenuData {
  MenuData({
    @required this.title,
    @required this.routeName,
  });

  final String title;
  final String routeName;
}

class CertificationData {
  CertificationData({
    @required this.title,
    @required this.image,
    @required this.imageSize,
    @required this.url,
    @required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class PortfolioData {
  PortfolioData({
    @required this.title,
    @required this.image,
    @required this.imageSize,
    @required this.subtitle,
  });

  final String image;
  final double imageSize;
  final String title;
  final String subtitle;
}

class ExperienceData {
  ExperienceData({
    @required this.position,
    @required this.role,
    @required this.location,
    @required this.duration,
    this.company,
    this.companyUrl,
  });

  final String company;
  final String companyUrl;
  final String location;
  final String duration;
  final String position;
  final String role;
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
    MenuData(title: StringConst.RESUME, routeName: StringConst.RESUME),
    MenuData(
      title: StringConst.CERTIFICATIONS,
      routeName: CertificationPage.certificationPageRoute,
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
  static List<PortfolioData> portfolioData = [
    PortfolioData(
      title: "FoodyBite",
      subtitle: "FoodyBit",
      image: ImagePath.PORTFOLIO_2,
      imageSize: 0.15,
    ),
    PortfolioData(
      title: "FoodyBite",
      subtitle: "FoodyBit",
      image: ImagePath.PORTFOLIO_3,
      imageSize: 0.15,
    ),
    PortfolioData(
      title: "FoodyBitw",
      subtitle: "FoodyBit",
      image: ImagePath.PORTFOLIO_4,
      imageSize: 0.3,
    ),
    PortfolioData(
      title: "FoodyBite",
      subtitle: "FoodyBit",
      image: ImagePath.PORTFOLIO_5,
      imageSize: 0.45,
    ),
    PortfolioData(
      title: "FoodyBitw",
      subtitle: "FoodyBit",
      image: ImagePath.PORTFOLIO_6,
      imageSize: 0.15,
    ),
  ];

  static List<double> imageSizesForPortfolioGallery = [
    0.15,
    0.15,
    0.3,
    0.45,
    0.159,
    0.3,
    0.15,
    0.15,
  ];
  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.ASSOCIATE_ANDROID_DEV,
      url: StringConst.ASSOCIATE_ANDROID_DEV_URL,
      image: ImagePath.ASSOCIATE_ANDROID_DEV,
      imageSize: 0.30,
      awardedBy: StringConst.GOOGLE,
    ),
    CertificationData(
      title: StringConst.DATA_SCIENCE,
      url: StringConst.DATA_SCIENCE_CERT_URL,
      image: ImagePath.DATA_SCIENCE_CERT,
      imageSize: 0.30,
      awardedBy: StringConst.UDACITY,
    ),
    CertificationData(
      title: StringConst.ANDROID_BASICS,
      url: StringConst.ANDROID_BASICS_CERT_URL,
      image: ImagePath.ANDROID_BASICS_CERT,
      imageSize: 0.30,
      awardedBy: StringConst.UDACITY,
    ),
  ];

  static List<ExperienceData> experienceData = [
    ExperienceData(
      company: StringConst.COMPANY_4,
      position: StringConst.POSITION_4,
      role: StringConst.ROLE_4,
      location: StringConst.LOCATION_4,
      duration: StringConst.DURATION_4,
    ),
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: StringConst.POSITION_3,
      role: StringConst.ROLE_3,
      location: StringConst.LOCATION_3,
      duration: StringConst.DURATION_3,
    ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.POSITION_2,
      role: StringConst.ROLE_2,
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
    ExperienceData(
      company: StringConst.COMPANY_1,
      position: StringConst.POSITION_1,
      role: StringConst.ROLE_1,
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
  ];
}
