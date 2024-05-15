import 'package:InvoiceF/core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import 'package:InvoiceF/core/presentation/widgets/dropdown_with_controller/custom_dropdown_with_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/entities/them_entity.dart';


class UserOptionsContainer extends StatelessWidget {

  final CustomDropdownController startPageDropdownController;
  final CustomDropdownController startListThemeDropdownController;
  final List<ThemeEntity> themeList;

  final AppLocalizations appLocalizations;

  const UserOptionsContainer({
    super.key,
    required this.startPageDropdownController,
    required this.startListThemeDropdownController,
    required this.appLocalizations,
    required this.themeList
  });

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child:  FB5Row(
        classNames: 'px-xs-3 px-lg-custom-10 mt-3 ',
        children: [
        FB5Col(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              CustomDropdownWithController(
                title:  appLocalizations.start_page_theme,
                  controller: startPageDropdownController,
                items: themeList.map((theme) {
                  return DropdownMenuItem(
                    value: theme.themeNumber,
                      child: Text(theme.codeName)
                  );

                }).toList(),
                onChanged:(value) {},


              ),
              const SizedBox(height: 20,),
              CustomDropdownWithController(
               title:  appLocalizations.start_List_theme,
                  items: themeList.map((theme) {
                    return DropdownMenuItem(
                        value: theme.themeNumber,
                        child: Text(theme.codeName)
                    );

                  }).toList(),
                  controller:  startListThemeDropdownController,
                onChanged:(value) {},

              )


            ],
          ),
        )
        ],


      )
    );
  }
}
