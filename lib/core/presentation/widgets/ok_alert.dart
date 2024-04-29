import 'package:flutter/material.dart';

import '../../constants/colors.dart';

Future<void> showOKDialog({
  required BuildContext context,
  required String title,
  required String message,
  Function? onOkPressed,
}) async {
  bool pressedOk = false;
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(message),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              onOkPressed != null ? onOkPressed() : null;
              pressedOk = true;
            },
          ),
        ],
      );
    },
  ).whenComplete(() {
    if (!pressedOk) {
      onOkPressed != null ? onOkPressed() : null;
    }
  });
}
