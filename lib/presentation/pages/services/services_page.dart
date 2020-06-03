import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/pages/services/services_page_desktop.dart';
import 'package:portfoliosite/presentation/pages/services/services_page_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ScreenTypeLayout(
        mobile: ServicesPageMobile(),
        tablet: ServicesPageDesktop(),
        desktop: ServicesPageDesktop(),
      ),
    );
  }
}
