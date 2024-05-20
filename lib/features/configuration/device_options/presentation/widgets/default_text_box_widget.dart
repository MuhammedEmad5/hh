import 'package:InvoiceF/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/blocs/language_bloc/language_bloc.dart';
import '../../../../../core/presentation/widgets/bootstrap/text_box_bootstrap.dart';

class DeviceOptionTextBoxWidget extends StatelessWidget {
  const DeviceOptionTextBoxWidget({
    super.key,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.suffix,
    required this.controller,
  });

  final String label;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextBoxBootstrap(
      label: label,
      controller: controller,
      hint: label,
      labelColor: AppColors.primaryColor,
      initialValue: controller.text,
      keyboardType: keyboardType,
      maxLines: 1,
      isArabic: context.read<LanguageBloc>().state.languageCode == 'ar',
      onChanged: (value) {},
      suffix: suffix,
      // controller: , //Optional
    );
  }
}
