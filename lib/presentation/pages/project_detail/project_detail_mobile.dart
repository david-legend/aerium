import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/pages/contact/contact_page.dart';
import 'package:portfoliosite/presentation/pages/portfolio/portfolio_page.dart';
import 'package:portfoliosite/presentation/widgets/app_drawer.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/custom_app_bar.dart';
import 'package:portfoliosite/presentation/widgets/project_cover.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class ProjectDetailMobile extends StatelessWidget {
  ProjectDetailMobile({
    @required this.projectDetails,
  });

  final ProjectDetails projectDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: StringConst.PROJECT_NAME,
          actionIcon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.accentColor2,
          ),
          onLeadingPressed: () {},
          onActionsPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: AppDrawer(
        menuList: Data.menuList,
        selectedItemRouteName: PortfolioPage.portfolioPageRoute,
      ),
      body: ContentWrapper(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_24,
            vertical: Sizes.PADDING_16,
          ),
          children: [
            ProjectCover(
              width: widthOfScreen(context),
              height: assignHeight(context: context, fraction: 0.4),
              offset: 16,
              projectCoverUrl: ImagePath.PORTFOLIO_3,
            ),
            SpaceH16(),
            Text(StringConst.PROJECT_NAME),
            SpaceH4(),
            Text(StringConst.PROJECT_NAME),
            SpaceH8(),
            Text(StringConst.ABOUT_DEV_TEXT),
          ],
        ),
      ),
    );
  }
}
