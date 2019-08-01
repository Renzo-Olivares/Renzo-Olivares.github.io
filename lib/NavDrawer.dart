import 'package:flutter_web/material.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          "https://drive.google.com/uc?id=1Sny9mEihMEIzlhHQMWCzV4hO3dpQ5tkT"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23.0),
                  child: Center(
                      child: Text(
                    'Renzo Olivares',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                Center(
                    child: Text(
                  'Computer Science Student',
                  style: TextStyle(color: Colors.white),
                )),
              ],
            ),
          ),
          Flexible(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("About"),
                  ),
                  ListTile(
                    leading: Icon(Icons.developer_mode),
                    title: Text("Projects"),
                  ),
                  ListTile(
                    leading: Icon(Icons.description),
                    title: Text("Resume"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
