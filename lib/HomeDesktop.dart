import 'package:flutter_web/material.dart';

class HomeDesktop extends StatelessWidget{
  String title;

  HomeDesktop(this.title);
  
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