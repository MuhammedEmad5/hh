import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/label.dart';

class DeviceOptionBlueLabelWidget extends StatelessWidget {
  const DeviceOptionBlueLabelWidget({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.all(4),
      width: double.infinity,
      color: AppColors.primaryColor,
      child: Label(
        text: label,
        color: Colors.white, //Optional
        size: 16,
        textAlign: TextAlign.start, //Optional
        weight: FontWeight.w500,
      ),
    );
  }
}
