import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/card.dart';
import '../../../../../core/presentation/widgets/label.dart';
import 'package:InvoiceF/core/presentation/widgets/text_box.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class UnitCard extends StatelessWidget {
  final TextEditingController reference;
  final TextEditingController aName;
  final TextEditingController eName;
  final AppLocalizations appLocalizations;
  const UnitCard({
    super.key,
    required this.reference,
    required this.aName,
    required this.eName,
    required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    final width = responsiveValue<double>(context,
        defaultValue: 200.0, md: 425.0, xl: 700.0);
    return CustomCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(
                text: appLocalizations.reference,
                color: AppColors.primaryColor,
              ),
              TextBox(
                labelWidth: width,
                isEnabled: false,
                controller: reference,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Label(text: appLocalizations.arabic_name, color: AppColors.primaryColor),
              TextBox(
                labelWidth: width,
                controller: aName,
                isEnabled: false,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(text: appLocalizations.english_name, color: AppColors.primaryColor),
              TextBox(
                labelWidth: width,
                controller: eName,
                isEnabled: false,
              )
            ],
          ),
        ],
      ),
    );
  }
}
