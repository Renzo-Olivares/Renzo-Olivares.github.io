import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:renzo_portfolio/helpers/url_launcher.dart';
import 'package:renzo_portfolio/model/portfolio_state.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controller2;

  @override
  void initState() {
    super.initState();

    var showWelcomeScreen =
        Provider.of<PortfolioState>(context, listen: false).showWelcomeScreen;

    _controller = AnimationController(
      value: showWelcomeScreen ? 0 : 1,
      duration: const Duration(milliseconds: 7000),
      vsync: this,
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            showWelcomeScreen = false;
            _controller2.forward();
          } else if (status == AnimationStatus.dismissed) {
            if (showWelcomeScreen) {
              _controller.forward();
            }
          }
        },
      );

    _controller2 = AnimationController(
      value: showWelcomeScreen ? 0 : 1,
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: WelcomeScreenAnimator(
            controller: _controller,
            controller2: _controller2,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }
}

class WelcomeScreenAnimator extends StatelessWidget {
  final AnimationController controller;
  final AnimationController controller2;
  final Animation<double> greetingOpacityAnimation;
  final Animation<double> nameOpacityAnimation;
  final Animation<double> descOpacityAnimation;
  final Animation<Offset> welcomeScreenSlideAnimation;
  final Animation<double> profileAvatarOpacityAnimation;
  final Animation<double> nameOpacityAnimation2;
  final Animation<double> aboutDetailsOpacityAnimation;
  final Animation<double> socialRowOpacityAnimation;

  WelcomeScreenAnimator({Key key, this.controller, this.controller2})
      : greetingOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.1, 0.35),
          ),
        ),
        nameOpacityAnimation = Tween(begin: 0.0, end: 0.9).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.35, 0.6),
          ),
        ),
        descOpacityAnimation = Tween(begin: 0.0, end: 0.8).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.85),
          ),
        ),
        welcomeScreenSlideAnimation = Tween(
          begin: Offset.zero,
          end: const Offset(10.0, 0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.9, 1.0),
          ),
        ),
        profileAvatarOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller2,
            curve: const Interval(0.1, 0.3),
          ),
        ),
        nameOpacityAnimation2 = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller2,
            curve: const Interval(0.3, 0.6),
          ),
        ),
        aboutDetailsOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller2,
            curve: const Interval(0.6, 0.9),
          ),
        ),
        socialRowOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller2,
            curve: const Interval(0.9, 1.0),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(animation: controller, builder: _buildWelcomeScreen),
        AnimatedBuilder(animation: controller2, builder: _buildAboutDetails),
      ],
    );
  }

  Widget _buildAboutDetails(BuildContext context, Widget child) {
    final aboutDetails =
        'Hello there, I\'m Renzo! A 23 y/o aspiring software engineer based out of the Bay Area. I am currently attending the University of California, Riverside under the Bourne\'s College of Engineering for Computer Science. I have a passion for developing on mobile platforms, having previously worked on various custom Android ROMS and modifications, and more recently having interned for Google on the Material Flutter team.';

    var colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Opacity(
          opacity: profileAvatarOpacityAnimation.value,
          child: CircleAvatar(
            backgroundImage:
                Image.asset('assets/misc/profile_picture.png').image,
            radius: 100,
          ),
        ),
        SizedBox(height: 20),
        Opacity(
          opacity: nameOpacityAnimation2.value,
          child: Text(
            "Renzo Olivares",
            style: TextStyle(fontSize: 56, color: colorScheme.onSurface),
          ),
        ),
        SizedBox(height: 20),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 500,
            maxWidth: 500,
          ),
          child: Opacity(
            opacity: aboutDetailsOpacityAnimation.value,
            child: Text(
              aboutDetails,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: colorScheme.onSurface),
            ),
          ),
        ),
        SizedBox(height: 20),
        Opacity(
          opacity: socialRowOpacityAnimation.value,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SocialButton(
                MdiIcons.linkedin,
                'LinkedIn',
                () => UrlLauncher.launchURL(
                  'https://www.linkedin.com/in/510renzoolivares/',
                  'LinkedIn',
                ),
              ),
              SizedBox(
                width: 8,
              ),
              _SocialButton(
                MdiIcons.github,
                'Github',
                () => UrlLauncher.launchURL(
                  'https://github.com/Renzo-Olivares',
                  'Github',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeScreen(BuildContext context, Widget child) {
    var colorScheme = Theme.of(context).colorScheme;

    return _SlideAnimation(
      tween: welcomeScreenSlideAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
        ],
      ),
    );
  }
}

class _SlideAnimation extends StatelessWidget {
  const _SlideAnimation({this.tween, this.child});

  final Animation<Offset> tween;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: tween,
      child: child,
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
