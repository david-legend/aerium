import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/widgets/circular_container.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/custom_app_bar.dart';
import 'package:portfoliosite/presentation/widgets/portfolio_card.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class PortfolioPageMobile extends StatefulWidget {
  @override
  _PortfolioPageMobileState createState() => _PortfolioPageMobileState();
}

class _PortfolioPageMobileState extends State<PortfolioPageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: StringConst.PORTFOLIO,
          onLeadingPressed: () {},
          onActionsPressed: () {},
        ),
      ),
      body: ContentWrapper(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_24,
            vertical: Sizes.PADDING_16,
          ),
          itemCount: 8,
          separatorBuilder: (BuildContext context, index) {
            return SpaceH20();
          },
          itemBuilder: (BuildContext context, index) {
            return PortfolioCard(
              imageUrl: Data.portfolioImages[index],
              title: "FoodyBite",
              subtitle: "FoodyBite",
              actionTitle: "FoodyBite",
              height: assignHeight(context: context, fraction: 0.3),
              width: widthOfScreen(context),
            );
          },
        ),
      ),
    );
  }

  List<Widget> hu(List portfolios) {
    List<Widget> widgets = [];
    for (var i = 0; i < portfolios.length; i++) {
      widgets.add(
        PortfolioCard(
          imageUrl: Data.portfolioImages[i],
          title: "FoodyBite",
          subtitle: "FoodyBite",
          actionTitle: "FoodyBite",
          height: assignHeight(context: context, fraction: 0.3),
          width: widthOfScreen(context),
        ),
      );
    }
    return widgets;
  }
}
