import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? backColor;
  final Color? iconColor;
  final Function onTap;
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 25,
    this.backColor = AppColors.onPrimary,
    this.iconColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      color: backColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.transparent,
          ),
          child: Icon(
            icon,
            size: size,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
