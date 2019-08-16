import 'package:flutter_web/material.dart';
import 'package:personal_web_test/Widgets/CustomCircleAvatar.dart';
import 'package:personal_web_test/Helpers/RootDrawer.dart';

class NavDrawer extends StatefulWidget {
  final GlobalKey<NavigatorState> navigator;

  NavDrawer({Key key, this.navigator}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  static String drawerPosition = '/';

  @override
  Widget build(BuildContext context) {
    final List<List<dynamic>> drawerSections = [
      [
        "About",
        Icons.person,
        '/',
        drawerPosition == '/',
      ],
      [
        "Projects",
        Icons.developer_mode,
        '/projects',
        drawerPosition == '/projects',
      ],
      [
        "Experience",
        Icons.work,
        '/experience',
        drawerPosition == '/experience',
      ],
      [
        "Resume",
        Icons.description,
        '/resume',
        drawerPosition == '/resume',
      ],
    ];

    return Drawer(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).orientation == Orientation.landscape
                    ? 190.0
                    : 220.0,
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
                            child: CustomCircleAvatar(
                              size: 40.0,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Center(
                            child: Text(
                          'Renzo Olivares',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
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
                      physics: BouncingScrollPhysics(),
                      children: drawerSections.map(createDrawerSections).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createDrawerSections(List<dynamic> sections) {
    return Card(
      color: sections[3] ? Colors.blue[600] : Colors.transparent,
      elevation: sections[3] ? 1.0 : 0.0,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
        onTap: () => setDrawerPosition(sections[2]),
        leading: Icon(sections[1]),
        title: Text(
          sections[0],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
        ),
      ),
    );
  }

  void setDrawerPosition(String newPosition) {
    final state = RootDrawer.of(context);

    setState(() {
      drawerPosition = newPosition;
    });

    widget.navigator.currentState.pushReplacementNamed(drawerPosition);
    state.close();
  }
}
