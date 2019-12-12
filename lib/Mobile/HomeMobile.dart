import 'package:flutter/material.dart';
import 'package:personal_web_test/Mobile/NavDrawer.dart';
import 'package:personal_web_test/Routes/AboutRoute.dart';
import 'package:personal_web_test/Routes/ProjectsRoute.dart';
import 'package:personal_web_test/Routes/ExperienceRoute.dart';
import 'package:personal_web_test/Routes/ResumeRoute.dart';

class HomeMobile extends StatelessWidget {
  final String brand;

  HomeMobile({Key key, this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Renzo Olivares (Developer)',
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        accentColor: Colors.blue[500],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AboutRoute(),
        '/projects': (context) => ProjectsRoute(),
        '/experience': (context) => ExperienceRoute(),
        '/resume': (context) => ResumeRoute(),
      },
      builder: (context, child) {
        return Scaffold(
          drawer:
              NavDrawer(navigator: (child.key as GlobalKey<NavigatorState>)),
          appBar: AppBar(
            title: Text(
              "Renzo Olivares",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          body: child,
        );
      },
    );
  }
}
