import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Widgets/PageLayout.dart';

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
        )
      ],
    );
  }
}
