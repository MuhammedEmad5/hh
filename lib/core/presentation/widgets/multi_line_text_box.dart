import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'label.dart';

class MultiLineTextBox extends StatefulWidget {
  final Function(String)? onChanged;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final TextInputType? keyboardType;
  final bool readOnly;
  final double height;

  const MultiLineTextBox({
      super.key,
      this.onChanged,
      this.maxLength,
      this.maxLines = 20,
      this.controller,
      this.hint,
      this.label,
      this.keyboardType,
      this.readOnly = false,
      this.height = 150
  });

  @override
  State<MultiLineTextBox> createState() => _MultiLineTextBoxState();
}

class _MultiLineTextBoxState extends State<MultiLineTextBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        widget.label != null
            ? Label(
          text: widget.label!,
        )
            : const SizedBox(),
        SizedBox(
          height: widget.label != null ? 10 : 0,
        ),
        Container(

          height: widget.height,
          child: TextField(
            controller: widget.controller,
            cursorColor: AppColors.primaryColor,
            maxLength: widget.maxLength,
            maxLines: 5,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 1.5)),
                hintText: widget.hint ?? '',
                hintStyle: TextStyle(
                  color: Colors.grey,
                )),
          ),
        ),
      ],
    );
  }
}
