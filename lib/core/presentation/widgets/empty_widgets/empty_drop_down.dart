import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dropdown_with_controller/custom_dropdown_controller.dart';
import '../dropdown_with_controller/custom_dropdown_with_controller.dart';

class EmptyDropDown extends StatelessWidget {
  CustomDropdownController controller;
  String emptyText;
  String? dropDownTitle;
  EmptyDropDown({super.key,
    required this.controller,
    required this.emptyText,
    this.dropDownTitle

  });

  @override
  Widget build(BuildContext context) {
    controller.value = "empty";
    return CustomDropdownWithController(
      title: dropDownTitle,
      controller: controller,
      titleColor: Colors.white,
      items: [
        DropdownMenuItem(
          value: "empty",
          child: Text(emptyText),
        )
      ],
    );
  }
}
