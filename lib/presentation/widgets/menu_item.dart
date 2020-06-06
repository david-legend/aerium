import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/widgets/horizontal_bar.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

import 'package:portfoliosite/core/extensions/hover_extensions.dart';

class MenuItem extends StatefulWidget {
  MenuItem({
    @required this.title,
    this.titleStyle,
    this.onTap,
    this.selectedStyle,
    this.isMobile = false,
    this.selected = false,
  });

  final String title;
  final TextStyle titleStyle;
  final TextStyle selectedStyle;
  final bool selected;
  final bool isMobile;
  final GestureTapCallback onTap;

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem>
    with SingleTickerProviderStateMixin {
  bool _hovering = false;
  Animation<Color> _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    final CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _animation = ColorTween(begin: AppColors.grey200, end: Color(0xFF7B8186))
        .animate(curve);

    _animation.addListener(_showAnimationOnHover);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showAnimationOnHover() {
    if (_hovering) {
      _controller.forward();
      _animation.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.reverse();
        }
//      setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    TextStyle menuTextStyle = theme.textTheme.bodyText1.copyWith(
      color: widget.isMobile ? AppColors.grey200 : AppColors.grey100,
      fontSize: Sizes.TEXT_SIZE_16,
    );

    TextStyle selectedMenuTextStyle = theme.textTheme.bodyText1.copyWith(
      color: widget.isMobile ? AppColors.deepBlue300 : Colors.red,
      fontSize: Sizes.TEXT_SIZE_18,
    );

    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget child) {
            return Container(
              child: !widget.isMobile
                  ? Row(
                      children: [
                        widget.selected
                            ? Container(
                                width: 2,
                                height: 18,
                                color: AppColors.grey,
                              )
                            : Container(),
                        widget.selected ? SpaceW12() : Container(),
                        Text(widget.title,
                            style: TextStyle(
                              color: _animation.value,
                            )
//                          widget.selected
//                              ? (widget.selectedStyle ?? menuTextStyle)
//                              : (widget.titleStyle ?? menuTextStyle),
                            ),
                      ],
                    )
                  : //This menuList shows only on mobile
                  Column(
                      children: [
                        Text(
                          widget.title,
                          style: widget.selected
                              ? (widget.selectedStyle ?? selectedMenuTextStyle)
                              : (widget.titleStyle ?? menuTextStyle),
                        ),
                        widget.selected ? SpaceH8() : Container(),
                        widget.selected
                            ? HorizontalBar(
                                color: AppColors.deepBlue300,
                              )
                            : Container(),
                      ],
                    ),
            );
          },
        ),
      ),
    ).showCursorOnHover;
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
    _showAnimationOnHover();
  }
}
