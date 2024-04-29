import 'package:flutter/material.dart';

import '../../constants/colors.dart';

Future<void> showAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
  required Function onAgree,
}) async {
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
              'Cancel',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Yes',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onPressed: () {
              onAgree();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
