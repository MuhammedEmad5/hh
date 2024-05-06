import 'package:InvoiceF/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF/core/presentation/widgets/form_navigator_with_controller/form_navigator_controller.dart';
import 'package:InvoiceF/features/configuration/banks/presentation/widgets/banks_form_container.dart';
import 'package:InvoiceF/features/configuration/user_options/presentation/widgets/user_options_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';

class BanksView extends StatefulWidget {
  const BanksView({super.key});

  @override
  State<BanksView> createState() => _BanksViewState();
}

class _BanksViewState extends State<BanksView> {
  late TextEditingController arabicNameController;
  late TextEditingController englishNameController;

  late FormNavigationController formNavigationController;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
    arabicNameController = TextEditingController();
    englishNameController = TextEditingController();
    formNavigationController = FormNavigationController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    arabicNameController.dispose();
    englishNameController.dispose();
    formNavigationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onSavePressed: () {},
        title: appLocalizations.banks,
        saveBtnColor: Colors.white,
        color: AppColors.primaryColor,
        textColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
              child: BanksFormContainer(
                  arabicNameController: arabicNameController,
                  englishNameController: englishNameController,
                  formNavigationController: formNavigationController,
                  appLocalizations: appLocalizations

              ))
        ],
      ),
    );
  }
}
