import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Model/portfolio_state.dart';
import 'Navigator.dart';
import 'colors.dart';

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
    primaryColor: PortfolioColors.blue500,
    colorScheme: ColorScheme.light(
      primary: PortfolioColors.blue500,
      primaryVariant: PortfolioColors.blue600,
      secondary: PortfolioColors.yellow400,
      secondaryVariant: PortfolioColors.yellow500,
      surface: PortfolioColors.yellow400,
      error: PortfolioColors.brightPink700,
    ),
    textTheme: GoogleFonts.rubikTextTheme(),
    scaffoldBackgroundColor: Colors.blueGrey[50],
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData _buildDarkTheme(BuildContext context) {
  final base = ThemeData.dark();
  return base.copyWith(
    colorScheme: const ColorScheme.dark(
      primary: PortfolioColors.brightPink400,
      primaryVariant: PortfolioColors.brightPink500,
      secondary: PortfolioColors.blue400,
      secondaryVariant: PortfolioColors.blue500,
      surface: PortfolioColors.blue400,
      error: PortfolioColors.yellow400,
    ),
    textTheme: GoogleFonts.rubikTextTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
