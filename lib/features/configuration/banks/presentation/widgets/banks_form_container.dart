import 'package:InvoiceF/core/presentation/widgets/bootstrap/text_box_bootstrap.dart';
import 'package:InvoiceF/core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import 'package:InvoiceF/core/presentation/widgets/dropdown_with_controller/custom_dropdown_with_controller.dart';
import 'package:InvoiceF/core/presentation/widgets/form_navigator_with_controller/form_navigator_with_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/presentation/widgets/form_navigation.dart';
import '../../../../../core/presentation/widgets/form_navigator_with_controller/form_navigator_controller.dart';

class BanksFormContainer extends StatelessWidget {
  final TextEditingController bankNumberController;
  final TextEditingController arabicNameController;
  final TextEditingController englishNameController;
  final FormNavigationController formNavigationController;
  final AppLocalizations appLocalizations;
  final void Function(int) onNavigatorChanged;


  const BanksFormContainer({
      super.key,
    required this.bankNumberController,
      required this.arabicNameController,
      required this.englishNameController,
      required this.appLocalizations,
      required this.formNavigationController,
        required this.onNavigatorChanged
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
              child: FB5Row(
            classNames: 'px-xs-3 px-lg-custom-10 mt-3 ',
            children: [
              FB5Col(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBoxBootstrap(
                      label: appLocalizations.bank_account,
                      controller: bankNumberController,
                      isNumberBox: true,
                      readOnly: true,
                    ),
                    TextBoxBootstrap(
                      label: appLocalizations.arabic_name,
                      controller: arabicNameController,
                      isArabic: true,
                    ),
                    TextBoxBootstrap(
                      label: appLocalizations.english_name,
                      controller: englishNameController,
                    )
                  ],
                ),
              )
            ],
          )),
        ),
        FB5Col(
          classNames: 'mb-5',
          child: FormNavigationWithController(
            onChanged: onNavigatorChanged,
            controller: formNavigationController,
          ),
        ),
      ],
    );
  }
}
