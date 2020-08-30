import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);

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
      duration: Duration(milliseconds: 3500),
      vsync: this,
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            //_controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        },
      );

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
      : greetingOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.1, 0.4),
          ),
        ),
        nameOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.4, 0.7),
          ),
        ),
        descOpacityAnimation = Tween(begin: 0.0, end: 0.7).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.7, 1.0),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildLayout);
  }

  Widget _buildLayout(BuildContext context, Widget child) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: greetingOpacityAnimation.value,
              child: Text(
                "Hi, my name is",
                style: TextStyle(
                  color: Colors.cyan[600],
                  fontSize: 16,
                ),
              ),
            ),
            Opacity(
              opacity: nameOpacityAnimation.value,
              child: Text(
                "Renzo Olivares.",
                style: TextStyle(
                  color: Colors.indigo[100],
                  fontSize: 66,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Opacity(
              opacity: descOpacityAnimation.value,
              child: Text(
                "I build things with code.",
                style: TextStyle(
                  color: Colors.indigo[100],
                  fontSize: 56,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _SocialButton(
                  MdiIcons.linkedin,
                  'LinkedIn',
                  () {},
                ),
                SizedBox(
                  width: 8,
                ),
                _SocialButton(
                  MdiIcons.github,
                  'Github',
                  () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton(this._icon, this._label, this._onTap);
  final IconData _icon;
  final String _label;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(_icon),
      label: Text(
        _label,
        style: TextStyle(fontSize: 14),
      ),
      onPressed: _onTap,
      style: OutlinedButton.styleFrom(
        primary: Colors.cyan[600],
        elevation: 4,
        side: BorderSide(
          color: Colors.cyan[600],
        ),
      ),
    );
  }
}
