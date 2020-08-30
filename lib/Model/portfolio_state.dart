import 'package:flutter/widgets.dart';

class PortfolioState with ChangeNotifier {
  bool _showWelcomeScreen = true;

  bool get showWelcomeScreen => _showWelcomeScreen;

  set showWelcomeScreen(bool value) {
    _showWelcomeScreen = value;
    notifyListeners();
  }
}
