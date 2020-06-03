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

  @override
  _PortfolioCardState createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  bool _hovering = false;

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
                ? AnimatedOpacity(
                    opacity: _hovering ? 0.7 : 0.0,
                    duration: Duration(milliseconds: 3000),
                    child: Container(
                      width: widget.width,
                      height: widget.height,
                      color: AppColors.deepBlue,
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
  }
}
