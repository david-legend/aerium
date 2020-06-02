import 'package:flutter/material.dart';
import 'package:portfoliosite/layout/adaptive.dart';
import 'package:portfoliosite/presentation/routes/router.gr.dart';
import 'package:portfoliosite/presentation/widgets/content_wrapper.dart';
import 'package:portfoliosite/presentation/widgets/menu_list.dart';
import 'package:portfoliosite/values/values.dart';

class WorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        width: assignWidth(context: context, fraction: 0.5),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: Sizes.MARGIN_20,
                            top: Sizes.MARGIN_20,
                            bottom: Sizes.MARGIN_20,
                          ),
                          child: MenuList(
                            menuList: Data.menuList,
                            selectedItemRouteName: Routes.workPage,
                          ),
                        ),
                      ),
                      ContentWrapper(
                        width: assignWidth(context: context, fraction: 0.5),
                        color: AppColors.grey100,
                      )
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: Image.asset(
                ImagePath.DEV,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
