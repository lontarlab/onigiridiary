import 'package:flutter/material.dart';

class WrapperProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int newValue) {
    _currentIndex = newValue;
    notifyListeners();
  }

  PageController _pageController = PageController();
  PageController get pageController => _pageController;
  set pageController(PageController newValue) {
    _pageController = newValue;
    notifyListeners();
  }
}
