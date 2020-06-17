import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/pages/contact/contact_page.dart';
import 'package:portfoliosite/presentation/pages/portfolio/portfolio_page.dart';
import 'package:portfoliosite/presentation/pages/project_detail/project_detail.dart';
import 'package:portfoliosite/presentation/routes/routes.dart';
import 'package:portfoliosite/presentation/widgets/app_drawer.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/custom_app_bar.dart';
import 'package:portfoliosite/presentation/widgets/portfolio_card.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class PortfolioPageMobile extends StatefulWidget {
  @override
  _PortfolioPageMobileState createState() => _PortfolioPageMobileState();
}

class _PortfolioPageMobileState extends State<PortfolioPageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: StringConst.PORTFOLIO,
          onLeadingPressed: () {},
          onActionsPressed: () {
            Navigator.pushNamed(
              context,
              ContactPage.contactPageRoute,
            );
          },
        ),
      ),
      drawer: AppDrawer(
        menuList: Data.menuList,
        selectedItemRouteName: PortfolioPage.portfolioPageRoute,
      ),
      body: ContentWrapper(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_24,
            vertical: Sizes.PADDING_16,
          ),
          itemCount: Data.portfolioData.length,
          separatorBuilder: (BuildContext context, index) {
            return SpaceH20();
          },
          itemBuilder: (BuildContext context, index) {
            return PortfolioCard(
              imageUrl: Data.portfolioData[index].image,
              title: Data.portfolioData[index].title,
              subtitle: Data.portfolioData[index].subtitle,
              actionTitle: StringConst.VIEW,
              height: assignHeight(context: context, fraction: 0.35),
              width: widthOfScreen(context),
              onTap: () {
                _navigateToProjectDetail(
                  projectDetails: ProjectDetails(
                    projectImage: Data.portfolioData[index].image,
                    projectName: Data.portfolioData[index].title,
                    projectDescription:
                        Data.portfolioData[index].portfolioDescription,
                    isPublic: Data.portfolioData[index].isPublic,
                    isLive: Data.portfolioData[index].isLive,
                    isOnPlayStore: Data.portfolioData[index].isOnPlayStore,
                    gitHubUrl: Data.portfolioData[index].gitHubUrl,
                    playStoreUrl: Data.portfolioData[index].playStoreUrl,
                    webUrl: Data.portfolioData[index].webUrl,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  List<Widget> hu(List<PortfolioData> portfolioData) {
    List<Widget> widgets = [];
    for (var i = 0; i < portfolioData.length; i++) {
      widgets.add(
        PortfolioCard(
            imageUrl: portfolioData[i].image,
            title: portfolioData[i].title,
            subtitle: portfolioData[i].subtitle,
            actionTitle: StringConst.VIEW,
            height: assignHeight(context: context, fraction: 0.3),
            width: widthOfScreen(context),
            onTap: () {
              _navigateToProjectDetail(
                projectDetails: ProjectDetails(
                  projectImage: portfolioData[i].image,
                  projectName: portfolioData[i].title,
                  projectDescription: portfolioData[i].portfolioDescription,
                  isPublic: portfolioData[i].isPublic,
                  isLive: portfolioData[i].isLive,
                  isOnPlayStore: portfolioData[i].isOnPlayStore,
                  gitHubUrl: portfolioData[i].gitHubUrl,
                  playStoreUrl: portfolioData[i].playStoreUrl,
                  webUrl: portfolioData[i].webUrl,
                ),
              );
            }),
      );
    }
    return widgets;
  }

  void _navigateToProjectDetail({
    @required ProjectDetails projectDetails,
  }) {
    Navigator.push(
      context,
      NoAnimationMaterialPageRoute(
        builder: (context) => ProjectDetailPage(
          projectDetails: projectDetails,
        ),
      ),
    );
  }
}
