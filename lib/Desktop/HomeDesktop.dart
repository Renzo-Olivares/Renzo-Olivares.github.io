import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Routes/AboutRoute.dart';
import 'package:personal_web_test/Routes/ProjectsRoute.dart';
import 'package:personal_web_test/Routes/ExperienceRoute.dart';
import 'package:personal_web_test/Routes/ResumeRoute.dart';

class HomeDesktop extends StatelessWidget {
  final String brand;

  HomeDesktop({Key key, this.brand}) : super(key: key);

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
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Renzo Olivares",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              actions: <Widget>[
                Text(
                  "Renzo Olivares",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Expanded(
                  child: TabBar(
                    tabs: <Widget>[
                      Text('tab1'),
                      Text('tab2'),
                      Text('tab3'),
                    ],
                  ),
                )
              ],
            ),
            body: child,
          ),
        );
      },
    );
  }
}
