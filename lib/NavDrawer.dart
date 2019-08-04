import 'package:flutter_web/material.dart';
import 'package:personal_web_test/AboutRoute.dart';
import 'package:personal_web_test/ProjectsRoute.dart';
import 'package:personal_web_test/ExperienceRoute.dart';
import 'package:personal_web_test/ResumeRoute.dart';

class NavDrawer extends StatefulWidget {
  NavDrawer({Key key}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  static int drawerPosition = 1;

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> drawerSections = [
      [
        "About",
        Icons.person_outline,
        1,
        drawerPosition == 1,
      ],
      [
        "Projects",
        Icons.developer_mode,
        2,
        drawerPosition == 2,
      ],
      [
        "Experience",
        Icons.work,
        3,
        drawerPosition == 3,
      ],
      [
        "Resume",
        Icons.description,
        4,
        drawerPosition == 4,
      ],
    ];

    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 250,
            child: DrawerHeader(
              margin: EdgeInsets.only(bottom: 0.0),
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
                            color: Colors.blue[500],
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
              child: Container(
                color: Colors.blue[500],
                child: ListView(
                  //padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  children: drawerSections.map(createDrawerSections).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createDrawerSections(List<dynamic> sections) {
    return Card(
      color: sections[3]? Colors.blue[600] : Colors.transparent,
      elevation: sections[3]? 1.0: 0.0,
      child: ListTile(
        contentPadding: EdgeInsets.only(right: 30.0, left: 30.0),
        onTap: () => setDrawerPosition(sections[2]),
        leading: Icon(sections[1]),
        title: Text(
          sections[0],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
        ),
      ),
    );
  }

  void pushRoute() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {
        switch (drawerPosition) {
          case 1:
            return AboutRoute();
          case 2:
            return ProjectsRoute();
          case 3:
            return ExperienceRoute();
          case 4:
            return ResumeRoute();
          default:
            return AboutRoute();
        }
      },
    ));
  }

  void setDrawerPosition(int newPosition) {
    setState(() {
      drawerPosition = newPosition;
    });

    pushRoute();
  }
}
