import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/pages/message/message_page_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'message_page_desktop.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: MessagePageMobile(),
        tablet: MessagePageDesktop(),
        desktop: MessagePageDesktop(),
      ),
    );
  }
}
