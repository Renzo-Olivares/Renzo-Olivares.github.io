import 'package:flutter_web/material.dart';
import 'package:personal_web_test/ContentStrings.dart';

class AboutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2), blurRadius: 5.0)
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4.0,
                    color: Colors.blue[500],
                  ),
                ),
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(
                      "https://drive.google.com/uc?id=1Sny9mEihMEIzlhHQMWCzV4hO3dpQ5tkT"),
                ),
              ),
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
            "Beginnings:",
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w200,
                fontSize: 19.0),
          ),
          Text(ContentStrings.aboutBeg,
              style: TextStyle(fontWeight: FontWeight.w400)),
          Text(
            "Open Source:",
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w200,
                fontSize: 19.0),
          ),
          Text(ContentStrings.aboutMid,
              style: TextStyle(fontWeight: FontWeight.w400)),
          Text("Now: ",
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w200,
                  fontSize: 19.0)),
          Text(ContentStrings.aboutEnd,
              style: TextStyle(fontWeight: FontWeight.w400))
        ],
      ),
    );
  }
}
