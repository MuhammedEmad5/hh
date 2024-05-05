import 'package:InvoiceF_Bills/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import '../date_picker.dart';
import '../label.dart';
import 'date_picker_controller.dart';

class DatePickerWithController extends StatefulWidget {
  final Function(DateTime?) onChanged;
  final DatePickerController controller;
  final String? label;

  const DatePickerWithController({
    Key? key,
    required this.onChanged,
    required this.controller,
    this.label,
  }) : super(key: key);

  @override
  _DatePickerWithControllerState createState() => _DatePickerWithControllerState();
}

class _DatePickerWithControllerState extends State<DatePickerWithController> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    _updateControllerText(); // Set initial text in the controller
    widget.controller.addListener(_handleControllerValueChanged); // Listen to controller changes
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerValueChanged);
    super.dispose();
  }

  void _handleControllerValueChanged() {
    _updateControllerText(); // Update text in the controller when value changes
    setState(() {}); // Trigger widget rebuild
  }

  void _updateControllerText() {
    if (widget.controller.value != null) {
      controller.text = context.formatDateString(widget.controller.value!.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FB5Row(
      children: [
        FB5Col(
          classNames: 'col-xs-12 col-sm-6 py-1',
          child: widget.label != null
              ? Label(
            text: widget.label!,
            color: Colors.black,
          )
              : const SizedBox(),
        ),
        FB5Col(
          classNames: 'col-xs-12 col-sm-6 py-1',
          child: TextField(
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.date_range),
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1850),
                    lastDate: DateTime(2150),
                    initialDate: widget.controller.value ?? DateTime.now(),
                  );
                  if (selectedDate != null) {
                    widget.controller.setDate(selectedDate);
                    widget.onChanged(selectedDate); // Notify parent about the selected date
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
