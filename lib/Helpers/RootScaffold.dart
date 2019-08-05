import 'package:flutter_web/material.dart';

class RootScaffold {
  static openDrawer(BuildContext context) {
    final ScaffoldState scaffoldState =
        context.rootAncestorStateOfType(TypeMatcher<ScaffoldState>());
    scaffoldState.openDrawer();
  }
}
