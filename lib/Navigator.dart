import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:renzo_portfolio/Helpers/ResponsiveWidget.dart';
import 'package:renzo_portfolio/Pages/AboutPage.dart';

class Navigator extends StatefulWidget {
  Navigator({Key key}) : super(key: key);

  @override
  _NavigatorState createState() => _NavigatorState();
}

class _NavigatorState extends State<Navigator>{
  int _selectedIndex = 0;
  Brightness brightnessValue;
  bool isDark;

  @override
  Widget build(BuildContext context) {
    brightnessValue = MediaQuery.of(context).platformBrightness;
    isDark = brightnessValue == Brightness.dark;

    return ResponsiveWidget(
      desktopScreen: _buildDesktopNav(),
      mobileScreen: _buildMobileNav(),
    );
  }

  Widget _buildDesktopNav() {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            elevation: 4.0,
            selectedIconTheme: IconThemeData(color: Colors.cyan[600]),
            unselectedIconTheme: isDark
                ? IconThemeData(color: Colors.grey[400])
                : IconThemeData(color: Colors.black),
            labelType: NavigationRailLabelType.all,
            selectedLabelTextStyle:
                GoogleFonts.manrope(color: Colors.cyan[600]),
            unselectedLabelTextStyle: isDark
                ? GoogleFonts.manrope(
                    color: Colors.grey[400],
                  )
                : GoogleFonts.manrope(
                  color: Colors.black,
                ),
            onDestinationSelected: _onItemTapped,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: Text('About'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.lightbulb_outline),
                selectedIcon: Icon(MdiIcons.lightbulb),
                label: Text('Projects'),
              ),
              NavigationRailDestination(
                icon: Icon(MdiIcons.briefcaseOutline),
                selectedIcon: Icon(Icons.work),
                label: Text('Work'),
              ),
              NavigationRailDestination(
                icon: Icon(MdiIcons.clipboardTextOutline),
                selectedIcon: Icon(Icons.assignment),
                label: Text('Resume'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _screenBuilder(_selectedIndex),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileNav() {
    return Scaffold(
      body: _screenBuilder(_selectedIndex),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(thickness: 1, height: 1),
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: isDark ? Colors.grey[800] : Colors.white,
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              elevation: 4.0,
              selectedItemColor: Colors.cyan[600],
              unselectedItemColor: isDark ? Colors.grey : Colors.black,
              showUnselectedLabels: true,
              selectedLabelStyle: GoogleFonts.manrope(color: Colors.cyan[600]),
              unselectedLabelStyle: isDark
                ? GoogleFonts.manrope(
                    color: Colors.grey,
                  )
                : GoogleFonts.manrope(
                  color: Colors.black,
                ),
              onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  title: Text('About'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.lightbulb_outline),
                  activeIcon: Icon(MdiIcons.lightbulb),
                  title: Text('Projects'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(MdiIcons.briefcaseOutline),
                  activeIcon: Icon(Icons.work),
                  title: Text('Work'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(MdiIcons.clipboardTextOutline),
                  activeIcon: Icon(Icons.assignment),
                  title: Text('Resume'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildAboutArea() {
    return AboutPage();
  }

  Widget _buildProjectArea() {
    return Center(
      child: Text('Projects'),
    );
  }

  Widget _buildWorkArea() {
    return Center(
      child: Text('Work Experience'),
    );
  }

  Widget _buildResumeArea() {
    return Center(
      child: Text('Resume'),
    );
  }

  Widget _screenBuilder(int index) {
    switch (index) {
      case 0:
        {
          return _buildAboutArea();
        }
        break;

      case 1:
        {
          return _buildProjectArea();
        }
        break;

      case 2:
        {
          return _buildWorkArea();
        }
        break;

      case 3:
        {
          return _buildResumeArea();
        }
        break;

      default:
        {
          return _buildAboutArea();
        }
    }
  }
}
