import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfoliosite/core/utils/functions.dart';
import 'package:portfoliosite/presentation/pages/contact/contact_page.dart';
import 'package:portfoliosite/presentation/widgets/app_drawer.dart';
import 'package:portfoliosite/presentation/widgets/circular_container.dart';
import 'package:portfoliosite/presentation/widgets/contact_form.dart';
import 'package:portfoliosite/presentation/widgets/contact_info.dart';
import 'package:portfoliosite/presentation/widgets/custom_app_bar.dart';
import 'package:portfoliosite/presentation/widgets/custom_text_form_field.dart';
import 'package:portfoliosite/presentation/widgets/socials.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class ContactPageMobile extends StatefulWidget {
  @override
  _ContactPageMobileState createState() => _ContactPageMobileState();
}

class _ContactPageMobileState extends State<ContactPageMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.deepBlue700,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: StringConst.CONTACT,
          actions: [],
          onLeadingPressed: () {
            if (_scaffoldKey.currentState.isEndDrawerOpen) {
              _scaffoldKey.currentState.openEndDrawer();
            } else {
              _scaffoldKey.currentState.openDrawer();
            }
          },
          onActionsPressed: null,
        ),
      ),
      drawer: AppDrawer(
        menuList: Data.menuList,
        selectedItemRouteName: ContactPage.contactPageRoute,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.PADDING_16,
              vertical: Sizes.PADDING_16,
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    StringConst.GET_IN_TOUCH,
                    style: theme.textTheme.headline6.copyWith(
                      color: AppColors.grey100,
                    ),
                  ),
                ),
                SpaceH16(),
                ContactInfo(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  iconsMainAxisAlignment: MainAxisAlignment.center,
                  iconSize: Sizes.ICON_SIZE_18,
                  iconColor: AppColors.grey100,
                  contactTypeTextStyle: theme.textTheme.headline6.copyWith(
                    color: AppColors.grey100,
                  ),
                  contactTextStyle: theme.textTheme.bodyText1.copyWith(
                    color: AppColors.grey100,
                  ),
                  onTap: () {},
                ),
                SpaceH20(),
                Center(
                  child: Text(
                    StringConst.MESSAGE_ME,
                    style: theme.textTheme.headline5.copyWith(
                      color: AppColors.grey100,
                    ),
                  ),
                ),
                SpaceH16(),
                ContactForm(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.PADDING_16,
                  ),
                ),
                SpaceH30(),
                SendMessageButton(
                  onPressed: () {},
                ),
                SpaceH20(),
                Text(
                  StringConst.CONNECT,
                  style: theme.textTheme.headline6.copyWith(
                    color: AppColors.grey100,
                  ),
                ),
                SpaceH12(),
                _buildSocialButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          alignment: Alignment.centerLeft,
          icon: FontAwesomeIcons.linkedin,
          color: AppColors.grey100,
          onPressed: () {
            Functions.launchUrl(StringConst.LINKED_IN_URL);
          },
        ),
        SocialButton(
          alignment: Alignment.centerLeft,
          icon: FontAwesomeIcons.twitter,
          color: AppColors.grey100,
          onPressed: () {
            Functions.launchUrl(StringConst.TWITTER_URL);
          },
        ),
        SocialButton(
          alignment: Alignment.centerLeft,
          icon: FontAwesomeIcons.instagram,
          color: AppColors.grey100,
          onPressed: () {
            Functions.launchUrl(StringConst.INSTAGRAM_URL);
          },
        ),
        SocialButton(
          alignment: Alignment.centerLeft,
          icon: FontAwesomeIcons.telegram,
          color: AppColors.grey100,
          onPressed: () {
            Functions.launchUrl(StringConst.TELEGRAM_URL);
          },
        ),
      ],
    );
  }
}
