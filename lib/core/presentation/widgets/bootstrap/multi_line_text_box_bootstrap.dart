import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

import '../../../constants/colors.dart';
import '../label.dart';


class MultiLineTextBoxBootStrap extends StatefulWidget {
  final Function(String)? onChanged;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final TextInputType? keyboardType;
  final bool readOnly;
  final double height;

  const MultiLineTextBoxBootStrap({
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
  State<MultiLineTextBoxBootStrap> createState() => _MultiLineTextBoxBootStrapState();
}

class _MultiLineTextBoxBootStrapState extends State<MultiLineTextBoxBootStrap> {
  @override
  Widget build(BuildContext context) {
    return FB5Row(
      classNames: 'col-xs-12 col-sm-6   py-1 ',

      children: [
        FB5Col(
          classNames: 'col-xs-12 col-sm-6   py-sm-5 ',
          child:    Column(
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
            ],
          ),

        ),

        FB5Col(
          classNames: 'col-xs-12 col-sm-6 py-1 ',
          child: Container(

            height: widget.height,
            child: TextField(
              controller: widget.controller,
              cursorColor: AppColors.primaryColor,
              maxLength: widget.maxLength,
              maxLines: 5,
              decoration: InputDecoration(
                fillColor: Colors.white,
                  filled: true,
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
        ),
      ],
    );
  }
}
