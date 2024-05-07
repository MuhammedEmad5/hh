import 'package:InvoiceF/core/presentation/widgets/label.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../enums/date_time_enum.dart';

class DatePicker extends StatefulWidget {
  final Function(String) onChanged;
  final DateTimeEnum? type; // 0 date, 1 time, 2 both
  final String? initialValue;
  final String? label;
  final Color? labelColor;
  const DatePicker({
    super.key,
    required this.onChanged,
    this.type = DateTimeEnum.date,
    this.initialValue,
    this.label,
    this.labelColor,
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.initialValue != null) {
      controller.text = widget.initialValue!;
    }
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.type == DateTimeEnum.dateAndTime ? 225 : 150,
      // height: 75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Label(
                  text: widget.label!,
                  color: widget.labelColor,
                )
              : const SizedBox(),
          SizedBox(
            height: widget.label != null ? 10 : 0,
          ),
          TextField(
            controller: controller,
            keyboardType: widget.type == DateTimeEnum.date
                ? TextInputType.datetime
                : null,
            maxLength: widget.type == DateTimeEnum.date
                ? 10
                : widget.type == DateTimeEnum.time
                    ? 8
                    : 20,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.date_range,
                  color: AppColors.primaryColor,
                ),
                onPressed: () async {
                  if (widget.type == DateTimeEnum.date) {
                    var date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1850),
                        lastDate: DateTime(2150));
                    controller.text = date.toString().substring(0, 10);
                    widget.onChanged(date.toString().substring(0, 10));
                  } else if (widget.type == DateTimeEnum.time) {
                    var time = await showTimePicker(
                      context: context,
                      initialTime: const TimeOfDay(hour: 0, minute: 0),
                    );
                    String period = time!.period == DayPeriod.am ? 'AM' : 'PM';
                    String formattedTime =
                        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $period';
                    controller.text = formattedTime;
                    widget.onChanged(formattedTime);
                  } else if (widget.type == DateTimeEnum.dateAndTime) {
                    var date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1850),
                        lastDate: DateTime(2150));
                    var time = await showTimePicker(
                      context: context,
                      initialTime: const TimeOfDay(hour: 0, minute: 0),
                    );
                    String period = time!.period == DayPeriod.am ? 'AM' : 'PM';
                    String formattedTime =
                        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $period';
                    controller.text =
                        '${date.toString().substring(0, 10)} $formattedTime';

                    widget.onChanged(
                        '${date.toString().substring(0, 10)} $formattedTime');
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
