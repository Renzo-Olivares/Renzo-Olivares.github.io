import 'package:flutter_web/material.dart';

class HomeTablet extends StatelessWidget{
  String brand;

  HomeTablet({Key key,this.brand}): super(key:key);
  
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