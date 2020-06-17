import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/pages/contact/contact_page.dart';
import 'package:portfoliosite/presentation/pages/portfolio/portfolio_page.dart';
import 'package:portfoliosite/presentation/pages/project_detail/project_detail.dart';
import 'package:portfoliosite/presentation/routes/routes.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/customer_scroller.dart';
import 'package:portfoliosite/presentation/widgets/menu_list.dart';
import 'package:portfoliosite/presentation/widgets/portfolio_card.dart';
import 'package:portfoliosite/presentation/widgets/trailing_info.dart';
import 'package:portfoliosite/values/values.dart';

class PortfolioPageDesktop extends StatefulWidget {
  @override
  _PortfolioPageDesktopState createState() => _PortfolioPageDesktopState();
}

class _PortfolioPageDesktopState extends State<PortfolioPageDesktop>
    with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
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
      duration: const Duration(milliseconds: 700),
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
                    color: AppColors.primaryColor,
//                    gradient: Gradients.primaryGradient,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: Sizes.MARGIN_20,
                        top: Sizes.MARGIN_20,
                        bottom: Sizes.MARGIN_20,
                      ),
                      child: MenuList(
                        menuList: Data.menuList,
                        selectedItemRouteName: PortfolioPage.portfolioPageRoute,
                      ),
                    ),
                  ),
                  ContentWrapper(
                    width: assignWidth(
                      context: context,
                      fraction: widthOfRightContentWrapperAnimation.value,
                    ),
                    color: AppColors.secondaryColor,
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
                          onLeadingWidgetPressed: () => Navigator.pushNamed(
                            context,
                            ContactPage.contactPageRoute,
                          ),
                          trailingWidget: CustomScroller(
                            onUpTap: () {
                              _scroll(
                                  _scrollController.position.minScrollExtent);
                            },
                            onDownTap: () {
                              _scroll(
                                  _scrollController.position.maxScrollExtent);
                            },
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
//        Positioned(
//          child: FadeTransition(
//            opacity: opacityAnimation,
//            child: Image.asset(
//              ImagePath.DEV,
//              width: widthOfImage,
//              height: heightOfImage,
//              fit: BoxFit.cover,
//            ),
//          ),
//        ),
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
    return ListView(
      controller: _scrollController,
      children: [
        Wrap(
          direction: Axis.horizontal,
          spacing: assignWidth(context: context, fraction: 0.0099),
          runSpacing: assignHeight(context: context, fraction: 0.02),
          children: _portfolioItem(Data.portfolioData),
        ),
      ],
    );
  }

  List<Widget> _portfolioItem(List<PortfolioData> portfolioData) {
    List<Widget> widgets = [];
    double duration =
        _portfolioController.duration.inMilliseconds.roundToDouble();
    double durationForEachPortfolio =
        _portfolioController.duration.inMilliseconds.roundToDouble() /
            portfolioData.length;
    for (var i = 0; i < portfolioData.length; i++) {
//      print("duration $duration");
//      print(
//          "duration starts from ${durationForEachPortfolio * i} and ends at ${durationForEachPortfolio * (i + 1)} ");
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
            imageUrl: portfolioData[i].image,
            title: portfolioData[i].title,
            subtitle: portfolioData[i].subtitle,
            actionTitle: StringConst.VIEW,
            onTap: () {
              _navigateToProjectDetail(
                projectDetails: ProjectDetails(
                  projectImage: portfolioData[i].image,
                  projectName: portfolioData[i].title,
                  projectDescription: portfolioData[i].portfolioDescription,
                  isPublic: portfolioData[i].isPublic,
                  isLive: portfolioData[i].isLive,
                  isOnPlayStore: portfolioData[i].isOnPlayStore,
                  gitHubUrl: portfolioData[i].gitHubUrl,
                  playStoreUrl: portfolioData[i].playStoreUrl,
                  webUrl: portfolioData[i].webUrl,
                ),
              );
            },
            height: assignHeight(context: context, fraction: 0.45),
            width: assignWidth(
              context: context,
              fraction: portfolioData[i].imageSize,
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  _scroll(double offset) {
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void _navigateToProjectDetail({
    @required ProjectDetails projectDetails,
  }) {
    Navigator.push(
      context,
      NoAnimationMaterialPageRoute(
        builder: (context) => ProjectDetailPage(
          projectDetails: projectDetails,
        ),
      ),
    );
  }
}
