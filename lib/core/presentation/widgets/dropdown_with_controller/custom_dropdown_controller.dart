import 'package:flutter/foundation.dart';

class CustomDropdownController<T> extends ValueNotifier<T?> {
  CustomDropdownController([T? value]) : super(value);

  void setValue(T? newValue) {
    value = newValue;
    notifyListeners();
  }
}
