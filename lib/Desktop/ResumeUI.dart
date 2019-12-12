import 'package:flutter/material.dart';

class ResumeUI extends StatelessWidget {
  final String header;
  final List<Widget> widgetList;

  ResumeUI({Key key, this.header, this.widgetList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
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
          Container(
            height: MediaQuery.of(context).size.height - 106,
            width: 600.0,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: widgetList,
            ),
          ),
        ],
      ),
    );
  }
}
