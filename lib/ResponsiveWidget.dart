import 'package:flutter_web/material.dart';

class ResponsiveWidget extends StatelessWidget{
  Widget mobileScreen;
  Widget tabletScreen;
  Widget desktopScreen;

  ResponsiveWidget(this.mobileScreen, this.tabletScreen, this.desktopScreen);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth < 450){
          return mobileScreen;
        }else if(constraints.maxWidth < 1024 && constraints.maxWidth > 450){
          return tabletScreen;
        }else{
          return desktopScreen;
        }
      },
    );
  }
}