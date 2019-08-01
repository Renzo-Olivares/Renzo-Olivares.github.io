import 'package:flutter_web/material.dart';
import 'package:personal_web_test/HomeMobile.dart';
import 'package:personal_web_test/HomeDesktop.dart';
import 'package:personal_web_test/HomeTablet.dart';
import 'package:personal_web_test/ResponsiveWidget.dart';

void main() => runApp(MyApp());

 class MyApp extends StatelessWidget {
   static Map<int, Color> color = {
     50:Color.fromRGBO(12, 128, 167, .1),
     100:Color.fromRGBO(12, 128, 167, .2),
     200:Color.fromRGBO(12, 128, 167, .3),
     300:Color.fromRGBO(12, 128, 167, .4),
     400:Color.fromRGBO(12, 128, 167, .5),
     500:Color.fromRGBO(12, 128, 167, .6),
     600:Color.fromRGBO(12, 128, 167, .7),
     700:Color.fromRGBO(12, 128, 167, .8),
     800:Color.fromRGBO(12, 128, 167, .9),
     900:Color.fromRGBO(12, 128, 167, 1),
   };

   MaterialColor customColor = MaterialColor(0xFF0C80A7, color);

   final title = 'Renzo Olivares';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Renzo Olivares (Developer)',
      theme: ThemeData(
        primaryColor: customColor,
        accentColor: Colors.blueAccent,
      ),
      home: ResponsiveWidget(HomeMobile(title), HomeTablet(title), HomeDesktop(title)),
    );
  }
}