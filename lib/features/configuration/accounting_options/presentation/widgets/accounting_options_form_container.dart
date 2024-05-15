import 'package:InvoiceF/core/constants/colors.dart';
import 'package:InvoiceF/core/presentation/widgets/check_box_with_controller/check_box_controller.dart';
import 'package:InvoiceF/core/presentation/widgets/check_box_with_controller/custom_check_box_with_controller.dart';
import 'package:InvoiceF/core/presentation/widgets/custom_button.dart';
import 'package:InvoiceF/core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import 'package:InvoiceF/core/presentation/widgets/dropdown_with_controller/custom_dropdown_with_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/presentation/widgets/bootstrap/text_box_bootstrap.dart';

class AccountingOptionsFormContainer extends StatelessWidget {
  final CustomDropdownController<String> mainCurrencyTypeTextController;
  final TextEditingController mainCurrencyTypeArabicTextController;
  final TextEditingController mainCurrencyTypeEnglishTextController;
  final CustomCheckboxController a4ApplyOptionsTextController;
  final TextEditingController a4HeightTextController;
  final TextEditingController a4WidthTextController;
  final CustomCheckboxController mm80ApplyOptionsTextController;
  final TextEditingController mm80HeightTextController;
  final TextEditingController mm80WidthTextController;
  final CustomCheckboxController urlLinkApplyOptionsTextController;
  final TextEditingController urlLinkHeightTextController;
  final TextEditingController urlLinkWidthTextController;
  final AppLocalizations appLocalizations;
  final VoidCallback resetControllers;

  AccountingOptionsFormContainer({
    super.key,
    required this.mainCurrencyTypeTextController,
    required this.mainCurrencyTypeArabicTextController,
    required this.mainCurrencyTypeEnglishTextController,
    required this.a4ApplyOptionsTextController,
    required this.a4HeightTextController,
    required this.a4WidthTextController,
    required this.mm80ApplyOptionsTextController,
    required this.mm80HeightTextController,
    required this.mm80WidthTextController,
    required this.urlLinkApplyOptionsTextController,
    required this.urlLinkHeightTextController,
    required this.urlLinkWidthTextController,
    required this.appLocalizations,
    required this.resetControllers,
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
                      H5(
                        appLocalizations.main_options,
                        margin: margin(context, 'mx-4 mb-4'),
                      ),
                      CustomDropdownWithController(
                        title: appLocalizations.main_currency_type,
                        onChanged: (value) {},
                        titleColor: Colors.blueAccent,
                        items: const [
                          DropdownMenuItem(value: 'SAR', child: Text('SAR')),
                          DropdownMenuItem(value: 'USD', child: Text('USD')),
                          DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                          DropdownMenuItem(value: 'GBP', child: Text('GBP')),
                        ],
                        controller: mainCurrencyTypeTextController,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextBoxBootstrap(
                              label: appLocalizations.main_currency_type_arabic,
                              labelColor: Colors.blueAccent,
                              controller: mainCurrencyTypeArabicTextController,
                              isArabic: true,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextBoxBootstrap(
                              label:
                                  appLocalizations.main_currency_type_english,
                              labelColor: Colors.blueAccent,
                              controller: mainCurrencyTypeEnglishTextController,
                            ),
                          ),
                        ],
                      ),
                      H5(
                        appLocalizations.qr_size,
                        margin: margin(context, 'mx-4 my-4'),
                      ),
                      CustomCheckboxWithController(
                        label: appLocalizations.a4_apply_options,
                        controller: a4ApplyOptionsTextController,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextBoxBootstrap(
                              label: appLocalizations.a4_height,
                              keyboardType: TextInputType.number,
                              labelColor: Colors.blueAccent,
                              controller: a4HeightTextController,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextBoxBootstrap(
                              label: appLocalizations.a4_width,
                              keyboardType: TextInputType.number,
                              labelColor: Colors.blueAccent,
                              controller: a4WidthTextController,
                            ),
                          ),
                        ],
                      ),
                      CustomCheckboxWithController(
                        label: appLocalizations.mm80_apply_options,
                        controller: mm80ApplyOptionsTextController,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextBoxBootstrap(
                              label: appLocalizations.mm80_height,
                              keyboardType: TextInputType.number,
                              labelColor: Colors.blueAccent,
                              controller: mm80HeightTextController,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextBoxBootstrap(
                              label: appLocalizations.mm80_width,
                              keyboardType: TextInputType.number,
                              labelColor: Colors.blueAccent,
                              controller: mm80WidthTextController,
                            ),
                          ),
                        ],
                      ),
                      CustomCheckboxWithController(
                        label: appLocalizations.url_link_apply_options,
                        controller: urlLinkApplyOptionsTextController,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextBoxBootstrap(
                              label: appLocalizations.url_link_height,
                              keyboardType: TextInputType.number,
                              labelColor: Colors.blueAccent,
                              controller: urlLinkHeightTextController,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextBoxBootstrap(
                              label: appLocalizations.url_link_width,
                              keyboardType: TextInputType.number,
                              labelColor: Colors.blueAccent,
                              controller: urlLinkWidthTextController,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        FB5Col(
          classNames: 'mb-0',
          child: Container(
            height: 60,
            color: AppColors.primaryColor,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  margin: margin(context, 'ms-4'),
                  child: CustomButton(
                    text: 'Reset',
                    textColor: Colors.black,
                    onPressed: resetControllers,
                    backGroundColorColor: Colors.white,
                    isExpanded: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
