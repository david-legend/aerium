import 'package:flutter/material.dart';
import 'package:portfoliosite/presentation/pages/message/message_page_mobile.dart';
import 'package:portfoliosite/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'message_page_desktop.dart';

class MessagePage extends StatelessWidget {
  static const String messagePageRoute = StringConst.MESSAGE_PAGE;

  const MessagePage({
    Key key,
  }) : super(key: key);

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
