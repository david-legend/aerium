import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class ExperienceColumn extends StatelessWidget {
  ExperienceColumn({
    @required this.duration,
    @required this.position,
    @required this.company,
    @required this.location,
    @required this.role,
    this.companyUrl,
    this.roleTextStyle,
    this.companyTextStyle,
    this.locationTextStyle,
    this.durationTextStyle,
    this.positionTextStyle,
    this.onTap,
  });

  final String duration;
  final String position;
  final String company;
  final String companyUrl;
  final String location;
  final String role;
  final GestureTapCallback onTap;
  final TextStyle roleTextStyle;
  final TextStyle locationTextStyle;
  final TextStyle companyTextStyle;
  final TextStyle positionTextStyle;
  final TextStyle durationTextStyle;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            duration,
            style: durationTextStyle ??
                theme.textTheme.subtitle1
                    .copyWith(fontSize: Sizes.TEXT_SIZE_18),
          ),
          SpaceH8(),
          Text(
            position,
            style: positionTextStyle ?? theme.textTheme.subtitle2.copyWith(),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.only(
                right: Sizes.PADDING_8,
                top: Sizes.PADDING_8,
                bottom: Sizes.PADDING_8,
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Text(
                      company,
                      style: companyTextStyle ??
                          theme.textTheme.subtitle2.copyWith(),
                    ),
                    VerticalDivider(
                      thickness: 3,
                    ),
                    Text(
                      location,
                      style: locationTextStyle ??
                          theme.textTheme.subtitle2.copyWith(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SpaceH16(),
          Text(
            role,
            style: roleTextStyle ?? theme.textTheme.bodyText2.copyWith(),
          ),
        ],
      ),
    );
  }
}
