import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfoliosite/presentation/widgets/horizontal_bar.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

import 'package:portfoliosite/core/extensions/hover_extensions.dart';

import 'flicker_text_animation.dart';

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

class _MenuItemState extends State<MenuItem> with TickerProviderStateMixin {
  bool _hovering = false;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    super.initState();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showAnimationOnHover() {
    if (_hovering) {
      _playAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
//    timeDilation = 10.0;
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
        child: Container(
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
                    FlickerTextAnimation(
                      text: widget.title,
                      textColor: AppColors.grey200,
                      fadeInColor: AppColors.fadedGrey,
                      controller: _controller.view,
                    ),
//                        Text(widget.title,
//                            style: TextStyle(
//                              color: _animation.value,
//                            )
////                          widget.selected
////                              ? (widget.selectedStyle ?? menuTextStyle)
////                              : (widget.titleStyle ?? menuTextStyle),
//                            ),
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

//  List<Widget> rotatedText(String title, int quarterTurns) {
//    List<Widget> text = [];
//    for (var i = 0; i < title.length; i++) {
//      text.add(
//        RotatedBox(
//          quarterTurns: quarterTurns,
//          child: Text(
//            title[i],
//            style: TextStyle(
//              color: AppColors.grey100,
//            ),
//          ),
//        ),
//      );
//    }
//    return text;
//  }
}
