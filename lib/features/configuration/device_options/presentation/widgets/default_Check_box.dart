import 'package:InvoiceF/core/presentation/widgets/check_box_with_controller/custom_check_box_with_controller.dart';
import 'package:flutter/material.dart';
import '../../../../../core/presentation/widgets/check_box_with_controller/check_box_controller.dart';


class DeviceOptionCheckBoxWidget extends StatelessWidget {
  const DeviceOptionCheckBoxWidget({super.key, required this.controller, required this.label});

  final CustomCheckboxController controller;
  final String label;


  @override
  Widget build(BuildContext context) {
    return CustomCheckboxWithController(
      label: label,
      controller: controller,
    );
  }
}

