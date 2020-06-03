import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/pages/portfolio/portfolio_page_desktop.dart';
import 'package:portfoliosite/presentation/pages/portfolio/portfolio_page_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: PortfolioPageMobile(),
        tablet: PortfolioPageDesktop(),
        desktop: PortfolioPageDesktop(),
      ),
    );
  }
}
