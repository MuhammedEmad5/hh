import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomCheckbox extends StatefulWidget {
  final String label;
  final Function(bool) onChanged;
  final bool initialValue;
  final Color? color;
  final bool isExpanded;
  final bool isEnabled;
  const CustomCheckbox({
    super.key,
    this.isExpanded = false,
    required this.label,
    this.initialValue = false,
    required this.onChanged,
    this.color,
    this.isEnabled = true,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Checkbox(
          visualDensity: VisualDensity.compact,
          activeColor: widget.color ?? AppColors.primaryColor,
          value: _isChecked,
          onChanged: (bool? value) {
            if (widget.isEnabled) {
              setState(() {
                _isChecked = value!;
                widget.onChanged(value);
              });
            }
          },
        ),
        Text(
          widget.label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(width: widget.isExpanded ? double.infinity : null),
      ],
    );
  }
}
