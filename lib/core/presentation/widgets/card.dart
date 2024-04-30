import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final bool isExpanded;
  final double? height;
  final Color? color;
  final EdgeInsets? padding;
  const CustomCard(
      {super.key,
      this.isExpanded = false,
      required this.child,
      this.height,
      this.color,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Container(
        width: isExpanded ? double.infinity : null,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: height,
        decoration: BoxDecoration(
          color: color ?? AppColors.backgroundColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(1, 1),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
