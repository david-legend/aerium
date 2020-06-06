import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/circular_container.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/menu_list.dart';
import 'package:portfoliosite/presentation/widgets/portfolio_card.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class PortfolioPageDesktop extends StatefulWidget {
  @override
  _PortfolioPageDesktopState createState() => _PortfolioPageDesktopState();
}

class _PortfolioPageDesktopState extends State<PortfolioPageDesktop> {
  int duration = 500;

  @override
  Widget build(BuildContext context) {
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
                        tween: Tween<double>(begin: 0.3, end: 0.2),
                        duration: Duration(milliseconds: duration),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: Sizes.MARGIN_20,
                            top: Sizes.MARGIN_20,
                            bottom: Sizes.MARGIN_20,
                          ),
                          child: MenuList(
                            menuList: Data.menuList,
                            selectedItemRouteName: Routes.portfolioPage,
                          ),
                        ),
                        builder:
                            (BuildContext context, double value, Widget child) {
                          return ContentWrapper(
                            width:
                                assignWidth(context: context, fraction: value),
                            gradient: Gradients.primaryGradient,
                            child: child,
                          );
                        },
                      ),
                      TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.7, end: 0.8),
                        duration: Duration(milliseconds: duration),
                        builder:
                            (BuildContext context, double value, Widget child) {
                          return ContentWrapper(
                            width:
                                assignWidth(context: context, fraction: value),
                            color: AppColors.grey100,
                            child: Row(
                              children: [
                                Container(
                                  width: assignWidth(
                                      context: context, fraction: 0.7),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: assignWidth(
                                        context: context, fraction: 0.04),
                                    vertical: assignHeight(
                                        context: context, fraction: 0.04),
                                  ),
                                  child: _buildPortfolioGallery(),
                                ),
//                                Container(
//                                  width: assignWidth(
//                                      context: context, fraction: 0.09),
//                                  child: _contactColumn(),
//                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioGallery() {
    List<int> fixedLengthList =  List(8);
    return ListView(
      children: [
        Wrap(
          direction: Axis.horizontal,
          spacing: assignWidth(context: context, fraction: 0.009),
          runSpacing: assignHeight(context: context, fraction: 0.02),
          children: hu(fixedLengthList),
        ),
      ],
    );
  }

  Widget _contactColumn() {
    return Column(
      children: [
        CircularContainer(
          color: AppColors.grey300,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mail,
              color: AppColors.deepBlue300,
            ),
          ),
        ),
        Spacer(flex: 1),
        Transform.rotate(
          angle: 90 * (pi / 180),
          child: Text(
            StringConst.CONTACT_NO,
            style: TextStyle(color: AppColors.grey400, fontSize: 20),
          ),
        ),
        Spacer(flex: 1),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.deepBlue300,
          ),
        )
      ],
    );
  }

  List<Widget> hu(List portfolios) {
    List<Widget> widgets = [];
    var counter = 0;
    for (var i = 0; i < portfolios.length; i++) {
      widgets.add(
        PortfolioCard(
          imageUrl: Data.portfolioImages[i],
          title: "FoodyBite",
          subtitle: "FoodyBite",
          actionTitle: "FoodyBite",
          height: assignHeight(context: context, fraction: 0.45),
          width: assignWidth(
            context: context,
            fraction: Data.imageSizesForPortfolioGallery[counter],
          ),
        ),
      );
      if ((i + 1) % 8 == 0) {
        counter = 0;
      } else {
        counter++;
      }
    }
    return widgets;
  }
}
