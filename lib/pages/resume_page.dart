import 'package:flutter/material.dart';
import 'package:renzo_portfolio/helpers/responsive_widget.dart';
import 'package:renzo_portfolio/helpers/url_launcher.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isBigScreen = ResponsiveWidget.isBigScreen(context);
    var isDark = Theme.of(context).brightness == Brightness.dark;
    double horizontalPadding = isBigScreen ? 0 : 20;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.only(
            top: 20,
            start: horizontalPadding,
            end: horizontalPadding,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.075,
              ),
              Center(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Image.asset(
                    isDark
                        ? 'assets/misc/resume-dark.png'
                        : 'assets/misc/resume.png',
                  ),
                ),
              ),
              SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: () => UrlLauncher.launchURL(
                  'https://github.com/Renzo-Olivares/Renzo-Olivares.github.io/raw/revamp/assets/misc/renzo_tech_resume.pdf',
                  'Resume',
                ),
                icon: Icon(Icons.download_sharp),
                label: Text('Download'),
                style: OutlinedButton.styleFrom(elevation: 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
