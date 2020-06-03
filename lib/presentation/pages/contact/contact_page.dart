import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'contact_page_mobile.dart';
import 'contact_page_desktop.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: ContactPageMobile(),
        tablet: ContactPageDesktop(),
        desktop: ContactPageDesktop(),
      ),
    );
  }
}
