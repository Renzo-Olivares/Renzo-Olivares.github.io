import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Helpers/ResponsiveWidget.dart';

class ProjectCardDesktop extends StatelessWidget {
  final String title;
  final String stack;
  final String info;
  final String image;
  final VoidCallback tapFunction;

  ProjectCardDesktop(
      {Key key,
      this.info,
      this.image,
      this.stack,
      this.title,
      this.tapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: ResponsiveWidget.isMobile(context) ? 300.0 : 210.0,
        child: Card(
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          child: Row(
            children: <Widget>[
              SizedBox(
                height: ResponsiveWidget.isMobile(context) ? 300.0 : 210.0,
                width: 400.0,
                child: Card(
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: tapFunction,
                      child: Image.asset(
                        image,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.5),
                  child: Card(
                      elevation: 2.0,
                      child: Column(
                        children: <Widget>[
                          Align(
                              alignment: ResponsiveWidget.isMobile(context)
                                  ? Alignment.centerLeft
                                  : Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: ResponsiveWidget.isMobile(context)
                                        ? 10.0
                                        : 0.0,
                                    top: 5.0,
                                    bottom: 5.0),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17.0),
                                ),
                              )),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(stack, textAlign: TextAlign.justify),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 7.0),
                              child: Text(
                                info,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
