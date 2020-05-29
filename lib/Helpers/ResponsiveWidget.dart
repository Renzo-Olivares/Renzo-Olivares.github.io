import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobileScreen;
  final Widget tabletScreen;
  final Widget desktopScreen;

  ResponsiveWidget(
      {Key key,
      this.mobileScreen,
      this.tabletScreen,
      @required this.desktopScreen})
      : super(key: key);

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return mobileScreen;
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
          return tabletScreen ?? desktopScreen;
        } else {
          return desktopScreen;
        }
      },
    );
  }
}