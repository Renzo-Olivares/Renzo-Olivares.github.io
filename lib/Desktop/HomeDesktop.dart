import 'package:flutter_web/material.dart';

class HomeDesktop extends StatelessWidget {
  final String brand;

  HomeDesktop({Key key, this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(brand),
      ),
    );
  }
}
