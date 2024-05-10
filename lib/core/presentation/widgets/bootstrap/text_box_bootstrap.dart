import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

import '../label.dart';

class TextBoxBootstrap extends StatefulWidget {
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
  final bool isSecure;
  final bool isArabic;


  final bool readOnly;
  const TextBoxBootstrap({
    super.key,
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
    this.isArabic = false,
    this.onSubmitted,
    this.isNumberBox = false,
    this.readOnly = false, this.labelWidth,
     this.isSecure = false
  });

  @override
  State<TextBoxBootstrap> createState() => _TextBoxBootstrapState();
}

class _TextBoxBootstrapState extends State<TextBoxBootstrap> {
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
    return FB5Row(
      children: [
        /// col-12: This class indicates that the column should take
        /// up the full width available in its parent container on all screen sizes.
        /// In Bootstrap, the grid system is based
        /// on a 12-column layout, and col-12 specifies that the column should occupy all 12 columns.
        FB5Col(
          classNames: 'col-xs-12 col-sm-6   py-1 ',
          child: widget.label != null
              ? Label(
                  text: widget.label!,
                  color: widget.overAllColor != null
                      ? widget.overAllColor!
                      : widget.labelColor,
                )
              : const SizedBox(),
        ),

        FB5Col(
          classNames: 'col-xs-12 col-sm-6 py-1 ',
          child:TextField(
            textAlign: widget.isArabic
                ? TextAlign.right
                : TextAlign.left  ,
            obscureText: widget.isSecure,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            controller: controller,
            readOnly: widget.readOnly,
            keyboardType:
                widget.isNumberBox ? TextInputType.number : widget.keyboardType,
            onChanged: widget.onChanged,
            enabled: widget.isEnabled,
            cursorColor: widget.overAllColor != null
                ? widget.overAllColor!
                : widget.borderColor,
            style: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return const TextStyle(
                    color: Colors.black,
                  );
                } else {
                  return TextStyle(
                      color: widget.overAllColor != null
                          ? widget.overAllColor!
                          : widget.textColor);
                }
              },
            ),
            // textInputAction: TextInputAction.,
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              suffixIcon: widget.suffix,
              counterText: '',
              hintText: widget.hint ?? "",
              alignLabelWithHint: false,
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
        ),
      ],
    );
  }
}
