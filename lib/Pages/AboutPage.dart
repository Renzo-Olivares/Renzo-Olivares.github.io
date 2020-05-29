import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: Duration(milliseconds: 3500), vsync: this);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //_controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredTextAnimator(
      controller: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class StaggeredTextAnimator extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> greetingOpacityAnimation;
  final Animation<double> nameOpacityAnimation;
  final Animation<double> descOpacityAnimation;

  StaggeredTextAnimator({Key key, this.controller})
      : greetingOpacityAnimation =
            Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.1, 0.4),
        )),
        nameOpacityAnimation =
            Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.4, 0.7),
        )),
        descOpacityAnimation =
            Tween(begin: 0.0, end: 0.7).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.7, 1.0),
        )),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildLayout);
  }

  Widget _buildLayout(BuildContext context, Widget child) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: greetingOpacityAnimation.value,
            child: Text("Hi, my name is",
                style: GoogleFonts.manrope(
                  color: Colors.cyan[600],
                  fontSize: 16,
                )),
          ),
          Opacity(
            opacity: nameOpacityAnimation.value,
            child: Text("Renzo Olivares.",
                style: GoogleFonts.manrope(
                    color: Colors.indigo[100],
                    fontSize: 66,
                    fontWeight: FontWeight.w600)),
          ),
          Opacity(
            opacity: descOpacityAnimation.value,
            child: Text("I build things with code.",
                style: GoogleFonts.manrope(
                    color: Colors.indigo[100],
                    fontSize: 56,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GFButton(
                  onPressed: () {},
                  text: "LinkedIn",
                  icon: Icon(Entypo.linkedin),
                  //shape: GFButtonShape.square,
                  type: GFButtonType.transparent,
                  color: Colors.cyan[600],
                ),
                GFButton(
                  onPressed: () {},
                  text: "Github",
                  icon: Icon(Entypo.github),
                  //shape: GFButtonShape.square,
                  type: GFButtonType.transparent,
                  color: Colors.cyan[600],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
