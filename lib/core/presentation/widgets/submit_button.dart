import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class SubmitButton extends StatefulWidget {
  final bool isExpanded;
  final SubmitButtonController controller;
  final String title;
  final Function onPressed;
  final Color? textColor;
  final Color? color;

  final double? buttonHeight;
  const SubmitButton({
    super.key,
    required this.onPressed,
    required this.controller,
    this.color,
    this.textColor,
    this.isExpanded = false,
    this.title = 'Submit',
    this.buttonHeight
  });

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  late ButtonState btnState = ButtonState.normal;

  @override
  void initState() {
    super.initState();
    widget.controller._state.addListener(() {
      setState(() {
        btnState = widget.controller.state;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose(); // Dispose the controller if provided
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: widget.buttonHeight ?? 65,
      onPressed: () {
        if (widget.controller.state != ButtonState.loading) {
          setState(() {
            widget.controller.state = ButtonState.loading;
          });
          widget.onPressed();
        }
      },
      minWidth: widget.isExpanded ? double.infinity : null,
      color: widget.color ?? AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: widget.controller.state == ButtonState.loading
              ? const CircularProgressIndicator(
                  color: AppColors.onButton,
                )
              : widget.controller.state == ButtonState.success
                  ? const CircleAvatar(
                      backgroundColor: AppColors.onButton,
                      radius: 19,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.done,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  : Text(
                      widget.title,
                      style: TextStyle(
                        color: widget.textColor ?? AppColors.onButton,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
        ),
      ),
    );
  }
}

enum ButtonState { normal, loading, success }

class SubmitButtonController {
  final _state = ValueNotifier<ButtonState>(ButtonState.normal);

  ButtonState get state => _state.value;

  set state(ButtonState value) => _state.value = value;

  void reset() {
    state = ButtonState.normal;
  }

  void success() {
    state = ButtonState.success;
  }

  void dispose() {
    _state.dispose();
  }
}
