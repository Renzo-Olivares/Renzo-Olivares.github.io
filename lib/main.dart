import 'package:flutter/material.dart';
import 'package:personal_web_test/Mobile/HomeMobile.dart';
import 'package:personal_web_test/Desktop/HomeDesktop.dart';
import 'package:personal_web_test/Helpers/ResponsiveWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'Renzo Olivares';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveWidget(
          mobileScreen: HomeMobile(brand: title),
          desktopScreen: HomeDesktop(brand: title)),
    );
  }
}
