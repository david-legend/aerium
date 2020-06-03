import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/widgets/circular_container.dart';
import 'package:portfoliosite/presentation/widgets/custom_text_form_field.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class MessagePageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.deepBlue100,
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
                    color: AppColors.deepBlue,
                  ),
                )
              ],
            ),
          ),
          _buildForm(),
        ],
      ),
    );
  }

  Widget _buildForm() {
    Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_16,
//        vertical: Sizes.PADDING_16,
      ),
      child: Column(
        children: [
          CustomTextFormField(
            filled: true,
            fillColor: AppColors.grey100,
          ),
          SpaceH8(),
          CustomTextFormField(
            filled: true,
            fillColor: AppColors.grey100,
          ),
          SpaceH8(),
          CustomTextFormField(
            filled: true,
            fillColor: AppColors.grey100,
          ),
          SpaceH8(),
          CustomTextFormField(
            filled: true,
            fillColor: AppColors.grey100,
          ),
        ],
      ),
    );
  }
}
