import 'package:flutter/material.dart';

class PagecontrollProvider extends ChangeNotifier {
  PageController pageController = PageController();

  int selectcategoryindex = 0;

  void categoryindex(int value) {
    selectcategoryindex = value;
    notifyListeners();
  }
}
