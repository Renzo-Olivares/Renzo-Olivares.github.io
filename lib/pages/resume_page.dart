import 'package:flutter/material.dart';
import 'package:renzo_portfolio/helpers/responsive_widget.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isBigScreen = ResponsiveWidget.isBigScreen(context);
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
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(
                    'assets/misc/resume.jpg',
                  ),
                ),
              ),
              SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: () {},
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
