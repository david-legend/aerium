import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';
import 'dart:js' as js;

class ContactInfo extends StatelessWidget {
  ContactInfo({
    this.contactType = StringConst.EMAIL,
    this.contact = StringConst.DEV_EMAIL,
    this.contactTypeTextStyle,
    this.contactTextStyle,
    this.iconData = Icons.mail_outline,
    this.iconSize,
    this.iconColor = AppColors.deepBlue800,
    this.onTap,
  });

  final String contactType;
  final String contact;
  final TextStyle contactTypeTextStyle;
  final TextStyle contactTextStyle;
  final IconData iconData;
  final Color iconColor;
  final double iconSize;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contactType,
            style: contactTypeTextStyle ?? theme.textTheme.headline6.copyWith(),
          ),
          SpaceH4(),
          InkWell(
            onTap: onTap ??
                () {
                  _launchUrl(contact);
                },
            child: Row(
              children: [
                Icon(
                  iconData,
                  color: iconColor,
                ),
                SpaceW4(),
                Text(
                  contact,
                  style:
                      contactTextStyle ?? theme.textTheme.bodyText1.copyWith(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchUrl(String url) {
    js.context.callMethod('openLink', [url, '_blank']);
  }
}
