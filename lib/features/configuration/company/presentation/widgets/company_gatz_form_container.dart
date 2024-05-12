import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import '../../../../../core/presentation/widgets/bootstrap/text_box_bootstrap.dart';
import '../../../../../core/presentation/widgets/check_box_with_controller/check_box_controller.dart';
import '../../../../../core/presentation/widgets/check_box_with_controller/custom_check_box_with_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompanyGAZTFormContainer extends StatelessWidget {

  final TextEditingController buildingNoController;
  final TextEditingController additionalNoController;
  final TextEditingController postalController;
  final TextEditingController streetNameEnglishController;
  final TextEditingController streetNameArabicController;
  final TextEditingController districtEnglishController;
  final TextEditingController districtArabicController;
  final TextEditingController cityArabicController;
  final TextEditingController cityEnglishController;
  final TextEditingController countryEnglishController;
  final TextEditingController countryArabicController;
  final TextEditingController secondBusinessIdController;
  final TextEditingController secondBusinessIdTypeController;

  final CustomCheckboxController useDifferentLogoController;





  const CompanyGAZTFormContainer({
    super.key,
    required this.buildingNoController,
    required this.additionalNoController,
    required this.postalController,
    required this.streetNameEnglishController,
    required this.streetNameArabicController,
    required this.districtEnglishController,
    required this.districtArabicController,
    required this.cityArabicController,
    required this.cityEnglishController,
    required this.countryEnglishController,
    required this.countryArabicController,
    required this.secondBusinessIdController,
    required this.secondBusinessIdTypeController,
    required this.useDifferentLogoController,

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
                Row(
                  children: [
                    Expanded(
                      child: TextBoxBootstrap(
                        hint: "",
                      
                        label: appLocalizations.building_number,
                      
                        textFiledWidth: 200,
                        controller: buildingNoController,
                      ),
                    ),
                    SizedBox(width: 5,),
                    
                    Expanded(
                      child: TextBoxBootstrap(
                        hint: "",
                        keyboardType: TextInputType.number,
                        label: appLocalizations.additional_number,
                      
                        textFiledWidth: 100,
                         controller: additionalNoController,
                      ),
                    ),
                    SizedBox(width: 5,),


                    Expanded(
                      child: TextBoxBootstrap(
                        label: appLocalizations.postal_code,
                        controller: postalController,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextBoxBootstrap(
                        label: appLocalizations.street_Eng,
                         controller: streetNameEnglishController,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextBoxBootstrap(
                        label: appLocalizations.street_Arb,
                         controller: streetNameArabicController,
                        isArabic: true,

                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextBoxBootstrap(
                        label: appLocalizations.district_Eng,
                         controller: districtEnglishController,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextBoxBootstrap(
                        label: appLocalizations.district_Arb,
                           controller: districtArabicController,
                        isArabic: true,

                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextBoxBootstrap(
                        label: appLocalizations.city_Arb,
                        controller: cityArabicController,
                        isArabic: true,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextBoxBootstrap(
                        label: appLocalizations.city_Eng,
                        controller: cityEnglishController,
                      ),
                    ),
                  ],
                ),



                Row(
                  children: [
                    Expanded(
                      child: TextBoxBootstrap(
                        label: appLocalizations.country_Eng,
                           controller: countryEnglishController,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextBoxBootstrap(
                        label: appLocalizations.country_Arb,
                           controller: countryArabicController,
                        isArabic: true,

                      ),
                    ),
                  ],
                ),

                TextBoxBootstrap(
                  label: appLocalizations.second_business_id,
                     controller: secondBusinessIdController,
                ),
                TextBoxBootstrap(
                  label: appLocalizations.second_business_id_type,
                     controller: secondBusinessIdTypeController,
                ),

                // Label(text: "Company Icon Location 80 mml" ),
                // Label(text: "Company Icon Location A4" ),

                CustomCheckboxWithController(
                  label: appLocalizations.use_different_logo_for_A4,
                 controller: useDifferentLogoController,
                ),




              ],
            ),
          ),

        ],
      ),
    );
  }
}
