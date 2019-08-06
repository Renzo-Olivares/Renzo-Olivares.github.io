import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Widgets/InfoCard.dart';
import 'package:personal_web_test/Helpers/ContentStrings.dart';

class ExperienceRoute extends StatelessWidget {
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Experience",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w100,
                    fontSize: 25.0),
              ),
            ),
            Expanded(
              child: ListView(
                children: companies.map(createInfoCards).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createInfoCards(List<dynamic> companies) {
    return InfoCard(
      companyName: companies[0],
      icon: companies[1],
      info: companies[2],
      padding: companies[3],
    );
  }
}
