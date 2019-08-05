import 'package:flutter_web/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double size;

  CustomCircleAvatar({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5.0)
        ],
        shape: BoxShape.circle,
        border: Border.all(
          width: 4.0,
          color: Colors.blue[500],
        ),
      ),
      child: CircleAvatar(
        radius: size,
        backgroundImage: NetworkImage(
            "https://drive.google.com/uc?id=1Sny9mEihMEIzlhHQMWCzV4hO3dpQ5tkT"),
      ),
    );
  }
}
