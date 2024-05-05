import 'package:InvoiceF/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF/features/configuration/user_options/presentation/widgets/user_options_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';

class UserOptionView extends StatefulWidget {
  const UserOptionView({super.key});

  @override
  State<UserOptionView> createState() => _UserOptionViewState();
}

class _UserOptionViewState extends State<UserOptionView> {
  late CustomDropdownController startPageDropdownController;
  late CustomDropdownController startListThemeDropdownController;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
    startListThemeDropdownController = CustomDropdownController();
    startPageDropdownController = CustomDropdownController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    startListThemeDropdownController.dispose();
    startPageDropdownController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(
        onSavePressed: (){},
        title: appLocalizations.user_options,
        saveBtnColor: Colors.white,
        color: AppColors.primaryColor,
        textColor: Colors.white,
      ),
      body: Column(
        children: [

          Expanded(child: UserOptionsContainer(
              startPageDropdownController: startPageDropdownController,
              startListThemeDropdownController: startListThemeDropdownController,
              appLocalizations: appLocalizations
          ))


        ],
      ),
    );
  }
}
