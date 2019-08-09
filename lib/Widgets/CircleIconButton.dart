import 'package:flutter_web/material.dart';

class CircleIconButton extends StatelessWidget {
  ImageProvider icon;
  IconData altIcon;
  double size;
  VoidCallback tapFunction;

  CircleIconButton(
      {Key key, this.icon, this.tapFunction, this.altIcon, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.blue[400], blurRadius: 5.0)],
        shape: BoxShape.circle,
        border: Border.all(
          width: 4.0,
          color: Colors.blue[700],
        ),
      ),
      child: IconButton(
        onPressed: tapFunction,
        icon: altIcon == null
            ? ImageIcon(icon)
            : Icon(
                altIcon,
                size: size,
              ),
      ),
    );
  }
}
