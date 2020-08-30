import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:renzo_portfolio/Model/portfolio_state.dart';

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

    var showWelcomeScreen =
        Provider.of<PortfolioState>(context, listen: false).showWelcomeScreen;

    _controller = AnimationController(
      value: showWelcomeScreen ? 0 : 1,
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
    return Scaffold(
      body: StaggeredTextAnimator(
        controller: _controller,
      ),
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
        nameOpacityAnimation = Tween(begin: 0.0, end: 0.9).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.4, 0.7),
          ),
        ),
        descOpacityAnimation = Tween(begin: 0.0, end: 0.8).animate(
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
    var colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: greetingOpacityAnimation.value,
              child: Text(
                "Hi, my name is",
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            Opacity(
              opacity: nameOpacityAnimation.value,
              child: Text(
                "Renzo Olivares.",
                style: TextStyle(
                  fontSize: 66,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            Opacity(
              opacity: descOpacityAnimation.value,
              child: Text(
                "I build things with code.",
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface,
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
    var colorScheme = Theme.of(context).colorScheme;
    return OutlinedButton.icon(
      icon: Icon(_icon, color: colorScheme.primary),
      label: Text(
        _label,
        style: TextStyle(fontSize: 14, color: colorScheme.primary),
      ),
      onPressed: _onTap,
      style: OutlinedButton.styleFrom(elevation: 4),
    );
  }
}
