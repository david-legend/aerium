import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_page_desktop.dart';
import 'home_page_mobile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: HomePageMobile(),
//        tablet: HomePageMobile(),
        tablet: HomePageDesktop(),
        desktop: HomePageDesktop(),
      ),
    );
  }
}
