import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget desktopScreen;
  final Widget tabletScreen;
  final Widget mobileScreen;

  ResponsiveWidget(
      {Key key, this.desktopScreen, this.tabletScreen, this.mobileScreen})
      : super(key: key);

  static bool isDesktop(BuildContext context) {
    return getWindowType(context) > AdaptiveWindowType.medium;
  }

  static bool isTablet(BuildContext context) {
    return getWindowType(context) == AdaptiveWindowType.medium;
  }

  static bool isMobile(BuildContext context) {
    return getWindowType(context) == AdaptiveWindowType.small;
  }

  static bool isBigScreen(BuildContext context) {
    return getWindowType(context) > AdaptiveWindowType.small;
  }

  @override
  Widget build(BuildContext context) {
    var windowType = getWindowType(context);
    if (windowType > AdaptiveWindowType.medium) {
      return desktopScreen;
    } else if (windowType == AdaptiveWindowType.medium) {
      return tabletScreen ?? desktopScreen;
    } else {
      return mobileScreen;
    }
  }
}
