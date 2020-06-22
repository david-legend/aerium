import 'package:flutter/material.dart';
import 'package:portfoliosite/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'contact_page_mobile.dart';
import 'contact_page_desktop.dart';

class ContactPage extends StatelessWidget {
  static const String contactPageRoute = StringConst.CONTACT_PAGE;

  const ContactPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        desktop: ContactPageDesktop(),
        tablet: ContactPageMobile(),
        mobile: ContactPageMobile(),
      ),
    );
  }
}
