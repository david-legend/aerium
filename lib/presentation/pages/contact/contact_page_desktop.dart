import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/core/utils/functions.dart';
import 'package:portfoliosite/presentation/pages/contact/contact_page.dart';
import 'package:portfoliosite/presentation/widgets/contact_form.dart';
import 'package:portfoliosite/presentation/widgets/contact_info.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/menu_list.dart';
import 'package:portfoliosite/presentation/widgets/socials.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/presentation/widgets/trailing_info.dart';
import 'package:portfoliosite/values/values.dart';

class ContactPageDesktop extends StatefulWidget {
  @override
  _ContactPageDesktopState createState() => _ContactPageDesktopState();
}

class _ContactPageDesktopState extends State<ContactPageDesktop> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ContentWrapper(
                        width: assignWidth(context: context, fraction: 0.20),
                        gradient: Gradients.primaryGradient,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: Sizes.MARGIN_20,
                            top: Sizes.MARGIN_20,
                            bottom: Sizes.MARGIN_20,
                          ),
                          child: MenuList(
                            menuList: Data.menuList,
                            selectedItemRouteName: ContactPage.contactPageRoute,
                          ),
                        ),
                      ),
                      ContentWrapper(
                        width: assignWidth(context: context, fraction: 0.8),
                        color: AppColors.grey100,
                        child: Row(
                          children: [
                            SizedBox(
                              width: assignWidth(
                                context: context,
                                fraction: 0.025,
                              ),
                            ),
                            Container(
                              width:
                                  assignWidth(context: context, fraction: 0.4),
                              child: contactInfo(),
                            ),
                            SizedBox(
                              width: assignWidth(
                                context: context,
                                fraction: 0.025,
                              ),
                            ),
                            TrailingInfo(
                              width: assignWidth(
                                context: context,
                                fraction: 0.35,
                              ),
                              crossAxisAlignment: CrossAxisAlignment.center,
                              color: AppColors.deepBlue700,
                              leadingWidget: Text(
                                StringConst.MESSAGE_ME,
                                style: theme.textTheme.headline4.copyWith(
                                  color: AppColors.grey100,
                                ),
                              ),
                              middleWidget: ContactForm(
                                maxLines: 15,
                                padding: EdgeInsets.only(
                                  left: assignWidth(
                                    context: context,
                                    fraction: 0.025,
                                  ),
                                ),
                              ),
                              trailingWidget: SendMessageButton(
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contactInfo() {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: Sizes.PADDING_60,
        bottom: Sizes.PADDING_20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConst.GET_IN_TOUCH,
            style: theme.textTheme.headline4.copyWith(),
          ),
          SpaceH20(),
          ContactInfo(
            onTap: () {},
          ),
          SpaceH16(),
          Text(
            StringConst.SOCIALS,
            style: theme.textTheme.headline6,
          ),
          SpaceH4(),
          Row(
            children: [
              SocialButton(
                alignment: Alignment.centerLeft,
                icon: FontAwesomeIcons.linkedin,
                color: AppColors.deepBlue800,
                onPressed: () {
                  Functions.launchUrl(StringConst.LINKED_IN_URL);
                },
              ),
              SocialButton(
                alignment: Alignment.centerLeft,
                icon: FontAwesomeIcons.twitter,
                color: AppColors.deepBlue800,
                onPressed: () {
                  Functions.launchUrl(StringConst.TWITTER_URL);
                },
              ),
              SocialButton(
                alignment: Alignment.centerLeft,
                icon: FontAwesomeIcons.instagram,
                color: AppColors.deepBlue800,
                onPressed: () {
                  Functions.launchUrl(StringConst.INSTAGRAM_URL);
                },
              ),
              SocialButton(
                alignment: Alignment.centerLeft,
                icon: FontAwesomeIcons.telegram,
                color: AppColors.deepBlue800,
                onPressed: () {
                  Functions.launchUrl(StringConst.TELEGRAM_URL);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
