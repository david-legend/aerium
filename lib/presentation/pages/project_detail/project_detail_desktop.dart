import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/flicker_text_animation.dart';
import 'package:portfoliosite/presentation/widgets/menu_list.dart';
import 'package:portfoliosite/presentation/widgets/project_cover_2.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/presentation/widgets/trailing_info.dart';
import 'package:portfoliosite/values/values.dart';

class ProjectDetailDesktop extends StatefulWidget {
  @override
  _ProjectDetailDesktopState createState() => _ProjectDetailDesktopState();
}

class _ProjectDetailDesktopState extends State<ProjectDetailDesktop>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _flickerAnimationController;
  AnimationController _flickerAnimationController2;
  AnimationController _contentAnimationController;
  Animation<double> _projectCoverScaleAnimation;
  Animation<double> _projectBackgroundScaleAnimation;
  Animation<double> _projectContentAnimation;
  bool _isHeadingVisible = false;
  bool _isSubtitleVisible = false;
  bool _isContentVisible = false;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    );
    _flickerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _flickerAnimationController2 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _contentAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    initTweens();
    _playAnimation();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isHeadingVisible = true;
        });
        WidgetsBinding.instance.addPersistentFrameCallback((_) {
          _playFlickerAnimation();
        });
      }
    });
    _flickerAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isSubtitleVisible = true;
        });
        WidgetsBinding.instance.addPersistentFrameCallback((_) {
          _playFlickerAnimation2();
        });
      }
    });

    _flickerAnimationController2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isContentVisible = true;
        });
        WidgetsBinding.instance.addPersistentFrameCallback((_) {
          _playProjectContentAnimation();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _flickerAnimationController.dispose();
    _flickerAnimationController2.dispose();
  }

  initTweens() {
    _projectCoverScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );
    _projectBackgroundScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    _projectContentAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _contentAnimationController,
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

  Future<void> _playFlickerAnimation() async {
    try {
      await _flickerAnimationController.forward().orCancel;
      await _flickerAnimationController.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playFlickerAnimation2() async {
    try {
      await _flickerAnimationController2.forward().orCancel;
      await _flickerAnimationController2.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playProjectContentAnimation() async {
    try {
      await _contentAnimationController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  ContentWrapper(
                    width: assignWidth(
                      context: context,
                      fraction: 0.2,
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
                      fraction: 0.8,
                    ),
                    color: AppColors.grey100,
                    child: Row(
                      children: [
                        Container(
                          width: assignWidth(
                            context: context,
                            fraction: 0.7,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                assignWidth(context: context, fraction: 0.04),
                            vertical:
                                assignHeight(context: context, fraction: 0.04),
                          ),
                          child: _buildProjectDetailContent(),
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: _buildAnimation,
    );
  }

  Widget _buildProjectDetailContent() {
    double offset = 40.0;
    ThemeData theme = Theme.of(context);

    return Row(
      children: [
        ProjectCover2(
          width: assignWidth(context: context, fraction: 0.30),
          height: heightOfScreen(context),
          offset: offset,
          projectCoverScale: _projectCoverScaleAnimation.value,
          backgroundScale: _projectBackgroundScaleAnimation.value,
          projectCoverBackgroundColor: AppColors.deepBlue900,
          projectCoverUrl: ImagePath.PORTFOLIO_4,
        ),
        SizedBox(
          width: assignWidth(context: context, fraction: 0.03),
        ),
        Container(
          width: assignWidth(context: context, fraction: 0.29),
          padding: EdgeInsets.only(top: offset),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _isHeadingVisible
                  ? FlickerTextAnimation(
                      text: 'Heading',
                      textColor: AppColors.primaryColor,
                      fadeInColor: AppColors.primaryColor,
                      fontSize: Sizes.TEXT_SIZE_34,
                      controller: _flickerAnimationController.view,
                    )
                  : Container(),
              SpaceH4(),
              _isSubtitleVisible
                  ? FlickerTextAnimation(
                      text: 'Subtitle',
                      textColor: AppColors.primaryColor,
                      fadeInColor: AppColors.primaryColor,
                      controller: _flickerAnimationController2.view,
                      textStyle: theme.textTheme.bodyText1
                          .copyWith(color: AppColors.bodyText1),
                    )
                  : Container(),
              SpaceH16(),
              AnimatedOpacity(
                opacity:
                    _isContentVisible ? _projectContentAnimation.value : 0.0,
                duration: _contentAnimationController.duration,
                child: Text(
                  StringConst.ABOUT_DEV_TEXT,
                  style: theme.textTheme.bodyText1
                      .copyWith(color: AppColors.bodyText1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
