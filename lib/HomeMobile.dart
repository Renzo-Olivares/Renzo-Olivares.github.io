import 'package:flutter_web/material.dart';
import 'package:personal_web_test/NavDrawer.dart';

class HomeMobile extends StatelessWidget {
  String brand;

  HomeMobile({Key key, this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 1.0,
        title: Text(brand),
      ),
    );
  }
}
