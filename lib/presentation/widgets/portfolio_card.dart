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
    this.hoverColor = AppColors.primaryColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.actionTitleTextStyle,
    this.duration = 1000,
    this.onTap,
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
  final GestureTapCallback onTap;

  @override
  _PortfolioCardState createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard>
    with TickerProviderStateMixin {
  AnimationController _portfolioCoverController;
  Animation<double> _opacityAnimation;
  final int duration = 400;
  bool _hovering = false;

  @override
  void initState() {
    _portfolioCoverController = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    initTweens();
    ;
    super.initState();
  }

  @override
  void dispose() {
    _portfolioCoverController.dispose();
    super.dispose();
  }

  void initTweens() {
    _opacityAnimation = Tween<double>(
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
    return InkWell(
      onTap: widget.onTap,
      child: Container(
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
                      opacity: _opacityAnimation,
                      child: Container(
                        width: widget.width,
                        height: widget.height,
                        color: widget.hoverColor,
                        child: Column(
                          children: [
                            Spacer(flex: 1),
                            Text(
                              widget.title,
                              textAlign: TextAlign.center,
                              style: widget.titleTextStyle ??
                                  theme.textTheme.headline4.copyWith(
                                    color: AppColors.secondaryColor,
                                  ),
                            ),
                            SpaceH4(),
                            Text(
                              widget.subtitle,
                              style: widget.subtitleTextStyle ??
                                  theme.textTheme.subtitle1.copyWith(
                                    color: AppColors.secondaryColor,
//                                    fontSize: Sizes.TEXT_SIZE_14,
//                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            SpaceH16(),
                            Text(
                              widget.actionTitleTextStyle ?? widget.actionTitle,
                              style: theme.textTheme.headline6
                                  .copyWith(color: AppColors.secondaryColor),
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
