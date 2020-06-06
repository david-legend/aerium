import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/widgets/circular_container.dart';
import 'package:portfoliosite/presentation/widgets/custom_text_form_field.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class MessagePageMobile extends StatefulWidget {
  @override
  _MessagePageMobileState createState() => _MessagePageMobileState();
}

class _MessagePageMobileState extends State<MessagePageMobile> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.deepBlue700,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.PADDING_16,
              vertical: Sizes.PADDING_16,
            ),
            child: Row(
              children: [
                Text(
                  StringConst.MESSAGE_ME,
                  style: theme.textTheme.headline5.copyWith(
                    color: AppColors.grey100,
                  ),
                ),
                Spacer(flex: 1),
                CircularContainer(
                  child: Icon(
                    Icons.close,
                    color: AppColors.deepBlue300,
                  ),
                )
              ],
            ),
          ),
          SpaceH16(),
          _buildForm(),
        ],
      ),
    );
  }

  Widget _buildForm() {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_16,
//        vertical: Sizes.PADDING_16,
      ),
      child: Column(
        children: [
          CustomTextFormField(
            filled: true,
            fillColor: AppColors.grey100,
            hintText: StringConst.NAME_HINT_TEXT,
          ),
          SpaceH16(),
          CustomTextFormField(
            filled: true,
            fillColor: AppColors.grey100,
            hintText: StringConst.PHONE_HINT_TEXT,
          ),
          SpaceH16(),
          CustomTextFormField(
            filled: true,
            fillColor: AppColors.grey100,
            hintText: StringConst.EMAIL_HINT_TEXT,
          ),
          SpaceH16(),
          CustomTextFormField(
            filled: true,
            fillColor: AppColors.grey100,
            hintText: StringConst.MESSAGE_HINT_TEXT,
            maxLines: 12,
          ),
          SpaceH40(),
          FlatButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringConst.SEND_MESSAGE,
                    style: theme.textTheme.headline6
                        .copyWith(color: AppColors.grey100),
                  ),
                  SpaceW12(),
                  CircularContainer(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.deepBlue300,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
