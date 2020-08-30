import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    this.darkPreview,
    this.lightPreview,
    this.openChild,
  });

  final String darkPreview;
  final String lightPreview;
  final Widget openChild;

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      openColor: Theme.of(context).bottomAppBarColor,
      openBuilder: (context, openContainer) => openChild,
      closedColor: Theme.of(context).bottomAppBarColor,
      closedBuilder: (context, openContainer) {
        return Ink.image(
          image: AssetImage(
            isDark ? darkPreview : lightPreview,
          ),
          fit: BoxFit.fill,
          child: InkWell(
            onTap: openContainer,
          ),
        );
      },
    );
  }
}
