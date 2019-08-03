import 'package:flutter_web/material.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 250,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: ListView(
                physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5.0)
                          ],
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4.0,
                            color: Colors.blue[700],
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(
                              "https://drive.google.com/uc?id=1Sny9mEihMEIzlhHQMWCzV4hO3dpQ5tkT"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Center(
                        child: Text(
                      'Renzo Olivares',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )),
                  ),
                  Center(
                      child: Text(
                    'Computer Science Student',
                    style: TextStyle(
                        fontWeight: FontWeight.w200, color: Colors.white),
                  )),
                ],
              ),
            ),
          ),
          Flexible(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
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
