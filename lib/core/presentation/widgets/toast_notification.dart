import 'package:flutter/material.dart';

import '../../constants/colors.dart';

showToast(
    {required BuildContext context,
    required String message,
    Color? backgroundColor,
    Color? messageTextColor,
    int duration = 4}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(color: messageTextColor ?? Colors.white),
    ),
    duration: Duration(seconds: duration),
    backgroundColor: backgroundColor ?? AppColors.secondaryColor,
  ));
}
