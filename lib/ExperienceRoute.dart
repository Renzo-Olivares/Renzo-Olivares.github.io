import 'package:flutter_web/material.dart';
import 'package:personal_web_test/NavDrawer.dart';

class ExperienceRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("Renzo Olivares"),
      ),
      body: Text("Experience"),
    );
  }
}
