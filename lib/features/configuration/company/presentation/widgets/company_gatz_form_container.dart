import 'package:flutter/cupertino.dart';
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
                TextBoxBootstrap(
                  hint: "",

                  label: appLocalizations.building_number,

                  textFiledWidth: 200,
                  controller: buildingNoController,
                ),

                TextBoxBootstrap(
                  hint: "",
                  keyboardType: TextInputType.number,
                  label: appLocalizations.additional_number,

                  textFiledWidth: 100,
                   controller: additionalNoController,
                ),

                TextBoxBootstrap(
                  label: appLocalizations.postal_code,
                  controller: postalController,
                ),

                TextBoxBootstrap(
                  label: appLocalizations.street_Eng,
                   controller: streetNameEnglishController,
                ),

                TextBoxBootstrap(
                  label: appLocalizations.street_Arb,
                   controller: streetNameArabicController,
                ),

                TextBoxBootstrap(
                  label: appLocalizations.district_Eng,
                   controller: districtEnglishController,
                ),
                TextBoxBootstrap(
                  label: appLocalizations.district_Arb,
                     controller: districtArabicController,
                ),
                TextBoxBootstrap(
                  label: appLocalizations.city_Arb,
                     controller: cityArabicController,
                ),
                TextBoxBootstrap(
                  label: appLocalizations.city_Eng,
                     controller: cityEnglishController,
                ),
                TextBoxBootstrap(
                  label: appLocalizations.country_Eng,
                     controller: countryEnglishController,
                ),
                TextBoxBootstrap(
                  label: appLocalizations.country_Arb,
                     controller: countryArabicController,
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
