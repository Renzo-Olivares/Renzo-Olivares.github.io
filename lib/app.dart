import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Navigator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Renzo\'s Portfolio',
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.manropeTextTheme(Theme.of(context).textTheme),
        primaryColor: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.manropeTextTheme(Theme.of(context).textTheme),
        primaryColor: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AdaptiveNav(),
    );
  }
}
