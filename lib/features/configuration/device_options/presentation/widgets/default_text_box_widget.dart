import 'package:InvoiceF/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:InvoiceF/core/presentation/widgets/text_box.dart';

class DeviceOptionTextBoxWidget extends StatelessWidget {
  const DeviceOptionTextBoxWidget(
      {super.key,
      required this.label,
      this.keyboardType = TextInputType.text,
      this.suffix,
      this.initialValue,
      });

  final String label;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextBox(
      label: label,
      textDirection: TextDirection.ltr,
      hint: label,
      labelColor: AppColors.primaryColor,
      initialValue: initialValue??'',
      keyboardType: keyboardType,
      maxLines: 1,
      onChanged: (value) {
        print(value);
      },
      suffix: suffix,
      // controller: , //Optional
    );
  }
}
