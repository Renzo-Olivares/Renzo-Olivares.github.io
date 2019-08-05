import 'package:flutter_web/material.dart';

class ResponsiveWidget extends StatelessWidget{
  final Widget mobileScreen;
  final Widget tabletScreen;
  final Widget desktopScreen;

  ResponsiveWidget({Key key, this.mobileScreen, this.tabletScreen, @required this.desktopScreen}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return desktopScreen;
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
          return tabletScreen ?? desktopScreen;
        } else {
          return mobileScreen ?? desktopScreen;
        }
      },
    );
  }
}