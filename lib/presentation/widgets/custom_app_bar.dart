import 'package:flutter/material.dart';
import 'package:portfoliosite/values/values.dart';

import 'circular_container.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    this.title,
    this.leading,
    this.onLeadingPressed,
    this.actions,
    this.onActionsPressed,
    this.actionIcon,
  });

  final String title;
  final Widget leading;
  final VoidCallback onLeadingPressed;
  final List<Widget> actions;
  final VoidCallback onActionsPressed;
  final Icon actionIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: leading ??
          IconButton(
            padding: const EdgeInsets.only(
              left: Sizes.PADDING_24,
              top: Sizes.PADDING_8,
              bottom: Sizes.PADDING_8,
            ),
            onPressed: onLeadingPressed,
            icon: Icon(Icons.menu),
          ),
      actions: actions ??
          [
            Padding(
              padding: const EdgeInsets.only(
                right: Sizes.PADDING_24,
                top: Sizes.PADDING_8,
                bottom: Sizes.PADDING_8,
              ),
              child: CircularContainer(
                color: AppColors.grey100,
                child: IconButton(
                  padding: const EdgeInsets.all(Sizes.PADDING_0),
                  icon: actionIcon ??
                      Icon(
                        Icons.email,
                        color: AppColors.accentColor2,
                      ),
                  onPressed: onActionsPressed,
                ),
              ),
            )
          ],
    );
  }
}
