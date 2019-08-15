import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Helpers/ResponsiveWidget.dart';

class ExperienceUI extends StatelessWidget {
  final String header;
  final List<Widget> widgetList;

  ExperienceUI({Key key, this.header, this.widgetList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Align(
            alignment: ResponsiveWidget.isMobile(context)
                ? Alignment.centerLeft
                : Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 20.0),
              child: Text(
                header,
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 25.0),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: ResponsiveWidget.isMobile(context)
                    ? EdgeInsets.only(top: 50.0)
                    : EdgeInsets.only(top: 100.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widgetList,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
