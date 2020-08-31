import 'package:flutter/material.dart';

import '../Components/grid_card.dart';
import '../Helpers/responsive_widget.dart';

final _projects = <_ProjectInfo>[
  const _ProjectInfo(
    darkPreview: 'assets/project_previews/dark/dark_flutter_safety.png',
    lightPreview: 'assets/project_previews/light/light_flutter_safety.png',
    openContainer: _DetailsPage(),
  ),
  const _ProjectInfo(
    darkPreview: 'assets/project_previews/dark/dark_flutter_twitter.png',
    lightPreview: 'assets/project_previews/light/light_flutter_twitter.png',
    openContainer: _DetailsPage(),
  ),
  const _ProjectInfo(
    darkPreview: 'assets/project_previews/dark/dark_flutter_units.png',
    lightPreview: 'assets/project_previews/light/light_flutter_units.png',
    openContainer: _DetailsPage(),
  ),
  const _ProjectInfo(
    darkPreview: 'assets/project_previews/dark/dark_simple_todo.png',
    lightPreview: 'assets/project_previews/light/light_simple_todo.png',
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
          builder: (context) => _ProjectsList(),
        );
      },
    );
  }
}

class _ProjectsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GridView.count(
            crossAxisCount: ResponsiveWidget.isDesktop(context)
                ? 3
                : ResponsiveWidget.isTablet(context) ? 2 : 1,
            padding: EdgeInsetsDirectional.only(
              start: 48,
              end: 48,
              top: 24,
              bottom: 24,
            ),
            crossAxisSpacing: 48,
            mainAxisSpacing: 32,
            children: [
              for (var project in _projects)
                GridCard(
                  darkPreview: project.darkPreview,
                  lightPreview: project.lightPreview,
                  openChild: project.openContainer,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectInfo {
  const _ProjectInfo({
    this.darkPreview,
    this.lightPreview,
    this.openContainer,
  });

  final String darkPreview;
  final String lightPreview;
  final Widget openContainer;
}

class _DetailsPage extends StatelessWidget {
  const _DetailsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
