import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';

import 'package:portfoliosite/core/extensions/hover_extensions.dart';
import 'package:portfoliosite/presentation/widgets/horizontal_bar.dart';
import 'package:portfoliosite/values/values.dart';

class PortfolioCard extends StatefulWidget {
  PortfolioCard({
    this.width = 500,
    this.height = 400,
    this.imageUrl,
    this.elevation,
    this.shadow,
    this.title,
    this.subtitle,
    this.actionTitle,
    this.hoverColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.actionTitleTextStyle,
    this.duration = 1000,
  });

  final double width;
  final double height;
  final String imageUrl;
  final double elevation;
  final Shadow shadow;
  final String title;
  final String subtitle;
  final String actionTitle;
  final Color hoverColor;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final TextStyle actionTitleTextStyle;
  final int duration;

  @override
  _PortfolioCardState createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard>
    with TickerProviderStateMixin {
//  AnimationController _controller;
  AnimationController _portfolioCoverController;
  Animation<double> _opacityAnimation;
  Animation<double> _opacityAnimation2;
  final int duration = 400;
  bool _hovering = false;

  @override
  void initState() {
//    _controller = AnimationController(
//      duration: Duration(milliseconds: widget.duration),
//      vsync: this,
//    );
    _portfolioCoverController = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    initTweens();
//    WidgetsBinding.instance.addPostFrameCallback((_) {
//      _playAnimation();
//    });
    super.initState();
  }

  @override
  void dispose() {
//    _controller.dispose();
    _portfolioCoverController.dispose();
    super.dispose();
  }

  void initTweens() {
//    _opacityAnimation = Tween<double>(
//      begin: 0.0,
//      end: 1.0,
//    ).animate(
//      CurvedAnimation(
//        parent: _controller,
//        curve: Interval(
//          0.0,
//          1.0,
//          curve: Curves.easeIn,
//        ),
//      ),
//    );
    _opacityAnimation2 = Tween<double>(
      begin: 0.0,
      end: 0.8,
    ).animate(
      CurvedAnimation(
        parent: _portfolioCoverController,
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
//      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playPortfolioCoverAnimation() async {
    try {
      await _portfolioCoverController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: widget.width,
      height: widget.height,
      child: MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: Stack(
          children: [
            Image.asset(
              widget.imageUrl,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
            ),
            _hovering
                ? FadeTransition(
                    opacity: _opacityAnimation2,
                    child: Container(
                      width: widget.width,
                      height: widget.height,
                      color: AppColors.deepBlue300,
                      child: Column(
                        children: [
                          Spacer(flex: 1),
                          Text(
                            widget.title,
                            style: widget.titleTextStyle ??
                                theme.textTheme.headline4.copyWith(
                                  color: AppColors.grey200,
                                  letterSpacing: 4,
                                ),
                          ),
                          SpaceH4(),
                          Text(
                            widget.subtitle,
                            style: widget.subtitleTextStyle ??
                                Styles.customTextStyle3(
                                  color: AppColors.grey300,
                                  fontSize: Sizes.TEXT_SIZE_14,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          SpaceH16(),
                          Text(
                            widget.actionTitleTextStyle ?? widget.actionTitle,
                            style: Styles.customTextStyle4(
                              color: Color(0xFFAEB3B7),
                            ),
                          ),
                          SpaceH4(),
                          HorizontalBar(),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ).showCursorOnHover,
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });

    if (_hovering == true) {
      _playPortfolioCoverAnimation();
    } else if (_hovering == false) {
      _portfolioCoverController.reverse().orCancel;
    }
  }
}
