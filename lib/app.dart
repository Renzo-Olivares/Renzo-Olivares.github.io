import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'adaptive_navigation.dart';
import 'colors.dart';
import 'model/portfolio_state.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PortfolioState>.value(value: PortfolioState())
      ],
      child: MaterialApp(
        title: 'Renzo\'s Portfolio',
        darkTheme: _buildDarkTheme(context),
        debugShowCheckedModeBanner: false,
        theme: _buildLightTheme(context),
        home: AdaptiveNav(),
      ),
    );
  }
}

ThemeData _buildLightTheme(BuildContext context) {
  final base = ThemeData.light();
  return base.copyWith(
    colorScheme: ColorScheme.light(primary: PortfolioColors.blue500),
    textTheme: GoogleFonts.rubikTextTheme(),
    scaffoldBackgroundColor: PortfolioColors.lightBlue400,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData _buildDarkTheme(BuildContext context) {
  final base = ThemeData.dark();
  return base.copyWith(
    colorScheme: const ColorScheme.dark(
      primary: PortfolioColors.lightBlue500,
      surface: PortfolioColors.blue400,
    ),
    textTheme: GoogleFonts.rubikTextTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
