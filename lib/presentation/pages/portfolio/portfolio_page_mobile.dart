import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/widgets/circular_container.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
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
      appBar: AppBar(
        title: Text(StringConst.PORTFOLIO),
        leading: IconButton(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_16,
            vertical: Sizes.PADDING_8,
          ),
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.PADDING_16,
              vertical: Sizes.PADDING_8,
            ),
            child: CircularContainer(
              color: AppColors.grey100,
              child: IconButton(
                padding: const EdgeInsets.all(Sizes.PADDING_0),
                icon: Icon(
                  Icons.email,
                  color: AppColors.deepBlue,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
      body: ContentWrapper(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_16,
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
