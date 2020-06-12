//// GENERATED CODE - DO NOT MODIFY BY HAND
//
//// **************************************************************************
//// AutoRouteGenerator
//// **************************************************************************
//
//import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:auto_route/auto_route.dart';
//import 'package:portfoliosite/presentation/pages/home/home_page.dart';
//import 'package:portfoliosite/presentation/pages/about/about_page.dart';
//import 'package:portfoliosite/presentation/pages/contact/contact_page.dart';
//import 'package:portfoliosite/presentation/pages/experience_page.dart';
//import 'package:portfoliosite/presentation/pages/services/services_page.dart';
//import 'package:portfoliosite/presentation/pages/portfolio/portfolio_page.dart';
//import 'package:portfoliosite/presentation/pages/message/message_page.dart';
//import 'package:portfoliosite/presentation/pages/project_detail/project_detail.dart';
//import 'package:portfoliosite/presentation/pages/resume_page.dart';
//
//abstract class Routes {
//  static const homePage = '/';
//  static const aboutPage = '/about-page';
//  static const contactPage = '/contact-page';
//  static const experiencePage = '/experience-page';
//  static const servicesPage = '/services-page';
//  static const portfolioPage = '/portfolio-page';
//  static const messagePage = '/message-page';
//  static const projectDetailPage = '/project-detail-page';
//  static const resumePage = '/resume-page';
//  static const all = {
//    homePage,
//    aboutPage,
//    contactPage,
//    experiencePage,
//    servicesPage,
//    portfolioPage,
//    messagePage,
//    projectDetailPage,
//    resumePage,
//  };
//}
//
//class Router extends RouterBase {
//  @override
//  Set<String> get allRoutes => Routes.all;
//
//  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
//  static ExtendedNavigatorState get navigator =>
//      ExtendedNavigator.ofRouter<Router>();
//
//  @override
//  Route<dynamic> onGenerateRoute(RouteSettings settings) {
//    switch (settings.name) {
//      case Routes.homePage:
//        return MaterialPageRoute<dynamic>(
//          builder: (context) => HomePage(),
//          settings: settings,
//        );
//      case Routes.aboutPage:
//        return MaterialPageRoute<dynamic>(
//          builder: (context) => AboutPage(),
//          settings: settings,
//        );
//      case Routes.contactPage:
//        return MaterialPageRoute<dynamic>(
//          builder: (context) => ContactPage(),
//          settings: settings,
//        );
//      case Routes.experiencePage:
//        return MaterialPageRoute<dynamic>(
//          builder: (context) => ExperiencePage(),
//          settings: settings,
//        );
//      case Routes.servicesPage:
//        return MaterialPageRoute<dynamic>(
//          builder: (context) => ServicesPage(),
//          settings: settings,
//        );
//      case Routes.portfolioPage:
//        return MaterialPageRoute<dynamic>(
//          builder: (context) => PortfolioPage(),
//          settings: settings,
//        );
//      case Routes.messagePage:
//        return MaterialPageRoute<dynamic>(
//          builder: (context) => MessagePage(),
//          settings: settings,
//        );
//      case Routes.projectDetailPage:
//        return MaterialPageRoute<dynamic>(
//          builder: (context) => ProjectDetailPage(),
//          settings: settings,
//        );
//      case Routes.resumePage:
//        return MaterialPageRoute<dynamic>(
//          builder: (context) => ResumePage(),
//          settings: settings,
//        );
//      default:
//        return unknownRoutePage(settings.name);
//    }
//  }
//}
