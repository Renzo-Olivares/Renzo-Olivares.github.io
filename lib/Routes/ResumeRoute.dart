import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Widgets/PageLayout.dart';
import 'package:personal_web_test/Widgets/CircleIconButton.dart';
import 'package:personal_web_test/Helpers/UrlLauncher.dart';

class ResumeRoute extends StatelessWidget {
  final String title = "Resume";
  const ResumeRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      header: title,
      widgetList: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Card(
            child: Image.asset('images/resume.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: CircleIconButton(
            altIcon: Icons.file_download,
            tapFunction: () => {UrlLauncher.launchURL('test', 'Resume')},
          ),
        )
      ],
    );
  }
}
