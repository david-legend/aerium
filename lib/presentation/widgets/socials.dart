import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfoliosite/presentation/widgets/horizontal_bar.dart';
import 'package:portfoliosite/values/values.dart';
import 'package:portfoliosite/core/extensions/hover_extensions.dart';
import 'dart:js' as js;

class Socials extends StatelessWidget {
  Socials({
    this.isHorizontal = false,
    this.isVertical = false,
    this.alignment,
    this.color,
    this.crossAxisAlignment,
  }) : assert(isHorizontal == false || isVertical == false,
            'Both isHorizontal and isVertical cannot be true');

  final bool isVertical;
  final bool isHorizontal;
  final Color color;
  final Alignment alignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return isVertical
        ? Container(
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              children: [
                SocialButton(
                  icon: FontAwesomeIcons.github,
                  alignment: alignment,
                  onPressed: () {
                    _launchUrl(StringConst.GITHUB_URL);
                  },
                  color: color,
                ),
                HorizontalBar(
                  width: Sizes.WIDTH_32,
                  margin: EdgeInsets.symmetric(vertical: Sizes.MARGIN_4),
                ),
                SocialButton(
                  icon: FontAwesomeIcons.linkedin,
                  alignment: alignment,
                  onPressed: () {
                    _launchUrl(StringConst.LINKED_IN_URL);
                  },
                  color: color,
                ),
                HorizontalBar(
                  width: Sizes.WIDTH_32,
                  margin: EdgeInsets.symmetric(vertical: Sizes.MARGIN_4),
                ),
                SocialButton(
                  icon: FontAwesomeIcons.twitter,
                  alignment: alignment,
                  onPressed: () {
                    _launchUrl(StringConst.TWITTER_URL);
                  },
                  color: color,
                ),
              ],
            ),
          ).showCursorOnHover
        : IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  icon: FontAwesomeIcons.github,
                  alignment: alignment,
                  onPressed: () {
                    _launchUrl(StringConst.GITHUB_URL);
                  },
                  color: color,
                ),
                VerticalDivider(
                  width: Sizes.WIDTH_8,
                  thickness: 2,
                ),
                SocialButton(
                  icon: FontAwesomeIcons.linkedin,
                  alignment: alignment,
                  onPressed: () {
                    _launchUrl(StringConst.LINKED_IN_URL);
                  },
                  color: color,
                ),
                VerticalDivider(
                  width: Sizes.WIDTH_8,
                  thickness: 2,
                ),
                SocialButton(
                  icon: FontAwesomeIcons.twitter,
                  alignment: alignment,
                  onPressed: () {
                    _launchUrl(StringConst.TWITTER_URL);
                  },
                  color: color,
                ),
              ],
            ),
          ).showCursorOnHover;
  }

  void _launchUrl(String url) {
    js.context.callMethod('openLink', [url, '_blank']);
  }
}

class SocialButton extends StatelessWidget {
  SocialButton({
    this.padding = const EdgeInsets.all(Sizes.PADDING_0),
    this.onPressed,
    this.color = AppColors.deepBlue400,
    this.icon = FontAwesomeIcons.twitter,
    this.iconSize = Sizes.ICON_SIZE_24,
    this.alignment = Alignment.center,
  });

  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final Color color;
  final IconData icon;
  final double iconSize;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padding,
      onPressed: onPressed,
      alignment: alignment,
      icon: Icon(
        icon,
        color: color,
        size: iconSize,
      ),
    );
  }
}
