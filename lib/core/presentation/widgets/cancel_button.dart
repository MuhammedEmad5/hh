import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CancelButton extends StatelessWidget {
  final bool isExpanded;
  final String title;
  final Function onPressed;
  final Color? textColor;
  final Color? color;
  const CancelButton({
    super.key,
    required this.onPressed,
    this.color,
    this.textColor,
    this.isExpanded = false,
    this.title = 'Cancel',
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 65,
      onPressed: () {
        onPressed();
      },
      minWidth: isExpanded ? double.infinity : null,
      color: AppColors.onButton,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
