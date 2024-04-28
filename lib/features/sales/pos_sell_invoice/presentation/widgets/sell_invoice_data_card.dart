import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/card.dart';
import '../../../../../core/presentation/widgets/label.dart';
import '../../../../../core/presentation/widgets/text_icon_button.dart';

class SellInvoiceDataCard extends StatelessWidget {
  const SellInvoiceDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Label(text: 'Invoice # 4'),
            Label(
                text:
                    '${DateTime.now().toString().substring(0, 10)} ${TimeOfDay.now().toString().substring(10, 15)}')
          ],
        ),
        const SizedBox(height: 10),
        const Label(text: 'Arabic Name'),
        const Label(text: 'English Name'),
        const Label(text: '+201234567890'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Label(text: '500.5'),
            TextIconButton(
              title: 'Details',
              icon: Icons.description,
              onTap: () {},
              iconColor: AppColors.primaryColor,
              textColor: AppColors.primaryColor,
            )
          ],
        ),
      ],
    ));
  }
}
