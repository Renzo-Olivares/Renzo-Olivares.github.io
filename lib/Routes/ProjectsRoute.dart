import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Helpers/ContentStrings.dart';
import 'package:personal_web_test/Widgets/ProjectCard.dart';
import 'package:personal_web_test/Widgets/PageLayout.dart';
import 'package:personal_web_test/Helpers/ResponsiveWidget.dart';
import 'package:personal_web_test/Widgets/DesktopLayout.dart';

class ProjectsRoute extends StatelessWidget {
  final String title = "Projects";
  const ProjectsRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> projects = [
      ['Simple ToDo', 'images/simpleshow.png'],
      ['Flutter Units', 'images/funits.png'],
      ['Flutter Twitter', 'images/ftwitter.png'],
    ];

    return ResponsiveWidget(
      mobileScreen: PageLayout(
        header: title,
        widgetList: projects.map(createProjectWidget).toList(),
      ),
      desktopScreen: DesktopLayout(
        header: title,
        widgetList: projects.map(createProjectWidget).toList(),
      ),
    );
  }

  Widget createProjectWidget(List<dynamic> project) {
    return ProjectCard(
      title: project[0],
      image: project[1],
      info: ContentStrings.placeholder,
    );
  }
}
