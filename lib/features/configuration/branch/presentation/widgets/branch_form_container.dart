import 'package:flutter/cupertino.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/presentation/widgets/bootstrap/multi_line_text_box_bootstrap.dart';
import '../../../../../core/presentation/widgets/bootstrap/text_box_bootstrap.dart';
import '../../../../../core/presentation/widgets/form_navigator_with_controller/form_navigator_controller.dart';
import '../../../../../core/presentation/widgets/form_navigator_with_controller/form_navigator_with_controller.dart';

class BranchFormContainer extends StatelessWidget {

  final TextEditingController branchTextController;
  final TextEditingController clientTextController;
  final TextEditingController nameArabicTextController;
  final TextEditingController descriptionArabicTextController;
  final TextEditingController nameEnglishTextController;
  final TextEditingController descriptionEnglishTextController;
  final TextEditingController notesTextController;
  final TextEditingController addressTextController;
  final AppLocalizations appLocalizations;
  final FormNavigationController formNavigationController;
  final void Function(int) onNavigatorChanged;

   BranchFormContainer({
    super.key,
    required this.branchTextController,
    required this.clientTextController,
    required this.nameArabicTextController,
    required this.descriptionArabicTextController,
    required this.nameEnglishTextController,
    required this.descriptionEnglishTextController,
    required this.notesTextController,
    required this.addressTextController,
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
                      Row(
                        children: [
                          Expanded(
                            flex:2,
                            child: TextBoxBootstrap(
                              hint: "",
                              initialValue: branchTextController.text,
                              keyboardType:
                              const TextInputType.numberWithOptions(
                                  decimal: true),
                              label: appLocalizations.branch,
                              readOnly: true,
                              textFiledWidth: 200,
                              controller: branchTextController,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            flex: 1,
                            child: TextBoxBootstrap(
                              hint: "",
                              initialValue: clientTextController.text,
                              keyboardType: TextInputType.number,
                              label: appLocalizations.user_number,
                              readOnly: true,
                              textFiledWidth: 100,
                              controller: clientTextController,
                            ),
                          ),
                        ],
                      ),

                      TextBoxBootstrap(
                        label:appLocalizations.arabic_name,
                        controller: nameArabicTextController,
                        isArabic: true,

                      ),

                      TextBoxBootstrap(
                        label: appLocalizations.arabic_description,
                        controller: descriptionArabicTextController,
                        isArabic: true,

                      ),

                      TextBoxBootstrap(
                        label: appLocalizations.english_name,
                        controller: nameEnglishTextController,
                      ),

                      TextBoxBootstrap(
                        label: appLocalizations.english_description,
                        controller: descriptionEnglishTextController,
                      ),

                      MultiLineTextBoxBootStrap(
                        label: appLocalizations.note,
                        controller: notesTextController,
                      ),

                      MultiLineTextBoxBootStrap(
                        label: appLocalizations.address,
                        controller: addressTextController,
                      ),


                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
        FB5Col(
          classNames: 'mb-5',
          child: FormNavigationWithController(
            onChanged: onNavigatorChanged,
            controller: formNavigationController,
          ),
        )

      ],
    );
  }
}
