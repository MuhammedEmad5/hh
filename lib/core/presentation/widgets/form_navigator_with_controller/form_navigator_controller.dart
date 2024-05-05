import 'package:flutter/cupertino.dart';

class FormNavigationController extends ChangeNotifier {
  int _currentIndex = 1;
  int _length = 1;

  int get currentIndex => _currentIndex;
  int get length => _length;

  void updateIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  void setLength(int value) {
    _length = value;
    notifyListeners();
  }
}
