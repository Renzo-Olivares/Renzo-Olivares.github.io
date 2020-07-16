import 'package:flutter/material.dart';

import '../Components/GridCard.dart';
import '../Helpers/ResponsiveWidget.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({Key key}) : super(key: key);

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
                  GridCard(
                    openChild: const _DetailsPage(),
                  ),
                  GridCard(
                    openChild: const _DetailsPage(),
                  ),
                  GridCard(
                    openChild: const _DetailsPage(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DetailsPage extends StatelessWidget {
  const _DetailsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
      ),
      body: Center(child: Text('Hello World')),
    );
  }
}
