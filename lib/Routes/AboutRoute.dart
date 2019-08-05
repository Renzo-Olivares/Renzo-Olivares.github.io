import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Helpers/ContentStrings.dart';
import 'package:personal_web_test/Widgets/CustomCircleAvatar.dart';

class AboutRoute extends StatelessWidget {
  AboutRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: CustomCircleAvatar(size: 80.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                "Renzo Olivares",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 25.0),
              ),
            ),
            Text(
              "Bay Area, California",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w100,
                  fontSize: 25.0),
            ),
            Container(height: 25),
            Text(
              "About:",
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w200,
                  fontSize: 20.0),
            ),
            Text(ContentStrings.placeholder,
                style: TextStyle(fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}
