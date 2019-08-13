import 'package:flutter_web/material.dart';

class DesktopLayout extends StatelessWidget {
  final String header;
  final List<Widget> widgetList;

  DesktopLayout({Key key, this.header, this.widgetList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  header,
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 25.0),
                ),
              ),
            ),
            Padding(
              padding: header == 'Experience'
                  ? EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 5, bottom: 10.0)
                  : EdgeInsets.all(0.0),
              child: SizedBox(
                height: 500.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: widgetList,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
