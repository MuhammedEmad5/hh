import 'package:InvoiceF_Configuration/core/presentation/widgets/bootstrap/text_box_bootstrap.dart';
import 'package:InvoiceF_Configuration/core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import 'package:InvoiceF_Configuration/core/presentation/widgets/dropdown_with_controller/custom_dropdown_with_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/presentation/widgets/form_navigation.dart';


class BanksFormContainer extends StatelessWidget {

  final TextEditingController arabicNameController;
  final TextEditingController englishNameController;

  final AppLocalizations appLocalizations;

  const BanksFormContainer({
    super.key,
    required this.arabicNameController,
    required this.englishNameController,
    required this.appLocalizations
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child:  FB5Row(
              classNames: 'px-xs-3 px-lg-custom-10 mt-3 ',
              children: [
              FB5Col(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    TextBoxBootstrap(

                      label:  appLocalizations.arabic_name,
                        controller: arabicNameController,



                    ),
                    TextBoxBootstrap(
                     label:  appLocalizations.english_name,
                        controller:  englishNameController,


                    )


                  ],
                ),
              )
              ],


            )
          ),
        ),
        FB5Col(
          classNames: 'mb-5',
          child: FormNavigationW(
            length: productList.length,
            onChanged: (index) {
              updateTextFields(productList[index - 1]);
            },
          ),
        ),
      ],
    );
  }
}
