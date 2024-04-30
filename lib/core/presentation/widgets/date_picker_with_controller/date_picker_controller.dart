import 'package:flutter/foundation.dart';

class DatePickerController extends ValueNotifier<DateTime?> {
  DatePickerController(DateTime? value) : super(value);

  void setDate(DateTime newDate) {
    value = newDate;
    notifyListeners();
  }
}
