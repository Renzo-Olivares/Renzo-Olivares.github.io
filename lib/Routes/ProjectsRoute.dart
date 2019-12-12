import 'package:flutter/material.dart';
import 'package:personal_web_test/Helpers/ContentStrings.dart';
import 'package:personal_web_test/Widgets/ProjectCard.dart';
import 'package:personal_web_test/Desktop/ProjectCardDesktop.dart';
import 'package:personal_web_test/Desktop/ProjectsUI.dart';
import 'package:personal_web_test/Widgets/PageLayout.dart';
import 'package:personal_web_test/Helpers/ResponsiveWidget.dart';
import 'package:personal_web_test/Helpers/UrlLauncher.dart';

class ProjectsRoute extends StatelessWidget {
  final String title = "Projects";
  const ProjectsRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> projects = [
      [
        'Simple ToDo',
        'assets/images/simpleshow.png',
        ContentStrings.stodoTechStack,
        ContentStrings.stodoInfo,
        'https://github.com/Renzo-Olivares/SimpleToDo',
      ],
      [
        'Flutter Units',
        'assets/images/funits.png',
        ContentStrings.flutterUnitsTechStack,
        ContentStrings.flutterUnitsInfo,
        'https://github.com/Renzo-Olivares/Units_Flutter',
      ],
      [
        'Flutter Twitter',
        'assets/images/ftwitter.png',
        ContentStrings.flutterTwitterTechStack,
        ContentStrings.flutterTwitterInfo,
        'https://github.com/Renzo-Olivares/Twitter_App',
      ],
    ];

    return ResponsiveWidget(
      mobileScreen: PageLayout(
        header: title,
        widgetList: MediaQuery.of(context).orientation == Orientation.landscape
            ? projects.map(createProjectWidgetLand).toList()
            : projects.map(createProjectWidget).toList(),
      ),
      desktopScreen: ProjectsUI(
        header: title,
        widgetList: projects.map(createProjectWidget).toList(),
      ),
    );
  }

  Widget createProjectWidget(List<dynamic> project) {
    return ResponsiveWidget(
      mobileScreen: ProjectCard(
        title: project[0],
        image: project[1],
        stack: project[2],
        info: project[3],
        tapFunction: () => UrlLauncher.launchURL(project[4], project[0]),
      ),
      desktopScreen: ProjectCardDesktop(
        title: project[0],
        image: project[1],
        stack: project[2],
        info: project[3],
        tapFunction: () => UrlLauncher.launchURL(project[4], project[0]),
      ),
    );
  }

  Widget createProjectWidgetLand(List<dynamic> project) {
    return ProjectCardDesktop(
      title: project[0],
      image: project[1],
      stack: project[2],
      info: project[3],
      tapFunction: () => UrlLauncher.launchURL(project[4], project[0]),
    );
  }
}
