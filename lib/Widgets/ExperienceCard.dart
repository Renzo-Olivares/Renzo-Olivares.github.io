import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Helpers/ResponsiveWidget.dart';

class ExperienceCard extends StatelessWidget {
  final ImageProvider icon;
  final String companyName;
  final String info;
  final bool padding;

  ExperienceCard({
    Key key,
    this.icon,
    this.companyName,
    this.info,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveWidget.isDesktop(context)
          ? const EdgeInsets.symmetric(horizontal: 10.0)
          : const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        width: ResponsiveWidget.isDesktop(context) ? 250.0 : 500.0,
        child: Card(
          elevation: 4.0,
          color: Theme.of(context).accentColor,
          child: Row(
            children: <Widget>[
              Card(
                elevation: 2.0,
                child: Padding(
                  padding: padding
                      ? const EdgeInsets.all(2.0)
                      : const EdgeInsets.all(0.0),
                  child: ImageIcon(icon, size: 96.0),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 2.0,
                  child: Text(info),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
