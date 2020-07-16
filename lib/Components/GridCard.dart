import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  const GridCard({this.openChild});
  final Widget openChild;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      openColor: Theme.of(context).canvasColor,
      openBuilder: (context, openContainer) => openChild,
      closedElevation: 0,
      closedColor: Theme.of(context).canvasColor,
      closedBuilder: (context, openContainer) {
        return Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          child: InkWell(
            onTap: openContainer,
            child: Center(child: Text('Hello')),
          ),
        );
      },
    );
  }
}
