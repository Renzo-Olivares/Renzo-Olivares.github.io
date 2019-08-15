import 'package:flutter_web/material.dart';

class PageLayout extends StatelessWidget {
  final String header;
  final List<Widget> widgetList;

  PageLayout({Key key, this.header, this.widgetList}) : super(key: key);

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
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: widgetList,
              ),
            )
          ],
        ),
      ),
    );
  }
}
