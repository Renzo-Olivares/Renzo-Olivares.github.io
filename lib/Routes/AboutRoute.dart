import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Helpers/ContentStrings.dart';
import 'package:personal_web_test/Widgets/CustomCircleAvatar.dart';
import 'package:personal_web_test/Widgets/SocialRow.dart';
import 'package:personal_web_test/Helpers/ResponsiveWidget.dart';

class AboutRoute extends StatelessWidget {
  const AboutRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
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
                      fontWeight: FontWeight.w400,
                      fontSize: 25.0),
                ),
              ),
              Text(
                "Bay Area, California",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 25.0),
              ),
              Container(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: ResponsiveWidget.isDesktop(context)
                      ? const EdgeInsets.only(left: 380.0)
                      : const EdgeInsets.only(left: 0.0),
                  child: Text(
                    "About:",
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 20.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  ContentStrings.aboutMe,
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 50),
              SocialRow(),
            ],
          ),
        ),
      ),
    );
  }
}
