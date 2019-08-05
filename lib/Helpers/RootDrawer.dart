import 'package:flutter_web/material.dart';

class RootDrawer {
  static DrawerControllerState of(BuildContext context) {
    final DrawerControllerState drawerControllerState =
        context.rootAncestorStateOfType(TypeMatcher<DrawerControllerState>());
    return drawerControllerState;
  }
}
