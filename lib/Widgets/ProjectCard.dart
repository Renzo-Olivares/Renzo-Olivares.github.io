import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Helpers/ResponsiveWidget.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String stack;
  final String info;
  final String image;

  ProjectCard({Key key, this.stack, this.info, this.image, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: SizedBox(
        height: 315.0,
        child: Card(
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 140.0,
                width: 900.0,
                child: Card(
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      image,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                    elevation: 2.0,
                    child: Column(
                      children: <Widget>[
                        Align(
                            alignment: ResponsiveWidget.isDesktop(context)
                                ? Alignment.center
                                : Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: ResponsiveWidget.isDesktop(context)
                                      ? 0.0
                                      : 10.0,
                                  top: 5.0,
                                  bottom: 5.0),
                              child: Text(
                                title,
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 17.0),
                              ),
                            )),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              stack,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Text(
                              info,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
