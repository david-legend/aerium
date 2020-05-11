// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:portfoliosite/presentation/pages/home_page.dart';
import 'package:portfoliosite/presentation/pages/about_page.dart';
import 'package:portfoliosite/presentation/pages/contact_page.dart';
import 'package:portfoliosite/presentation/pages/experience_page.dart';
import 'package:portfoliosite/presentation/pages/work_page.dart';
import 'package:portfoliosite/presentation/pages/resume_page.dart';

abstract class Routes {
  static const homeScreen = '/';
  static const aboutScreen = '/about-screen';
  static const contactScreen = '/contact-screen';
  static const experienceScreen = '/experience-screen';
  static const workScreen = '/work-screen';
  static const resumeScreen = '/resume-screen';
  static const all = {
    homeScreen,
    aboutScreen,
    contactScreen,
    experienceScreen,
    workScreen,
    resumeScreen,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomePage(),
          settings: settings,
        );
      case Routes.aboutScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AboutPage(),
          settings: settings,
        );
      case Routes.contactScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ContactPage(),
          settings: settings,
        );
      case Routes.experienceScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ExperiencePage(),
          settings: settings,
        );
      case Routes.workScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => WorkPage(),
          settings: settings,
        );
      case Routes.resumeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ResumePage(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
