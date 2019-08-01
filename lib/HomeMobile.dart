import 'package:flutter_web/material.dart';
import 'package:personal_web_test/NavDrawer.dart';

class HomeMobile extends StatelessWidget{
  String title;

  HomeMobile(this.title);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 1.0,
        title: Text(title),
      ),
    );
  }
}