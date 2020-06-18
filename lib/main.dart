import 'package:flutter/material.dart';
import 'package:portfoliosite/app_theme.dart';
import 'package:portfoliosite/presentation/pages/home/home_page.dart';
import 'package:portfoliosite/presentation/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Site',
      theme: AppTheme.lightThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.homePageRoute,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}

//import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
//import 'package:flutter/material.dart';
//
//void main() => runApp(MaterialApp(home: Example()));
//
//class Example extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
////      theme: FlutterDark.dark(ThemeData.dark()),
//      home: DefaultBottomBarController(
//        child: Page(),
//      ),
//    );
//  }
//}
//
//class Page extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Theme.of(context).canvasColor,
//
//      //Set to true for bottom appbar overlap body content
//      extendBody: true,
//
//      appBar: AppBar(
//        title: Text("Panel Showcase"),
//        backgroundColor: Theme.of(context).bottomAppBarColor,
//      ),
//
//      // Lets use docked FAB for handling state of sheet
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      floatingActionButton: GestureDetector(
//        // Set onVerticalDrag event to drag handlers of controller for swipe effect
//        onVerticalDragUpdate: DefaultBottomBarController.of(context).onDrag,
//        onVerticalDragEnd: DefaultBottomBarController.of(context).onDragEnd,
//        child: FloatingActionButton.extended(
//          label: Text("Pull up"),
//          elevation: 2,
//          backgroundColor: Colors.deepOrange,
//          foregroundColor: Colors.white,
//
//          //Set onPressed event to swap state of bottom bar
//          onPressed: () => DefaultBottomBarController.of(context).swap(),
//        ),
//      ),
//
//      // Actual expandable bottom bar
//      bottomNavigationBar: BottomExpandableAppBar(
//        expandedHeight: 550,
//        horizontalMargin: 16,
//        shape: AutomaticNotchedShape(
//            RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
//        expandedBackColor: Theme.of(context).backgroundColor,
//        expandedBody: Center(
//          child: Text("Hello world!"),
//        ),
//        bottomAppBarBody: Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Row(
//            mainAxisSize: MainAxisSize.max,
//            children: <Widget>[
//              Expanded(
//                child: Text(
//                  "Tets",
//                  textAlign: TextAlign.center,
//                ),
//              ),
//              Spacer(
//                flex: 2,
//              ),
//              Expanded(
//                child: Text(
//                  "Stet",
//                  textAlign: TextAlign.center,
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
