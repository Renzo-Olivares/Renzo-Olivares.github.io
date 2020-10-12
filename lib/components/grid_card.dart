import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:renzo_portfolio/helpers/url_launcher.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    this.darkPreview,
    this.lightPreview,
    this.title,
    this.year,
    this.gitLink,
    this.openChild,
  });

  final String darkPreview;
  final String lightPreview;
  final String title;
  final String year;
  final String gitLink;
  final Widget openChild;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isDark = theme.brightness == Brightness.dark;

    return OpenContainer(
      openColor: theme.bottomAppBarColor,
      openBuilder: (context, openContainer) => openChild,
      closedColor: theme.scaffoldBackgroundColor,
      closedElevation: 8,
      tappable: false,
      closedBuilder: (context, openContainer) {
        return Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                isDark ? darkPreview : lightPreview,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8, end: 8),
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Text(
                  '$title - $year',
                  style: theme.textTheme.subtitle1.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.64),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => UrlLauncher.launchURL(gitLink, title),
            ),
          ],
        );
      },
    );
  }
}
