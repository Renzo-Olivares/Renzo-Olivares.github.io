import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Widgets/CircleIconButton.dart';
import 'dart:html' as html;

class SocialRow extends StatelessWidget {
  const SocialRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> socialSites = [
      [
        AssetImage('images/github-logo.png'),
        'renzo.olivares1@gmail.com',
        'Github',
      ],
      [
        AssetImage('images/xda-logo.png'),
        'https://forum.xda-developers.com/search.php?searchid=457061086',
        'XDA-Developers',
      ],
      [
        AssetImage('images/linkedin-logo.png'),
        'https://www.linkedin.com/in/510renzoolivares/',
        'LinkedIn',
      ],
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialSites.map(createSocialButton).toList(),
    );
  }

  Widget createSocialButton(List<dynamic> socialSite) {
    return CircleIconButton(
      icon: socialSite[0],
      tapFunction: () => urlLauncher(socialSite[1], socialSite[2]),
    );
  }

  void urlLauncher(String url, String name) {
    html.window.open(url, name);
  }
}
