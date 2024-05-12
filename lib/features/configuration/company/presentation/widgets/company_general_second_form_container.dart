import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/presentation/widgets/bootstrap/multi_line_text_box_bootstrap.dart';
import '../../../../../core/presentation/widgets/bootstrap/text_box_bootstrap.dart';
import '../../../../../core/presentation/widgets/check_box_with_controller/check_box_controller.dart';
import '../../../../../core/presentation/widgets/check_box_with_controller/custom_check_box_with_controller.dart';

class CompanyGeneralSecondFormContainer extends StatelessWidget {

  final TextEditingController telephone2Controller;
  final TextEditingController officialEnglishNameController;
  final TextEditingController officialArabicNameController;
  final TextEditingController targetController;
  final TextEditingController noteController;

 final CustomCheckboxController showHeaderInfoReportController;
 final CustomCheckboxController includeBranchNameController;




  const CompanyGeneralSecondFormContainer({
    super.key,
    required this.telephone2Controller,
    required this.officialEnglishNameController,
    required this.officialArabicNameController,
    required this.targetController,
    required this.noteController,
    required this.showHeaderInfoReportController,
    required this.includeBranchNameController,


  });

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

                  label: appLocalizations.telephone2,
                  readOnly: true,
                  textFiledWidth: 200,
                  controller: telephone2Controller,
                ),



                TextBoxBootstrap(
                  label: appLocalizations.official_arabic_name,
                   controller: officialArabicNameController,
                ),

                TextBoxBootstrap(
                  hint: "",
                  keyboardType: TextInputType.number,
                  label: appLocalizations.official_english_name,
                  readOnly: true,
                  textFiledWidth: 100,
                  controller: officialEnglishNameController,
                ),

                CustomCheckboxWithController(
                  label: appLocalizations.show_header_info_report,
                  controller: showHeaderInfoReportController,

                ),

                CustomCheckboxWithController(
                  label: appLocalizations.include_branch_name,
                  controller: includeBranchNameController,

                ),


                MultiLineTextBoxBootStrap(
                  label: appLocalizations.target,
                   controller: targetController,
                ),
                MultiLineTextBoxBootStrap(
                  label: appLocalizations.note,
                     controller: noteController,
                ),




              ],
            ),
          ),

        ],
      ),
    );
  }
}
