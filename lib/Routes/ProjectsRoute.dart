import 'package:flutter_web/material.dart';

class ProjectsRoute extends StatelessWidget {
  const ProjectsRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          children: <Widget>[
            Text(
              "Projects",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w100,
                  fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
