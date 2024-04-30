import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'label.dart';

class TextBox extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final Color? labelColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? overAllColor;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final double? textFiledWidth;
  final double? labelWidth;
  final Function(String)? onChanged;
  final String? initialValue;
  final bool? isEnabled;
  final Widget? suffix;
  final Function(String)? onSubmitted;
  final bool isNumberBox;

  final bool readOnly;
  const TextBox(
      {super.key,
      this.controller,
      this.hint,
      this.label,
      this.labelColor,
      this.borderColor,
      this.textColor,
      this.overAllColor,
      this.keyboardType,
      this.maxLength,
      this.maxLines = 1,
      this.textFiledWidth,
      this.onChanged,
      this.initialValue,
      this.isEnabled = true,
      this.suffix,
      this.onSubmitted,
      this.isNumberBox = false,
      this.readOnly = false,
      this.labelWidth});

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    if (widget.initialValue != null) {
      controller.text = widget.initialValue!;
    }
  }

  @override
  void dispose() {
    widget.controller == null ? controller.dispose() : null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.initialValue != null && widget.initialValue != controller.text) {
      setState(() {
        controller.text = widget.initialValue!;
      });
    }
    return SizedBox(
      width: widget.labelWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Label(
                  text: widget.label!,
                  color: widget.overAllColor != null
                      ? widget.overAllColor!
                      : widget.labelColor,
                )
              : const SizedBox(),
          SizedBox(
            height: widget.label != null ? 10 : 0,
          ),
          TextField(
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            controller: controller,
            keyboardType:
                widget.isNumberBox ? TextInputType.number : widget.keyboardType,
            onChanged: widget.onChanged,
            enabled: widget.isEnabled,
            cursorColor: widget.borderColor,
            style: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return const TextStyle(
                    color: Colors.black,
                  );
                } else {
                  return TextStyle(color: widget.textColor);
                }
              },
            ),
            // textInputAction: TextInputAction.,
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(
              filled: widget.isEnabled,
              suffixIcon: widget.suffix,
              counterText: '',
              hintText: widget.hint ?? "",
              alignLabelWithHint: false,
              fillColor: AppColors.onPrimary,
              enabledBorder:
                  widget.borderColor != null || widget.overAllColor != null
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.overAllColor != null
                                  ? widget.overAllColor!.withAlpha(150)
                                  : widget.borderColor!.withAlpha(150),
                              width: 2),
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
              focusedBorder:
                  widget.borderColor != null || widget.overAllColor != null
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.overAllColor != null
                                  ? widget.overAllColor!
                                  : widget.borderColor!,
                              width: 2),
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
              contentPadding: EdgeInsets.symmetric(
                  vertical: widget.maxLines! > 1 ? 15 : 0, horizontal: 15),
              border: OutlineInputBorder(
                // borderSide: BorderSide(
                //     color: widget.borderColor ?? AppColors.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
