import 'package:flutter/material.dart';

class RootScaffold {
  static openDrawer(BuildContext context) {
    final ScaffoldState scaffoldState =
        context.findRootAncestorStateOfType<ScaffoldState>();
    scaffoldState.openDrawer();
  }
}
