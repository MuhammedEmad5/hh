import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'check_box_controller.dart';

class CustomCheckboxWithController extends StatefulWidget {
  final String label;
  final CustomCheckboxController controller; // Use CheckboxController
  final Color? color;
  final bool isExpanded;

  const CustomCheckboxWithController({
    Key? key,
    required this.label,
    required this.controller,
    this.color,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  _CustomCheckboxWithControllerState createState() => _CustomCheckboxWithControllerState();
}

class _CustomCheckboxWithControllerState extends State<CustomCheckboxWithController> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateValue);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateValue);
    super.dispose();
  }

  void _updateValue() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Checkbox(
          activeColor: widget.color ?? Theme.of(context).primaryColor,
          value: widget.controller.value, // Use controller's value
          onChanged: (newValue) {
            // Update the controller's value when checkbox changes
            widget.controller.value = newValue ?? false;
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
