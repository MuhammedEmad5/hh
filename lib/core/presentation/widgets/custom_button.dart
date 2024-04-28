import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'label.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isExpanded;
  final Color? textColor;
  final Color? backGroundColorColor;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isExpanded = true,
      this.textColor,
      this.backGroundColorColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: MaterialButton(
        minWidth: isExpanded ? double.infinity : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: backGroundColorColor ?? AppColors.primaryColor,
        onPressed: () {
          onPressed();
        },
        child: Label(
          text: text,
          color: textColor ?? AppColors.onPrimary,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
