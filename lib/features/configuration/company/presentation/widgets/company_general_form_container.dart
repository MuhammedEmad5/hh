
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

import '../../../../../core/presentation/widgets/bootstrap/text_box_bootstrap.dart';
import '../../../../../core/presentation/widgets/date_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/presentation/widgets/date_picker_with_controller/date_picker_controller.dart';
import '../../../../../core/presentation/widgets/date_picker_with_controller/date_picker_with_controller.dart';

class CompanyGeneralFormContainer extends StatelessWidget {
  final TextEditingController businessNoController;
  final TextEditingController companyNoController;
  final TextEditingController arabicNameController;
  final TextEditingController englishNameController;
  final TextEditingController telephone1Controller;
  final TextEditingController addressController;
  final DatePickerController establishDatePickerController ;


   const CompanyGeneralFormContainer(
      {super.key,
      required this.businessNoController,
      required this.companyNoController,
      required this.arabicNameController,
      required this.englishNameController,
      required this.telephone1Controller,
      required this.addressController,
        required this.establishDatePickerController});

  @override
  Widget build(BuildContext context) {

    AppLocalizations appLocalizations = AppLocalizations.of(context)!;


    return SingleChildScrollView(
      child: FB5Row(
        classNames: 'px-xs-3 px-lg-custom-10 mt-3 ',
        children: [
          FB5Col(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBoxBootstrap(
                  hint: "",
                  initialValue: businessNoController.text,
                  label: appLocalizations.business_registration_number,
                  textFiledWidth: 200,
                  controller: businessNoController,
                ),
                TextBoxBootstrap(
                  hint: "",
                  initialValue: companyNoController.text,
                  keyboardType: TextInputType.number,
                  label: appLocalizations.company_number,
                  readOnly: true,
                  textFiledWidth: 100,
                  controller: companyNoController,
                ),
                TextBoxBootstrap(
                  label: appLocalizations.arabic_name,
                  controller: arabicNameController,
                ),
                TextBoxBootstrap(
                  label: appLocalizations.english_name,
                  controller: englishNameController,
                ),
                DatePickerWithController(
                  label: appLocalizations.date_establishment,
                  onChanged: (date ) {

                  },
                  controller: establishDatePickerController,

                )
                ,

                TextBoxBootstrap(
                  label: appLocalizations.telephone1,
                  controller: telephone1Controller,
                  keyboardType: TextInputType.number,
                ),
                TextBoxBootstrap(
                  label: appLocalizations.address,
                  controller: addressController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
