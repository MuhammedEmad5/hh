import 'package:InvoiceF/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/presentation/widgets/dropdown_search.dart';

class DeviceOptionDropdownWidget extends StatelessWidget {
  const DeviceOptionDropdownWidget({super.key, required this.appLocalizations});
  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch(
      label: appLocalizations.data_filter,
      labelColor: AppColors.primaryColor,
      initialValue: appLocalizations.all,
      items: [
      appLocalizations.all,
      appLocalizations.today,
      appLocalizations.from_yesterday,
      appLocalizations.from_7_days,
      appLocalizations.from_30_days,
      appLocalizations.from_year_days,
      appLocalizations.from_365_days,
      appLocalizations.custom
      ],
      onChanged: (String value) {
      }
      ,

    );
  }
}
