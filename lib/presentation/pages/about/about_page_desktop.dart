import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/pages/about/about_page.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/flicker_text_animation.dart';
import 'package:portfoliosite/presentation/widgets/menu_list.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/presentation/widgets/sub_menu_item.dart';
import 'package:portfoliosite/presentation/widgets/sub_menu_list.dart';
import 'package:portfoliosite/presentation/widgets/trailing_info.dart';
import 'package:portfoliosite/values/values.dart';

class AboutPageDesktop extends StatefulWidget {
  @override
  _AboutPageDesktopState createState() => _AboutPageDesktopState();
}

class _AboutPageDesktopState extends State<AboutPageDesktop>
    with TickerProviderStateMixin {
  bool animate = false;
  int duration = 800;
  double widthOfImage;
  AnimationController _controller;
  AnimationController _flickerAnimationController;
  AnimationController _flickerAnimationController2;
  AnimationController _aboutDevAnimationController;
  Animation<double> widthOfLeftSide;
  Animation<double> widthOfRightSide;
  Animation<double> widthOfAboutContent;
  Animation<double> heightPositionOfImage;
  Animation<double> widthPositionOfImage;
  Animation<double> aboutDevAnimation;
  Animation<double> scale;
  bool _isAboutContentVisible = false;
  bool _visible = false;
  bool _isSubtitleVisible = false;
  bool _isSubMenuListVisible = false;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
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
    _aboutDevAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    initializeTweens();
    _playAnimation();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isAboutContentVisible = true;
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
          _visible = true;
        });
        WidgetsBinding.instance.addPersistentFrameCallback((_) {
          _playAboutDevAnimation();
        });
      }
    });

    _aboutDevAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isSubMenuListVisible = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _flickerAnimationController.dispose();
    _flickerAnimationController2.dispose();
    _aboutDevAnimationController.dispose();
    super.dispose();
  }

  initializeTweens() {
    widthOfLeftSide = Tween<double>(
      begin: 0.5,
      end: 0.3,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    widthOfRightSide = Tween<double>(
      begin: 0.5,
      end: 0.7,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    widthOfAboutContent = Tween<double>(
      begin: 0.4,
      end: 0.6,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    widthPositionOfImage = Tween<double>(
      begin: 0.5,
      end: 0.3,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    heightPositionOfImage = Tween<double>(
      begin: 0.4,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    scale = Tween<double>(
      begin: 1.5,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    aboutDevAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _aboutDevAnimationController,
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

  Future<void> _playAboutDevAnimation() async {
    try {
      await _aboutDevAnimationController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    double heightOfImage = assignHeight(context: context, fraction: 1);
    widthOfImage = assignWidth(context: context, fraction: 0.4);
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
                      fraction: widthOfLeftSide.value,
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
                        selectedItemRouteName: AboutPage.aboutPageRoute,
                      ),
                    ),
                  ),
                  ContentWrapper(
                    width: assignWidth(
                        context: context, fraction: widthOfRightSide.value),
                    color: AppColors.grey100,
                    child: Row(
                      children: [
                        Container(
                          width: assignWidth(
                              context: context,
                              fraction: widthOfAboutContent.value),
                          child: _isAboutContentVisible
                              ? aboutPageContent()
                              : Container(),
                        ),
                        SizedBox(
                          width: assignWidth(
                            context: context,
                            fraction: 0.05,
                          ),
                        ),
                        TrailingInfo(
                          width: assignWidth(context: context, fraction: 0.05),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(
            assignWidth(
                    context: context, fraction: widthPositionOfImage.value) -
                widthOfImage / 2,
            assignHeight(
                context: context, fraction: heightPositionOfImage.value),
          ),
          child: Transform.scale(
            scale: scale.value,
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
          builder: _buildAnimation,
          animation: _controller.view,
        ),
      ),
    );
  }

  Widget aboutPageContent() {
    ThemeData theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.only(
        left: (widthOfImage / 2) + 20,
        top: assignHeight(context: context, fraction: 0.12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlickerTextAnimation(
            text: 'Heading',
            textColor: AppColors.primaryColor,
            fadeInColor: AppColors.primaryColor,
            fontSize: Sizes.TEXT_SIZE_34,
            controller: _flickerAnimationController.view,
          ),
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
            opacity: _visible ? aboutDevAnimation.value : 0.0,
            duration: _aboutDevAnimationController.duration,
            child: Text(
              StringConst.ABOUT_DEV_TEXT,
              style: theme.textTheme.bodyText1
                  .copyWith(color: AppColors.bodyText1),
            ),
          ),
          SpaceH40(),
          _isSubMenuListVisible
              ? SubMenuList(
                  subMenuData: Data.subMenuData,
                  width: assignWidth(
                      context: context,
                      fraction: 0.6,
                      subs: (widthOfImage / 2) + 20),
                )
              : Container(),
        ],
      ),
    );
  }
}
