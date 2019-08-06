import 'package:flutter_web/material.dart';

class InfoCard extends StatelessWidget {
  ImageProvider icon;
  String companyName;
  String info;
  bool padding;

  InfoCard({Key key, this.icon, this.companyName, this.info, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Theme.of(context).accentColor,
      child: Row(
        children: <Widget>[
          Card(
            elevation: 2.0,
            child: Padding(
              padding: padding? const EdgeInsets.all(2.0): const EdgeInsets.all(0.0),
              child: ImageIcon(icon, size: 96.0),
            ),
          ),
          Card(
            elevation: 2.0,
            child: Text(info),
          ),
        ],
      ),
    );
  }
}
