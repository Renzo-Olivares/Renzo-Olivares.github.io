import 'package:flutter_web/material.dart';
import 'package:personal_web_test/HomeMobile.dart';
import 'package:personal_web_test/HomeDesktop.dart';
import 'package:personal_web_test/HomeTablet.dart';
import 'package:personal_web_test/ResponsiveWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'Renzo Olivares';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Renzo Olivares (Developer)',
      home: ResponsiveWidget(
          mobileScreen: HomeMobile(brand: title),
          tabletScreen: HomeTablet(brand: title),
          desktopScreen: HomeDesktop(brand: title)),
    );
  }
}
