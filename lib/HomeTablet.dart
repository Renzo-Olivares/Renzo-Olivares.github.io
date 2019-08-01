import 'package:flutter_web/material.dart';

class HomeTablet extends StatelessWidget{
  String title;

  HomeTablet(this.title);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}