import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/card.dart';
import '../../../../../core/presentation/widgets/label.dart';
import 'package:InvoiceF/core/presentation/widgets/text_box.dart';


class UnitCard extends StatefulWidget {
  final TextEditingController reference;
  final TextEditingController aName;
  final TextEditingController eName;
  const UnitCard({
    super.key,
    required this.reference,
    required this.aName,
    required this.eName,
  });

  @override
  State<UnitCard> createState() => _UnitCardState();
}

class _UnitCardState extends State<UnitCard> {
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
                text: 'Reference',
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
              const Label(text: 'Arabic Name', color: AppColors.primaryColor),
              TextBox(
                labelWidth: width,
                controller: widget.aName,
                isEnabled: false,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(text: 'English Name', color: AppColors.primaryColor),
              TextBox(
                labelWidth: width,
                controller: widget.eName,
                isEnabled: false,
              )
            ],
          ),
        ],
      ),
    );
  }
}
