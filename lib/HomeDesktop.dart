import 'package:flutter_web/material.dart';

class HomeDesktop extends StatelessWidget{
  String brand;

  HomeDesktop({Key key, this.brand}) : super(key:key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(brand),
      ),
    );
  }
}