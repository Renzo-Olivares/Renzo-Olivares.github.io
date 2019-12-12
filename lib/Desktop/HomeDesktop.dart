import 'package:flutter/material.dart';
import 'package:personal_web_test/Routes/AboutRoute.dart';
import 'package:personal_web_test/Routes/ProjectsRoute.dart';
import 'package:personal_web_test/Routes/ExperienceRoute.dart';
import 'package:personal_web_test/Routes/ResumeRoute.dart';

class HomeDesktop extends StatelessWidget {
  final String brand;

  HomeDesktop({Key key, this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tabList = [
      'About',
      'Projects',
      'Experience',
      'Resume',
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Renzo Olivares (Developer)',
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        accentColor: Colors.blue[500],
      ),
      home: Scaffold(
        body: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Center(
                      child: Text(
                    "Renzo Olivares",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                  )),
                ),
                Spacer(),
                Spacer(),
                SizedBox(
                  width: 450.0,
                  child: TabBar(
                    indicatorColor: Colors.white,
                    tabs: tabList.map(_createTabs).toList(),
                  ),
                )
              ],
            ),
            body: TabBarView(
              children: <Widget>[
                AboutRoute(),
                ProjectsRoute(),
                ExperienceRoute(),
                ResumeRoute(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createTabs(String tabName) {
    return Tab(
      child: Text(
        tabName,
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13.0),
      ),
    );
  }
}
