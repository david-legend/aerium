import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/widgets/custom_app_bar.dart';
import 'package:portfoliosite/values/values.dart';

class ContactPageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(56),
        child: CustomAppBar(
          title: StringConst.CONTACT,
          onLeadingPressed: () {},
          onActionsPressed: () {},
        ),
      ),
      body: Container(
        height: assignHeight(context: context, fraction: 0.4),
        color: AppColors.deepBlue100,
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
