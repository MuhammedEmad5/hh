import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import 'label.dart';

class DropDownController<T> extends ValueNotifier<T?> {
  DropDownController([T? value]) : super(value);

  void setValue(T? newValue) {
    value = newValue;
    notifyListeners();
  }
}

class DropDown<T> extends StatefulWidget {
  final List<String> items;
  final double? width;
  final Function(dynamic)? onChanged;
  final String? initialValue;
  final String? label;
  final Color? labelColor;
  final Color? overAllColor;
  final DropDownController<T>? controller;
  const DropDown({
    super.key,
    this.width,
    this.label,
    required this.items,
    this.onChanged,
    this.controller,
    this.initialValue,
    this.overAllColor,
    this.labelColor,
  });

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<DropdownMenuItem<String>> items = [];

  @override
  void initState() {
    super.initState();
    items = widget.items
        .map((String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        widget.label == null
            ? SizedBox()
            : Label(
                text: widget.label ?? '',
                color: widget.labelColor ?? widget.overAllColor,
              ),
        SizedBox(
          height: widget.label != null ? 10 : 0,
        ),
        SizedBox(
          width: widget.width,
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            iconEnabledColor: widget.overAllColor,
            dropdownColor:
                widget.overAllColor != null ? AppColors.primaryColor : null,
            style: widget.overAllColor != null
                ? TextStyle(
                    color: widget.overAllColor, overflow: TextOverflow.ellipsis)
                : null,
            value: widget.initialValue ?? widget.controller?.value,
            decoration: InputDecoration(
              enabledBorder: widget.overAllColor != null
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.overAllColor!.withAlpha(150), width: 2),
                      borderRadius: BorderRadius.circular(12),
                    )
                  : null,
              focusedBorder: widget.overAllColor != null
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.overAllColor!.withAlpha(150), width: 2),
                      borderRadius: BorderRadius.circular(12),
                    )
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: items,
            onChanged: widget.onChanged ??
                (value) {
                  if (widget.controller != null) {
                    widget.controller?.setValue(value);
                  }
                },
          ),
        )
      ]),
    );
  }
}
