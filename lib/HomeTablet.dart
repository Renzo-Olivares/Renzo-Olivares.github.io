import 'package:flutter_web/material.dart';

class HomeTablet extends StatelessWidget{
  final String brand;

  HomeTablet({Key key,this.brand}): super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(brand),
      ),
    );
  }
}