import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Widgets/CircleIconButton.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleIconButton(icon: AssetImage('images/github-logo.png')),
        CircleIconButton(icon: AssetImage('images/xda-logo.png')),
        CircleIconButton(icon: AssetImage('images/linkedin-logo.png')),
      ],
    );
  }
}
