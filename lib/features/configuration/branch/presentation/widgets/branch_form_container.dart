import 'package:flutter/cupertino.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/presentation/widgets/bootstrap/multi_line_text_box_bootstrap.dart';
import '../../../../../core/presentation/widgets/bootstrap/text_box_bootstrap.dart';

class BranchFormContainer extends StatelessWidget {

  final TextEditingController branchTextController;
  final TextEditingController clientTextController;
  final TextEditingController nameArabicTextController;
  final TextEditingController descriptionArabicTextController;
  final TextEditingController nameEnglishTextController;
  final TextEditingController descriptionEnglishTextController;
  final TextEditingController notesTextController;
  final TextEditingController addressTextController;
  late AppLocalizations appLocalizations;

   BranchFormContainer({
    super.key,
    required this.branchTextController,
    required this.clientTextController,
    required this.nameArabicTextController,
    required this.descriptionArabicTextController,
    required this.nameEnglishTextController,
    required this.descriptionEnglishTextController,
    required this.notesTextController,
    required this.addressTextController
  });

  @override
  Widget build(BuildContext context) {

    appLocalizations =AppLocalizations.of(context)!;

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
                  initialValue: branchTextController.text,
                  keyboardType:
                  const TextInputType.numberWithOptions(
                      decimal: true),
                  label: appLocalizations.branch,
                  readOnly: true,
                  textFiledWidth: 200,
                  controller: branchTextController,
                ),

                TextBoxBootstrap(
                  hint: "",
                  initialValue: clientTextController.text,
                  keyboardType: TextInputType.number,
                  label: appLocalizations.user_number,
                  readOnly: true,
                  textFiledWidth: 100,
                  controller: clientTextController,
                ),

                TextBoxBootstrap(
                  label:appLocalizations.arabic_name,
                  controller: nameArabicTextController,
                ),

                TextBoxBootstrap(
                  label: appLocalizations.arabic_description,
                  controller: descriptionArabicTextController,
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
    );
  }
}
