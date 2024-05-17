import 'package:InvoiceF/core/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/dropdown_search.dart';

class DeviceOptionDropdownWidget extends StatelessWidget {
  const DeviceOptionDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch(
      label: 'Data Filter',
      labelColor: AppColors.primaryColor,
      size: 16,
      initialValue: 'All',
      items: const [
        'All',
        'Today',
        'From Yesterday',
        'From 7 Days',
        'From 30 Days',
        'From Year Days',
        'From 365 Days'
        'Custom'
      ],
      onChanged: (String value) {
        print(value);
      }
      ,

    );
  }
}
