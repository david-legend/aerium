import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfoliosite/app_theme.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/flicker_text_animation.dart';
import 'package:portfoliosite/presentation/widgets/try.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
//      home: FlickerDemo(),
//      StaggerDemo(),
      theme: AppTheme.lightThemeData,
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator<Router>(
        router: Router(),
        initialRoute: Routes.homePage,
      ),
    );
  }
}
