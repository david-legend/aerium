import 'package:auto_route/auto_route_annotations.dart';
import 'package:portfoliosite/presentation/pages/contact_page.dart';
import 'package:portfoliosite/presentation/pages/experience_page.dart';
import 'package:portfoliosite/presentation/pages/about/about_page.dart';
import 'package:portfoliosite/presentation/pages/home/home_page.dart';
import 'package:portfoliosite/presentation/pages/portfolio/portfolio_page.dart';
import 'package:portfoliosite/presentation/pages/project_detail/project_detail.dart';
import 'package:portfoliosite/presentation/pages/resume_page.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomePage homePage;

  AboutPage aboutPage;

  ContactPage contactPage;

  ExperiencePage experiencePage;

  PortfolioPage portfolioPage;

  ProjectDetailPage projectDetailPage;

  ResumePage resumePage;
}

