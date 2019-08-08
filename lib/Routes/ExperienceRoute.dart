import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Widgets/ExperienceCard.dart';
import 'package:personal_web_test/Helpers/ContentStrings.dart';
import 'package:personal_web_test/Widgets/PageLayout.dart';

class ExperienceRoute extends StatelessWidget {
  final String title = "Experience";

  const ExperienceRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> companies = [
      [
        "Code for Fun",
        AssetImage('images/codeforfun-logo.png'),
        ContentStrings.placeholder,
        false,
      ],
      [
        "KIPP Foundation",
        AssetImage('images/kipp-logo.png'),
        ContentStrings.placeholder,
        true,
      ],
      [
        "Schoolzilla",
        AssetImage('images/schoolzilla-logo.png'),
        ContentStrings.placeholder,
        true,
      ]
    ];
    return PageLayout(
      header: title,
      widgetList: companies.map(createExperienceCards).toList(),
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
