import 'package:flutter_web/material.dart';
import 'package:personal_web_test/NavDrawer.dart';
import 'package:personal_web_test/AboutRoute.dart';
import 'package:personal_web_test/ProjectsRoute.dart';
import 'package:personal_web_test/ExperienceRoute.dart';
import 'package:personal_web_test/ResumeRoute.dart';

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
            title: Text("Renzo Olivares"),
          ),
          body: child,
        );
      },
    );
  }
}
