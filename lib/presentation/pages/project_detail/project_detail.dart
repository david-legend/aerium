import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/pages/project_detail/project_detail_desktop.dart';
import 'package:portfoliosite/presentation/pages/project_detail/project_detail_mobile.dart';
import 'package:portfoliosite/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';


//TODO:: Add elevation and shadow to project covers cards..
class ProjectDetailPage extends StatelessWidget {
  static const String projectDetailPageRoute = StringConst.PROJECT_DETAIL_PAGE;

  const ProjectDetailPage({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: ProjectDetailMobile(),
        tablet: ProjectDetailDesktop(),
        desktop: ProjectDetailDesktop(),
      ),
    );
  }
}
