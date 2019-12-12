import 'package:flutter/material.dart';

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
      child: ClipOval(
        child: Image.asset('assets/images/profile_picture.png',
        fit: BoxFit.cover,
        height: 180.0,
        width: 180.0,
        ),
      ),
    );
  }
}
