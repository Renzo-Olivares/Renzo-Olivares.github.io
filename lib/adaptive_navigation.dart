import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helpers/responsive_widget.dart';
import 'model/portfolio_state.dart';
import 'pages/about_page.dart';
import 'pages/projects_page.dart';
import 'pages/resume_page.dart';
import 'pages/work_page.dart';

class AdaptiveNav extends StatefulWidget {
  AdaptiveNav({Key key}) : super(key: key);

  @override
  _AdaptiveNavState createState() => _AdaptiveNavState();
}

class _AdaptiveNavState extends State<AdaptiveNav> {
  int _selectedIndex = 0;

  final _pages = [
    const AboutPage(),
    const ProjectsPage(),
    const WorkPage(),
    const ResumePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: _BuildDesktopNav(
        selectedIndex: _selectedIndex,
        extended: ResponsiveWidget.isTablet(context) ? false : true,
        routes: _pages,
        onItemTapped: _onItemTapped,
      ),
      mobileScreen: _BuildMobileNav(
        selectedIndex: _selectedIndex,
        routes: _pages,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    var showWelcomeScreen =
        Provider.of<PortfolioState>(context, listen: false).showWelcomeScreen;

    if (showWelcomeScreen) {
      Provider.of<PortfolioState>(context, listen: false).showWelcomeScreen =
          false;
    }

    setState(
      () {
        _selectedIndex = index;
      },
    );
  }
}

class _BuildDesktopNav extends StatefulWidget {
  const _BuildDesktopNav({
    Key key,
    this.selectedIndex,
    this.extended,
    this.routes,
    this.onItemTapped,
  }) : super(key: key);

  final selectedIndex;
  final bool extended;
  final List routes;
  final void Function(int) onItemTapped;

  @override
  _BuildDesktopNavState createState() => _BuildDesktopNavState();
}

class _BuildDesktopNavState extends State<_BuildDesktopNav> {
  bool _isExtended;

  @override
  void initState() {
    super.initState();
    _isExtended = widget.extended;
  }

  @override
  void didUpdateWidget(_BuildDesktopNav oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.extended != widget.extended) _isExtended = widget.extended;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.person_outline),
                        selectedIcon: Icon(Icons.person),
                        label: Text('About'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.lightbulb_outline),
                        selectedIcon: Icon(Icons.lightbulb),
                        label: Text('Projects'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.work_outline),
                        selectedIcon: Icon(Icons.work),
                        label: Text('Work'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.assignment_outlined),
                        selectedIcon: Icon(Icons.assignment),
                        label: Text('Resume'),
                      ),
                    ],
                    extended: _isExtended,
                    labelType: NavigationRailLabelType.none,
                    leading: Row(
                      children: [
                        SizedBox(width: 24),
                        InkWell(
                          child: Icon(Icons.menu),
                          onTap: () {
                            setState(
                              () {
                                _isExtended = !_isExtended;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    selectedIndex: widget.selectedIndex,
                    onDestinationSelected: widget.onItemTapped,
                  ),
                ),
              ),
            );
          }),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _ScreenTransitionBuilder(
              currentScreen: widget.routes.elementAt(widget.selectedIndex),
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildMobileNav extends StatelessWidget {
  const _BuildMobileNav({
    this.selectedIndex,
    this.routes,
    this.onItemTapped,
  });

  final selectedIndex;
  final List routes;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: _ScreenTransitionBuilder(
        currentScreen: routes.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(thickness: 1, height: 1),
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: colorScheme.surface,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'About',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.lightbulb_outline),
                  activeIcon: Icon(Icons.lightbulb),
                  label: 'Projects',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.work_outline),
                  activeIcon: Icon(Icons.work),
                  label: 'Work',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment_outlined),
                  activeIcon: Icon(Icons.assignment),
                  label: 'Resume',
                ),
              ],
              onTap: onItemTapped,
              selectedItemColor: colorScheme.primary,
              unselectedItemColor: colorScheme.onSurface.withOpacity(0.64),
              showUnselectedLabels: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScreenTransitionBuilder extends StatelessWidget {
  const _ScreenTransitionBuilder({this.currentScreen});
  final Widget currentScreen;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      child: currentScreen,
      transitionBuilder: (child, animation, secondaryAnimation) {
        return FadeThroughTransition(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          child: child,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
        );
      },
    );
  }
}
