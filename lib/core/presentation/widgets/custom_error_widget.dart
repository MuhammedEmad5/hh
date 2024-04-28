import 'package:InvoiceF_Sales/core/presentation/widgets/toast_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? errorMessage;
  const CustomErrorWidget({Key? key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context != null) {
        showToast(
            context: context,
            message: errorMessage ?? "Undefined Error",
            backgroundColor: AppColors.redColor);
      }
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Icon(
            Icons.error_outline,
            size: 100,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          width: 250,
          child: Text(
            errorMessage ?? "Unpredictable Error",
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        )
      ],
    );
  }
}
