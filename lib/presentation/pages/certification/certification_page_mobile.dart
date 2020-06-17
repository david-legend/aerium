import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/core/utils/functions.dart';
import 'package:portfoliosite/presentation/pages/certification/certification_page.dart';
import 'package:portfoliosite/presentation/pages/contact/contact_page.dart';
import 'package:portfoliosite/presentation/widgets/app_drawer.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/custom_app_bar.dart';
import 'package:portfoliosite/presentation/widgets/portfolio_card.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class CertificationPageMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: StringConst.CERTIFICATIONS,
          onLeadingPressed: () {
            if (_scaffoldKey.currentState.isEndDrawerOpen) {
              _scaffoldKey.currentState.openEndDrawer();
            } else {
              _scaffoldKey.currentState.openDrawer();
            }
          },
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
        selectedItemRouteName: CertificationPage.certificationPageRoute,
      ),
      body: ContentWrapper(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_24,
            vertical: Sizes.PADDING_16,
          ),
          itemCount: Data.certificationData.length,
          separatorBuilder: (BuildContext context, index) {
            return SpaceH20();
          },
          itemBuilder: (BuildContext context, index) {
            return PortfolioCard(
              imageUrl: Data.certificationData[index].image,
              onTap: () => _viewCertificate(Data.certificationData[index].url),
              title: Data.certificationData[index].title,
              subtitle: Data.certificationData[index].awardedBy,
              actionTitle: StringConst.VIEW,
              height: assignHeight(context: context, fraction: 0.35),
              width: widthOfScreen(context),
            );
          },
        ),
      ),
    );
  }

  void _viewCertificate(String url) {
    Functions.launchUrl(url);
  }
}
