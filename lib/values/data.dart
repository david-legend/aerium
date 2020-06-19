part of 'values.dart';

//https://api.github.com/repos/david-legend/aerium/stargazers
//https://api.github.com/repos/david-legend/aerium/forks
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

class ProjectDetails {
  ProjectDetails({
    @required this.projectImage,
    @required this.projectName,
    @required this.projectDescription,
    this.isPublic,
    this.isLive,
    this.isOnPlayStore,
    this.playStoreUrl,
    this.webUrl,
    this.gitHubUrl,
  });

  final String projectImage;
  final String projectName;
  final String projectDescription;
  final bool isPublic;
  final bool isOnPlayStore;
  final bool isLive;
  final String playStoreUrl;
  final String gitHubUrl;
  final String webUrl;
}

class PortfolioData {
  PortfolioData({
    @required this.title,
    @required this.image,
    @required this.imageSize,
    @required this.subtitle,
    @required this.portfolioDescription,
    this.isPublic = false,
    this.isOnPlayStore = false,
    this.isLive = false,
    this.gitHubUrl = "",
    this.playStoreUrl = "",
    this.webUrl = "",
  });

  final String image;
  final String portfolioDescription;
  final double imageSize;
  final String title;
  final String subtitle;
  final bool isPublic;
  final String gitHubUrl;
  final bool isOnPlayStore;
  final String playStoreUrl;
  final bool isLive;
  final String webUrl;
}

class ExperienceData {
  ExperienceData({
    @required this.position,
    @required this.roles,
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
  final List<String> roles;
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
      content: StringConst.EDUCATION_TEXT,
    ),
  ];
  static List<PortfolioData> portfolioData = [
    PortfolioData(
      title: StringConst.VYBZ,
      subtitle: StringConst.VYBZ_SUBTITLE,
      image: ImagePath.VYBZ,
      portfolioDescription: StringConst.VYBZ_DETAIL,
      imageSize: 0.15,
      isOnPlayStore: true,
      playStoreUrl: StringConst.VYBZ_PLAYSTORE_URL,
    ),
    PortfolioData(
      title: StringConst.COLOSSAL_TOONS,
      subtitle: StringConst.COLOSSAL_TOONS_SUBTITLE,
      image: ImagePath.COLOSSAL_TOONS,
      portfolioDescription: StringConst.COLOSSAL_TOONS_DETAIL,
      imageSize: 0.15,
      isOnPlayStore: true,
      playStoreUrl: StringConst.COLOSSAL_TOONS_PLAYSTORE_URL,
    ),
    PortfolioData(
      title: StringConst.LOGIN_CATALOG,
      subtitle: StringConst.LOGIN_CATALOG_SUBTITLE,
      image: ImagePath.LOGIN_CATALOG,
      portfolioDescription: StringConst.LOGIN_CATALOG_DETAIL,
      imageSize: 0.3,
      isPublic: true,
      gitHubUrl: StringConst.LOGIN_CATALOG_GITHUB_URL,
    ),
    PortfolioData(
      title: StringConst.FOODY_BITE,
      subtitle: StringConst.FOODY_BITE_SUBTITLE,
      image: ImagePath.FOODY_BITE,
      portfolioDescription: StringConst.FOODY_BITE_DETAIL,
      imageSize: 0.45,
      isPublic: true,
      gitHubUrl: StringConst.FOODY_BITE_GITHUB_URL,
    ),
    PortfolioData(
      title: StringConst.ONBOARDING_APP,
      subtitle: StringConst.ONBOARDING_APP_SUBTITLE,
      image: ImagePath.ONBOARDING_APP,
      portfolioDescription: StringConst.ONBOARDING_APP_DETAIL,
      imageSize: 0.15,
      isPublic: true,
      gitHubUrl: StringConst.FOODY_BITE_GITHUB_URL,
    ),
    PortfolioData(
      title: StringConst.BEQUIP_LOGISTICS,
      subtitle: StringConst.BEQUIP_LOGISTICS_SUBTITLE,
      image: ImagePath.BEQUIP_LOGISTICS,
      portfolioDescription: StringConst.BEQUIP_LOGISTICS_DETAIL,
      imageSize: 0.3,
      isLive: true,
      webUrl: StringConst.BEQUIP_LOGISTICS_WEB_URL,
    ),
    PortfolioData(
      title: StringConst.FINOPP,
      subtitle: StringConst.FINOPP_SUBTITLE,
      image: ImagePath.FINOPP,
      portfolioDescription: StringConst.FINOPP_DETAIL,
      imageSize: 0.15,
      isPublic: true,
      gitHubUrl: StringConst.FINOPP_GITHUB_URL,
    ),
    PortfolioData(
      title: StringConst.OTP_TEXT_FIELD,
      subtitle: StringConst.OTP_TEXT_FIELD_SUBTITLE,
      image: ImagePath.OTP_TEXT_FIELD,
      portfolioDescription: StringConst.OTP_TEXT_FIELD_DETAIL,
      imageSize: 0.15,
      isPublic: true,
      isLive: true,
      gitHubUrl: StringConst.OTP_TEXT_FIELD_GITHUB_URL,
      webUrl: StringConst.OTP_TEXT_FIELD_WEB_URL,
    ),
    PortfolioData(
      title: StringConst.AERIUM,
      subtitle: StringConst.AERIUM_SUBTITLE,
      image: ImagePath.AERIUM,
      portfolioDescription: StringConst.AERIUM_DETAIL,
      imageSize: 0.3,
      isPublic: true,
      isLive: true,
      gitHubUrl: StringConst.AERIUM_GITHUB_URL,
      webUrl: StringConst.AERIUM_WEB_URL,
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
      roles: [
        StringConst.ROLE_4,
        StringConst.ROLE_4,
        StringConst.ROLE_4,
      ],
      location: StringConst.LOCATION_4,
      duration: StringConst.DURATION_4,
    ),
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: StringConst.POSITION_3,
      roles: [
        StringConst.ROLE_3,
        StringConst.ROLE_3,
        StringConst.ROLE_3,
      ],
      location: StringConst.LOCATION_3,
      duration: StringConst.DURATION_3,
    ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.POSITION_2,
      roles: [StringConst.ROLE_2],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
    ExperienceData(
      company: StringConst.COMPANY_1,
      position: StringConst.POSITION_1,
      roles: [StringConst.ROLE_1],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
  ];
}
