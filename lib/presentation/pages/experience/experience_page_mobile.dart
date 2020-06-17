import 'package:flutter/material.dart';
import 'package:portfoliosite/core/utils/functions.dart';
import 'package:portfoliosite/presentation/pages/contact/contact_page.dart';
import 'package:portfoliosite/presentation/pages/experience/experience_page.dart';
import 'package:portfoliosite/presentation/widgets/app_drawer.dart';
import 'package:portfoliosite/presentation/widgets/custom_app_bar.dart';
import 'package:portfoliosite/presentation/widgets/experience_column.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class ExperiencePageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: StringConst.EXPERIENCE,
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
        selectedItemRouteName: ExperiencePage.experiencePageRoute,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.PADDING_16,
          vertical: Sizes.PADDING_16,
        ),
        child: ListView.separated(
          itemCount: Data.experienceData.length,
          separatorBuilder: (BuildContext context, int index) {
            return SpaceH30();
          },
          itemBuilder: (BuildContext context, int index) {
            return ExperienceColumn(
              duration: Data.experienceData[index].duration,
              position: Data.experienceData[index].position,
              company: Data.experienceData[index].company,
              location: Data.experienceData[index].location,
              role: Data.experienceData[index].role,
              onTap: () {
                Functions.launchUrl(Data.experienceData[index].companyUrl);
              },
            );
          },
        ),
      ),
    );
  }
}
