import 'package:flutter/foundation.dart';

class CustomCheckboxController extends ValueNotifier<bool> {
  CustomCheckboxController(bool value) : super(value);

  void setValue(bool newValue) {
    value = newValue;
    notifyListeners();
  }
}
