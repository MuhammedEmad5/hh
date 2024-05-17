import 'package:flutter/material.dart';
import '../../../../../core/presentation/widgets/checkbox.dart';

class DeviceOptionCheckBoxWidget extends StatefulWidget {
  const DeviceOptionCheckBoxWidget({super.key, required this.checked, required this.label});

  final bool checked;
  final String label;

  @override
  _DeviceOptionCheckBoxWidgetState createState() => _DeviceOptionCheckBoxWidgetState();
}

class _DeviceOptionCheckBoxWidgetState extends State<DeviceOptionCheckBoxWidget> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    return CustomCheckbox(
      label: widget.label,
      initialValue: _isChecked,
      onChanged: (v) {
        setState(() {
          _isChecked = v;
        });
        print(_isChecked);
      },
    );
  }
}

