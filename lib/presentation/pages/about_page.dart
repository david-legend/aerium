import 'package:flutter/material.dart';
import 'package:portfoliosite/layout/adaptive.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/content_view.dart';
import 'package:portfoliosite/presentation/widgets/desktop_navigation.dart';
import 'package:portfoliosite/presentation/widgets/menu_list.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool animate = false;
  int duration = 800;
  double widthOfImage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    widthOfImage = width(context: context, fraction: 0.3);
    double heightOfImage = height(context: context, fraction: 0.7);
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.5, end: 0.3),
                        duration: Duration(milliseconds: duration),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: Sizes.MARGIN_20,
                            top: Sizes.MARGIN_20,
                            bottom: Sizes.MARGIN_20,
                          ),
                          child: MenuList(
                            menuList: Data.menuList,
                            selectedItemRouteName: Routes.aboutPage,
                          ),
                        ),
                        builder:
                            (BuildContext context, double value, Widget child) {
                          return DesktopNavigation(
                            width: width(context: context, fraction: value),
                            child: child,
                          );
                        },
                      ),
                      TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.5, end: 0.7),
                        duration: Duration(milliseconds: duration),
                        builder:
                            (BuildContext context, double value, Widget child) {
                          return ContentView(
                            width: width(context: context, fraction: value),
                            child: aboutPageContent(),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: duration),
              top: animate
                  ? height(context: context, fraction: 0.0)
                  : height(context: context, fraction: 0.4),
              left: animate
                  ? (width(context: context, fraction: 0.3) - widthOfImage / 2)
                  : (width(context: context, fraction: 0.5) - widthOfImage / 2),
              child: Container(
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 2, end: 1),
                  duration: Duration(milliseconds: duration),
                  child: Image.asset(
                    ImagePath.DEV,
                    width: widthOfImage,
                    height: heightOfImage,
                    fit: BoxFit.cover,
                  ),
                  builder: (BuildContext context, double value, Widget child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget aboutPageContent() {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(
        left: (widthOfImage / 2) + 20,
        top: height(context: context, fraction: 0.12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Heading goes Here',
            style: theme.textTheme.headline4,
          ),
          SpaceH4(),
          Text(
            'subtitle goes here ',
            style:
                theme.textTheme.bodyText1.copyWith(color: AppColors.bodyText1),
          ),
          SpaceH16(),
          Text(
            StringConst.ABOUT_DEV_TEXT,
            style:
                theme.textTheme.bodyText1.copyWith(color: AppColors.bodyText1),
          ),
          SpaceH16(),
          Text('SKILLS GOES HERE'),
        ],
      ),
    );
  }
}
