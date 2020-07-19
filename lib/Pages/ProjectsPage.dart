import 'package:flutter/material.dart';

import '../Components/GridCard.dart';
import '../Helpers/ResponsiveWidget.dart';

final _projects = <_ProjectInfo>[
  const _ProjectInfo(
    darkPreview: 'assets/project_previews/dark_flutter_safety.png',
    lightPreview: 'assets/project_previews/light_flutter_safety.png',
    openContainer: _DetailsPage(),
  ),
  const _ProjectInfo(
    darkPreview: 'assets/project_previews/dark_flutter_twitter.png',
    lightPreview: 'assets/project_previews/light_flutter_twitter.png',
    openContainer: _DetailsPage(),
  ),
  const _ProjectInfo(
    darkPreview: 'assets/project_previews/dark_flutter_units.png',
    lightPreview: 'assets/project_previews/light_flutter_units.png',
    openContainer: _DetailsPage(),
  ),
  const _ProjectInfo(
    darkPreview: 'assets/project_previews/dark_simple_todo.png',
    lightPreview: 'assets/project_previews/light_simple_todo.png',
    openContainer: _DetailsPage(),
  ),
];

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          builder: (context) => Scaffold(
            body: Center(
              child: GridView.count(
                crossAxisCount: ResponsiveWidget.isDesktop(context)
                    ? 3
                    : ResponsiveWidget.isTablet(context) ? 2 : 1,
                padding: EdgeInsets.all(50),
                crossAxisSpacing: 50,
                mainAxisSpacing: 30,
                children: [
                  for (var project in _projects)
                    GridCard(
                      darkPreview: project.darkPreview,
                      lightPreview: project.lightPreview,
                      openChild: project.openContainer,
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ProjectInfo {
  const _ProjectInfo({this.darkPreview, this.lightPreview, this.openContainer});

  final String darkPreview;
  final String lightPreview;
  final Widget openContainer;
}

class _DetailsPage extends StatelessWidget {
  const _DetailsPage();

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),
        backgroundColor: Theme.of(context).bottomAppBarColor,
      ),
      body: Center(child: Text('Hello World')),
    );
  }
}
