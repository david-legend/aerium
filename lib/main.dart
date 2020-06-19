import 'package:flutter/material.dart';
import 'package:portfoliosite/app_theme.dart';
import 'package:portfoliosite/presentation/pages/home/home_page.dart';
import 'package:portfoliosite/presentation/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Site',
      theme: AppTheme.lightThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.homePageRoute,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
