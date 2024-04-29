import 'package:flutter/material.dart';

class NumberBox extends StatefulWidget {
  final TextEditingController? controller;
  final int? maxLength;
  final Function(String)? onChanged;
  final double? width;
  final String? initialValue;
  final bool isEnabled;
  const NumberBox({
    super.key,
    this.initialValue,
    this.width,
    this.controller,
    this.maxLength,
    this.onChanged,
    this.isEnabled = true,
  });

  @override
  State<NumberBox> createState() => _NumberBoxState();
}

class _NumberBoxState extends State<NumberBox> {
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: widget.width,
            child: TextField(
              enabled: widget.isEnabled,
              maxLines: 1,
              maxLength: widget.maxLength,
              controller: controller,
              style: MaterialStateTextStyle.resolveWith(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return const TextStyle(
                      color: Colors.black,
                    );
                  } else {
                    return const TextStyle(color: null);
                  }
                },
              ),
              keyboardType: TextInputType.number,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                counterText: '',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
