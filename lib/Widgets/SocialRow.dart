import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Widgets/CircleIconButton.dart';
import 'package:personal_web_test/Helpers/UrlLauncher.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> socialSites = [
      [
        AssetImage('images/github-logo.png'),
        'https://github.com/Renzo-Olivares',
        'Github',
      ],
      [
        AssetImage('images/xda-logo.png'),
        'https://forum.xda-developers.com/member.php?u=3449508',
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
      tapFunction: () => UrlLauncher.launchURL(socialSite[1], socialSite[2]),
    );
  }
}
