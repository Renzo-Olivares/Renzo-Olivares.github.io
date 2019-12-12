import 'package:flutter/material.dart';
import 'package:personal_web_test/Widgets/ExperienceCard.dart';
import 'package:personal_web_test/Helpers/ContentStrings.dart';
import 'package:personal_web_test/Widgets/PageLayout.dart';
import 'package:personal_web_test/Helpers/ResponsiveWidget.dart';
import 'package:personal_web_test/Desktop/ExperienceUI.dart';

class ExperienceRoute extends StatelessWidget {
  final String title = "Experience";

  const ExperienceRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<List<dynamic>> companies = [
      [
        "Code for Fun",
        AssetImage('assets/images/codeforfun-logo.png'),
        ContentStrings.ccfInfo,
        false,
      ],
      [
        "KIPP Foundation",
        AssetImage('assets/images/kipp-logo.png'),
        ContentStrings.kfInfo,
        true,
      ],
      [
        "Schoolzilla",
        AssetImage('assets/images/schoolzilla-logo.png'),
        ContentStrings.szInfo,
        true,
      ]
    ];
    return ResponsiveWidget(
      mobileScreen: MediaQuery.of(context).orientation == Orientation.landscape
          ? ExperienceUI(
              header: title,
              widgetList: companies.map(createExperienceCards).toList(),
            )
          : PageLayout(
              header: title,
              widgetList: companies.map(createExperienceCards).toList(),
            ),
      desktopScreen: ExperienceUI(
        header: title,
        widgetList: companies.map(createExperienceCards).toList(),
      ),
    );
  }

  Widget createExperienceCards(List<dynamic> companies) {
    return ExperienceCard(
      companyName: companies[0],
      icon: companies[1],
      info: companies[2],
      padding: companies[3],
    );
  }
}
