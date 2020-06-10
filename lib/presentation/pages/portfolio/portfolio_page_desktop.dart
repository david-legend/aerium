import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/menu_list.dart';
import 'package:portfoliosite/presentation/widgets/portfolio_card.dart';
import 'package:portfoliosite/presentation/widgets/trailing_info.dart';
import 'package:portfoliosite/values/values.dart';

//TODO:: Add the proper trailing widget for the trailinginfo widget
class PortfolioPageDesktop extends StatefulWidget {
  @override
  _PortfolioPageDesktopState createState() => _PortfolioPageDesktopState();
}

class _PortfolioPageDesktopState extends State<PortfolioPageDesktop>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _portfolioController;
  Animation<double> widthOfRightContentWrapperAnimation;
  Animation<double> opacityAnimation;
  Animation<double> widthOfLeftContentWrapperAnimation;
  Animation<double> widthOfPortfolioAnimation;
  bool _isPortfolioVisible = false;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _portfolioController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    initTweens();
    _playAnimation();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isPortfolioVisible = true;
        });
        WidgetsBinding.instance.addPersistentFrameCallback((_) {
          _playPortfolioAnimation();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _portfolioController.dispose();
    super.dispose();
  }

  void initTweens() {
    opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    widthOfLeftContentWrapperAnimation = Tween<double>(
      begin: 0.3,
      end: 0.2,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    widthOfRightContentWrapperAnimation = Tween<double>(
      begin: 0.7,
      end: 0.8,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    widthOfPortfolioAnimation = Tween<double>(
      begin: 0.6,
      end: 0.7,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playPortfolioAnimation() async {
    try {
      await _portfolioController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    double widthOfImage = assignWidth(context: context, fraction: 0.4);
    double heightOfImage = assignHeight(context: context, fraction: 1);
    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ContentWrapper(
                    width: assignWidth(
                      context: context,
                      fraction: widthOfLeftContentWrapperAnimation.value,
                    ),
                    gradient: Gradients.primaryGradient,
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
                  ),
                  ContentWrapper(
                    width: assignWidth(
                      context: context,
                      fraction: widthOfRightContentWrapperAnimation.value,
                    ),
                    color: AppColors.grey100,
                    child: Row(
                      children: [
                        Container(
                          width: assignWidth(
                              context: context,
                              fraction: widthOfPortfolioAnimation.value),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                assignWidth(context: context, fraction: 0.04),
                            vertical:
                                assignHeight(context: context, fraction: 0.04),
                          ),
                          child: _isPortfolioVisible
                              ? _buildPortfolioGallery()
                              : Container(),
                        ),
                        SizedBox(
                          width: assignWidth(
                            context: context,
                            fraction: 0.05,
                          ),
                        ),
                        TrailingInfo(
                          width: assignWidth(
                            context: context,
                            fraction: 0.05,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          child: FadeTransition(
            opacity: opacityAnimation,
            child: Image.asset(
              ImagePath.DEV,
              width: widthOfImage,
              height: heightOfImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: _controller,
          builder: _buildAnimation,
        ),
      ),
    );
  }

  Widget _buildPortfolioGallery() {
    List<int> fixedLengthList = List(8);
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


  List<Widget> hu(List portfolios) {
    List<Widget> widgets = [];
    double duration =  _portfolioController.duration.inMilliseconds.roundToDouble();
    double durationForEachPortfolio =
        _portfolioController.duration.inMilliseconds.roundToDouble() /
            portfolios.length;
    var counter = 0;
    for (var i = 0; i < portfolios.length; i++) {
      print("duration $duration");
      print(
          "duration starts from ${durationForEachPortfolio * i} and ends at ${durationForEachPortfolio * (i + 1)} ");
      double start = durationForEachPortfolio * i;
      double end = durationForEachPortfolio * (i + 1);
      widgets.add(
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(
            CurvedAnimation(
              parent: _portfolioController,
              curve: Interval(
                start > 0.0 ? start / duration : 0.0,
                end > 0.0 ? end / duration : 1.0,
                curve: Curves.easeIn,
              ),
            ),
          ),
          child: PortfolioCard(
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
