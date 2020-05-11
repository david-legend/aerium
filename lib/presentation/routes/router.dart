import 'package:auto_route/auto_route_annotations.dart';
import 'package:portfoliosite/presentation/pages/contact_screen.dart';
import 'package:portfoliosite/presentation/pages/experience_screen.dart';
import 'package:portfoliosite/presentation/pages/home_screen.dart';
import 'package:portfoliosite/presentation/pages/about_screen.dart';
import 'package:portfoliosite/presentation/pages/resume_screen.dart';
import 'package:portfoliosite/presentation/pages/work_screen.dart';

@MaterialAutoRouter()
class $Router {

  @initial
  HomeScreen homeScreen;

  AboutScreen aboutScreen;
  ContactScreen contactScreen;
  ExperienceScreen experienceScreen;
  WorkScreen workScreen;
  ResumeScreen resumeScreen;

}
