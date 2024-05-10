import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/card.dart';
import '../../../../../core/presentation/widgets/label.dart';
import 'package:InvoiceF/core/presentation/widgets/text_box.dart';

class CompanyUnitCard extends StatefulWidget {
  final TextEditingController reference;
  final TextEditingController aName;
  final TextEditingController eName;
  const CompanyUnitCard({
    super.key,
    required this.reference,
    required this.aName,
    required this.eName,
  });

  @override
  State<CompanyUnitCard> createState() => _CompanyUnitCardState();
}

class _CompanyUnitCardState extends State<CompanyUnitCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                text: AppLocalizations.of(context)!.reference,
                color: AppColors.primaryColor,
              ),
              TextBox(
                labelWidth: width,
                isEnabled: false,
                controller: widget.reference,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(
                  text: AppLocalizations.of(context)!.arabic_name,
                  color: AppColors.primaryColor),
              TextBox(
                labelWidth: width,
                controller: widget.aName,
                textDirection: TextDirection.rtl,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(
                  text: AppLocalizations.of(context)!.english_name,
                  color: AppColors.primaryColor),
              TextBox(
                labelWidth: width,
                controller: widget.eName,
                textDirection: TextDirection.ltr,
              )
            ],
          ),
        ],
      ),
    );
  }
}
