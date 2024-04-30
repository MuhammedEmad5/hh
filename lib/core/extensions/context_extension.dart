import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension ContextExtensions on BuildContext {
  String formatDateString(String dateString, {String format = 'dd MMMM yyyy'}) {
    try {
      final dateTime = DateTime.parse(dateString);
      final formatter = DateFormat(format, 'en_US');
      return formatter.format(dateTime);
    } catch (e) {
      print('Error parsing date: $e');
      return '';
    }
  }
}