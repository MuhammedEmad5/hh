import 'package:InvoiceF/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF/core/presentation/widgets/check_box_with_controller/check_box_controller.dart';
import 'package:InvoiceF/core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import 'package:InvoiceF/features/configuration/accounting_options/presentation/widgets/accounting_options_form_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/constants/colors.dart';

class AccountingOptionsPage extends StatefulWidget {
  const AccountingOptionsPage({super.key});

  @override
  State<AccountingOptionsPage> createState() => _AccountingOptionsPageState();
}

class _AccountingOptionsPageState extends State<AccountingOptionsPage> {
  late CustomDropdownController<String> mainCurrencyTypeTextController;
  late TextEditingController mainCurrencyTypeArabicTextController;
  late TextEditingController mainCurrencyTypeEnglishTextController;
  late CustomCheckboxController a4ApplyOptionsTextController;
  late TextEditingController a4HeightTextController;
  late TextEditingController a4WidthTextController;
  late CustomCheckboxController mm80ApplyOptionsTextController;
  late TextEditingController mm80HeightTextController;
  late TextEditingController mm80WidthTextController;
  late CustomCheckboxController urlLinkApplyOptionsTextController;
  late TextEditingController urlLinkHeightTextController;
  late TextEditingController urlLinkWidthTextController;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
    initControllers();
  }

  @override
  void dispose() {
    super.dispose();
    mainCurrencyTypeTextController.dispose();
    mainCurrencyTypeArabicTextController.dispose();
    mainCurrencyTypeEnglishTextController.dispose();
    a4ApplyOptionsTextController.dispose();
    a4HeightTextController.dispose();
    a4WidthTextController.dispose();
    mm80ApplyOptionsTextController.dispose();
    mm80HeightTextController.dispose();
    mm80WidthTextController.dispose();
    urlLinkApplyOptionsTextController.dispose();
    urlLinkHeightTextController.dispose();
    urlLinkWidthTextController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  void initControllers() {
    mainCurrencyTypeTextController = CustomDropdownController('SAR');
    mainCurrencyTypeArabicTextController = TextEditingController(text: 'هللة');
    mainCurrencyTypeEnglishTextController =
        TextEditingController(text: 'Halalh');
    a4ApplyOptionsTextController = CustomCheckboxController(false);
    a4HeightTextController = TextEditingController(text: '370');
    a4WidthTextController = TextEditingController(text: '650');
    mm80ApplyOptionsTextController = CustomCheckboxController(false);
    mm80HeightTextController = TextEditingController(text: '370');
    mm80WidthTextController = TextEditingController(text: '650');
    urlLinkApplyOptionsTextController = CustomCheckboxController(false);
    urlLinkHeightTextController = TextEditingController(text: '200');
    urlLinkWidthTextController = TextEditingController(text: '200');
  }

  void resetControllers() {
    setState(() {
      mainCurrencyTypeTextController.value = 'SAR';
      mainCurrencyTypeArabicTextController.text = 'هللة';
      mainCurrencyTypeEnglishTextController.text = 'Halalh';
      a4ApplyOptionsTextController.value = false;
      a4HeightTextController.text = '370';
      a4WidthTextController.text = '650';
      mm80ApplyOptionsTextController.value = false;
      mm80HeightTextController.text = '370';
      mm80WidthTextController.text = '650';
      urlLinkApplyOptionsTextController.value = false;
      urlLinkHeightTextController.text = '200';
      urlLinkWidthTextController.text = '200';
    });
  }

  void saveAccountingOptions() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.accounting_options,
        textColor: Colors.white,
        onSavePressed: () => saveAccountingOptions(),
        color: AppColors.primaryColor,
      ),
      body: Builder(builder: (context) {
        return AccountingOptionsFormContainer(
          mainCurrencyTypeTextController: mainCurrencyTypeTextController,
          mainCurrencyTypeArabicTextController:
              mainCurrencyTypeArabicTextController,
          mainCurrencyTypeEnglishTextController:
              mainCurrencyTypeEnglishTextController,
          a4ApplyOptionsTextController: a4ApplyOptionsTextController,
          a4HeightTextController: a4HeightTextController,
          a4WidthTextController: a4WidthTextController,
          mm80ApplyOptionsTextController: mm80ApplyOptionsTextController,
          mm80HeightTextController: mm80HeightTextController,
          mm80WidthTextController: mm80WidthTextController,
          urlLinkApplyOptionsTextController: urlLinkApplyOptionsTextController,
          urlLinkHeightTextController: urlLinkHeightTextController,
          urlLinkWidthTextController: urlLinkWidthTextController,
          appLocalizations: appLocalizations,
          resetControllers: resetControllers,
        );
      }),
    );
  }
}
