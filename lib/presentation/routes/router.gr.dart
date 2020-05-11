// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:portfoliosite/presentation/pages/home_screen.dart';
import 'package:portfoliosite/presentation/pages/about_screen.dart';
import 'package:portfoliosite/presentation/pages/contact_screen.dart';
import 'package:portfoliosite/presentation/pages/experience_screen.dart';
import 'package:portfoliosite/presentation/pages/work_screen.dart';
import 'package:portfoliosite/presentation/pages/resume_screen.dart';

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
          builder: (context) => HomeScreen(),
          settings: settings,
        );
      case Routes.aboutScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AboutScreen(),
          settings: settings,
        );
      case Routes.contactScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ContactScreen(),
          settings: settings,
        );
      case Routes.experienceScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ExperienceScreen(),
          settings: settings,
        );
      case Routes.workScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => WorkScreen(),
          settings: settings,
        );
      case Routes.resumeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ResumeScreen(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
