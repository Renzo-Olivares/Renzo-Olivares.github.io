import 'package:flutter/material.dart';
import 'package:personal_web_test/Widgets/PageLayout.dart';
import 'package:personal_web_test/Widgets/CircleIconButton.dart';
import 'package:personal_web_test/Helpers/UrlLauncher.dart';
import 'package:personal_web_test/Desktop/ResumeUI.dart';
import 'package:personal_web_test/Helpers/ResponsiveWidget.dart';

class ResumeRoute extends StatelessWidget {
  final String title = "Resume";
  const ResumeRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetList = [
      Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          child: Image.asset('resume.jpg'),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
        child: CircleIconButton(
          altIcon: Icons.file_download,
          size: 28.0,
          tapFunction: () => {
            UrlLauncher.launchURL(
                'https://github.com/Renzo-Olivares/Renzo-Olivares.github.io/raw/site_source/web/assets/documents/Renzo-Olivares_Tech_Resume.pdf',
                'Resume')
          },
        ),
      ),
    ];
    return ResponsiveWidget(
      mobileScreen: PageLayout(
        header: title,
        widgetList: _widgetList,
      ),
      desktopScreen: ResumeUI(
        header: title,
        widgetList: _widgetList,
      ),
    );
  }
}
