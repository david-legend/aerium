import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/pages/contact/contact_page.dart';
import 'package:portfoliosite/presentation/widgets/app_drawer.dart';
import 'package:portfoliosite/presentation/widgets/custom_app_bar.dart';
import 'package:portfoliosite/values/values.dart';

class ContactPageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(
          title: StringConst.CONTACT,
          onLeadingPressed: () {},
          onActionsPressed: () {},
        ),
      ),
      drawer: AppDrawer(
        menuList: Data.menuList,
        selectedItemRouteName: ContactPage.contactPageRoute,
      ),
      body: Container(
        height: assignHeight(context: context, fraction: 0.4),
        color: AppColors.deepBlue700,
        child: ListView(
          children: [
            Text(StringConst.PHONE_NUMBER),
            Text(StringConst.CONTACT_NO),
            Text(StringConst.EMAIL),
            Text(StringConst.EMAIL_VALUE),
          ],
        ),
      ),
    );
  }
}
