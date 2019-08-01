import 'package:flutter_web/material.dart';

class NavDrawer extends StatelessWidget{
  NavDrawer({Key key}) : super(key:key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://drive.google.com/uc?id=1Sny9mEihMEIzlhHQMWCzV4hO3dpQ5tkT"),
              ),
            accountName: Text('Renzo Olivares'),
            accountEmail: Text('Computer Science Student'),
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