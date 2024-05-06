import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dropdown_with_controller/custom_dropdown_controller.dart';
import '../dropdown_with_controller/custom_dropdown_with_controller.dart';

class EmptyDropDown extends StatelessWidget {
  CustomDropdownController controller;
  String emptyText;
  String? dropDownTitle;
  Color? titleColor;
  EmptyDropDown({super.key,
    required this.controller,
    required this.emptyText,
    this.dropDownTitle,
    this.titleColor

  });

  @override
  Widget build(BuildContext context) {
    controller.value = null;
    return CustomDropdownWithController(
      title: dropDownTitle,
      controller: controller,
      titleColor: titleColor ?? Colors.black87,
      items: [
        DropdownMenuItem(
          value: null,
          child: Text(emptyText),
        )
      ],
    );
  }
}
