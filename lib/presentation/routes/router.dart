import 'package:auto_route/auto_route_annotations.dart';
import 'package:portfoliosite/presentation/pages/contact_page.dart';
import 'package:portfoliosite/presentation/pages/experience_page.dart';
import 'package:portfoliosite/presentation/pages/home_page.dart';
import 'package:portfoliosite/presentation/pages/about_page.dart';
import 'package:portfoliosite/presentation/pages/resume_page.dart';
import 'package:portfoliosite/presentation/pages/work_page.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomePage homePage;

  AboutPage aboutPage;

  ContactPage contactPage;

  ExperiencePage experiencePage;

  WorkPage workPage;

  ResumePage resumePage;
}

