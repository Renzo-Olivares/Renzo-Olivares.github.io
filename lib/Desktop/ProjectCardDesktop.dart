import 'package:flutter_web/material.dart';

class ProjectCardDesktop extends StatelessWidget {
  final String title;
  final String info;
  final String image;

  ProjectCardDesktop({Key key, this.info, this.image, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 175.0,
        child: Card(
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 500.0,
                child: Card(
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      image,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Card(
                      elevation: 2.0,
                      child: Column(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, top: 5.0),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 17.0),
                                ),
                              )),
                          Text(info),
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
