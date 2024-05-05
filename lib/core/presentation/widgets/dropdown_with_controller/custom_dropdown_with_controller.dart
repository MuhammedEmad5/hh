import 'package:flutter/material.dart';
import 'custom_dropdown_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

class CustomDropdownWithController<T> extends StatefulWidget {
  final CustomDropdownController<T>? controller;
  final String? title;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T? value)? onChanged;
  final Color? overAllColor;
  final Color? titleColor;

  const CustomDropdownWithController({
    Key? key,
    required this.controller,
    this.title,
    this.items,
    this.onChanged,
    this.overAllColor,
    this.titleColor,
  }) : super(key: key);

  @override
  _CustomDropdownWithControllerState<T> createState() => _CustomDropdownWithControllerState<T>();
}

class _CustomDropdownWithControllerState<T> extends State<CustomDropdownWithController<T>> {
  late CustomDropdownController<T>? _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller?.addListener(_handleControllerValueChanged);
  }

  @override
  void dispose() {
    _controller?.removeListener(_handleControllerValueChanged);
    super.dispose();
  }

  void _handleControllerValueChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return FB5Row(
      children: [
        FB5Col(
          classNames: 'col-xs-12 col-sm-6   py-1 ',
          child: widget.title != null
              ? Text(
            widget.title!,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: widget.titleColor ?? Colors.black87,
            ),
          )
              : const SizedBox(),
        ),
        FB5Col(
          classNames: 'col-xs-12 col-sm-6 py-1 ',
          child: DropdownButtonFormField<T>(
            isDense: true,
            isExpanded: true,
            dropdownColor: Colors.white,
            focusColor: Colors.white,
            value: _controller!.value,
            items: widget.items,
            onChanged: widget.onChanged != null
                ? (value) {
              _controller!.setValue(value);
              if (widget.onChanged != null) widget.onChanged!(value);
            }
                : null,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
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
          ),
        ),
      ],
    );
  }
}
