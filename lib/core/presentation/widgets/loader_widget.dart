import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Loader extends StatelessWidget {
  final bool showText;
  final Color? loaderColor;

  final double? strokeWidth;

  late AppLocalizations appLocalizations;

   Loader({
    Key? key, this.showText = true,
    this.loaderColor, this.strokeWidth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Center(
          child: CircularProgressIndicator(
            color: loaderColor ?? AppColors.primaryColor,
            strokeWidth: strokeWidth ??  8,
          ),
        ),
        const SizedBox(height: 16),
        if (showText)
           Text(
            appLocalizations.loading,
            style: const TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }
}
