import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/pages/about/about_page_desktop.dart';
import 'package:portfoliosite/presentation/pages/about/about_page_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';


//TODO:: Add bottomBar to about page
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: AboutPageMobile(),
        tablet: AboutPageDesktop(),
        desktop: AboutPageDesktop(),
      ),
    );
  }
}