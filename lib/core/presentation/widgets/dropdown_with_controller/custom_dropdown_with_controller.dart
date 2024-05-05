import 'package:flutter/material.dart';
import 'custom_dropdown_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDropdownWithController<T> extends StatelessWidget {
  final CustomDropdownController<T>? controller;
  final String? title;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T? value)? onChanged;
  final Color? overAllColor;
  final Color? titleColor;

  const CustomDropdownWithController(
      {super.key,
      required this.controller,
      this.title,
      this.items,
      this.onChanged,
      this.overAllColor,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: titleColor ?? Colors.black87,
                ),
          ),
        if (title != null) const SizedBox(height: 10),
        DropdownButtonFormField<T>(
          isDense: true,
          isExpanded: true,
          dropdownColor: Colors.white,
          focusColor: Colors.white,
          value: controller!.value,
          items: items,
          onChanged: onChanged != null
              ? (value) {
                  controller!.setValue(value);
                  if (onChanged != null) onChanged!(value);
                }
              : null,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            enabledBorder: overAllColor != null
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: overAllColor!.withAlpha(150), width: 2),
                    borderRadius: BorderRadius.circular(12),
                  )
                : null,
            focusedBorder: overAllColor != null
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: overAllColor!.withAlpha(150), width: 2),
                    borderRadius: BorderRadius.circular(12),
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
