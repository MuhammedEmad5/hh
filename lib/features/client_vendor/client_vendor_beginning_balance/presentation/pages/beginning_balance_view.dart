import 'dart:ffi';

import 'package:InvoiceF_ClientVendor/core/constants/colors.dart';
import 'package:InvoiceF_ClientVendor/core/extensions/context_extension.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/custom_error_widget.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/form_navigator_with_controller/form_navigator_controller.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/form_navigator_with_controller/form_navigator_with_controller.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF_ClientVendor/core/utils/logger.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/domain/entities/beginning_balance_entity.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/presentation/manager/beginning_balance_cubit.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/presentation/widgets/beginning_balance_form_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/presentation/widgets/date_picker_with_controller/date_picker_controller.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import '../../../../../core/presentation/widgets/toast_notification.dart';
import '../../../../../core/utils/validator.dart';

class BeginningBalanceView extends StatefulWidget {
  BeginningBalanceView({super.key});

  @override
  State<BeginningBalanceView> createState() => _BeginningBalanceViewState();
}

class _BeginningBalanceViewState extends State<BeginningBalanceView> {
  late TextEditingController transactionTextController;
  late CustomDropdownController clientVendorDropdownController;
  late TextEditingController nameArabicTextController;
  late TextEditingController nameEnglishTextController;
  late DatePickerController datePickerController;
  late TextEditingController debitTextController;
  late TextEditingController creditTextController;
  late TextEditingController originalPaperBillTextController;
  late TextEditingController vatIdTextController;
  late TextEditingController notesTextController;
  late FormNavigationController formNavigationController;
  late CustomDropdownController branchDropdownController;
  late AppLocalizations appLocalizations;
  bool isNewBalance = false;
  List<BeginningBalanceEntity> mainBalanceEntityList = [];

  @override
  void initState() {
    super.initState();
    initControllers();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    transactionTextController.dispose();
    clientVendorDropdownController.dispose();
    nameArabicTextController.dispose();
    nameEnglishTextController.dispose();
    datePickerController.dispose();
    debitTextController.dispose();
    creditTextController.dispose();
    originalPaperBillTextController.dispose();
    vatIdTextController.dispose();
    notesTextController.dispose();
    branchDropdownController.dispose();
    formNavigationController.dispose();
  }

  void addNew() {
    isNewBalance = true;
    final newBalance = BeginningBalanceEntity(
        //todo get branch from sf
        branchNumber: 3,
        clientVendorNumber: 0,
        transactionNumber: mainBalanceEntityList.length + 1,
        arabicName: 'بداية الرصيد',
        englishName: "start balance",
        debit: 0.00,
        credit: 0.00,
        balance: 0.00,
        note: "",
        date: context.formatDateString(DateTime.now().toString()));
    mainBalanceEntityList.add(newBalance);
    updateTextFilled(newBalance);
    formNavigationController.updateIndex(mainBalanceEntityList.length);
    formNavigationController.setLength(mainBalanceEntityList.length);

  }

  void handleSuccess(List<BeginningBalanceEntity> balanceList) {
    updateTextFilled(balanceList[0]);
    formNavigationController.setLength(balanceList.length);
  }

  void handleEmpty() {
    isNewBalance = true;
    final newBalance = BeginningBalanceEntity(
        //todo get branch from sf
        branchNumber: 1,
        clientVendorNumber: 0,
        transactionNumber: 1,
        arabicName: 'بداية الرصيد',
        englishName: "start balance",
        debit: 0.00,
        credit: 0.00,
        balance: 0.00,
        date: DateTime.now().toString(),
      note:  ""

    );
    mainBalanceEntityList.add(newBalance);
    updateTextFilled(newBalance);
    formNavigationController.updateIndex(1);
    formNavigationController.setLength(mainBalanceEntityList.length);
  }

  void initControllers() {
    transactionTextController = TextEditingController();
    clientVendorDropdownController = CustomDropdownController();
    branchDropdownController = CustomDropdownController();
    nameArabicTextController = TextEditingController();
    nameEnglishTextController = TextEditingController();
    datePickerController = DatePickerController(DateTime.now());
    debitTextController = TextEditingController();
    creditTextController = TextEditingController();
    originalPaperBillTextController = TextEditingController();
    vatIdTextController = TextEditingController();
    notesTextController = TextEditingController();
    formNavigationController = FormNavigationController();
  }

  void validateInput() {
    LoggerSingleton.logger
        .w("${clientVendorDropdownController.value} CLIEEEENt");

    final validator = Validator(context);

    final validateName = validator.validate(
        nameArabicTextController.text.trim(), appLocalizations.arabic_name);

    final validateDebit = validator.validate(
        debitTextController.text.trim(), appLocalizations.debit);
    final validateCredit = validator.validate(
        creditTextController.text.trim(), appLocalizations.credit);

    final validateClientVendor = validator.validate(
        clientVendorDropdownController.value.toString(),
        appLocalizations.client_vendor);

    if (validateName != null) {
      showToast(
        duration: 4,
        context: context,
        message: validateName,
        backgroundColor: AppColors.redColor,
      );
      return;
    }
    if (validateDebit != null) {
      showToast(
        duration: 4,
        context: context,
        message: validateDebit,
        backgroundColor: AppColors.redColor,
      );
      return;
    }
    if (validateCredit != null) {
      showToast(
        duration: 4,
        context: context,
        message: validateCredit,
        backgroundColor: AppColors.redColor,
      );
      return;
    }
    if (validateClientVendor != null) {
      showToast(
        duration: 4,
        context: context,
        message: validateClientVendor,
        backgroundColor: AppColors.redColor,
      );
      return;
    }

    onSubmit();
  }

  void onSubmit() {

    LoggerSingleton.logger.w(notesTextController.text);


    BeginningBalanceEntity balanceEntity = BeginningBalanceEntity(


        //todo get branch from shared prefrence the object
        branchNumber: 7,
        clientVendorNumber: double.parse( clientVendorDropdownController.value.toString()).toInt(),
        transactionNumber: int.parse(transactionTextController.text),
        arabicName: nameArabicTextController.text,
        debit: double.parse(debitTextController.text),
        credit: double.parse(creditTextController.text),
        englishName: nameEnglishTextController.text,
        balance: calculateBalance(double.parse(debitTextController.text),
            double.parse(creditTextController.text)),
        date: context.formatDateString(datePickerController.value.toString(),
            format: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"),
      note: notesTextController.text



    );

    isNewBalance
        ? context
            .read<BeginningBalanceCubit>()
            .insertBeginningBalance(balanceEntity)
        : context
            .read<BeginningBalanceCubit>()
            .updateBeginningBalance(balanceEntity);
    isNewBalance = false;
    formNavigationController.updateIndex(1);
  }

  double calculateBalance(double debit, double credit) {
    return debit - credit;
  }

  void updateTextFilled(BeginningBalanceEntity balanceEntity) {
    transactionTextController.text = balanceEntity.transactionNumber.toString();
    balanceEntity.clientVendorNumber == 0
        ? clientVendorDropdownController.setValue(null)
        : clientVendorDropdownController
            .setValue(balanceEntity.clientVendorNumber);
    nameArabicTextController.text = balanceEntity.arabicName;
    nameEnglishTextController.text = balanceEntity.englishName ?? "";
    datePickerController.value =
        DateTime.tryParse(balanceEntity.date.toString());
    debitTextController.text = balanceEntity.debit.toString();
    creditTextController.text = balanceEntity.credit.toString();
    originalPaperBillTextController.text =
        balanceEntity.originalPaperBillNumber ?? "";
    vatIdTextController.text = balanceEntity.invoiceVatId ?? "";
    notesTextController.text = balanceEntity.note ?? "" ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        color: AppColors.primaryColor,
        title: appLocalizations.beginning_balance,
        textColor: Colors.white,
        saveBtnColor: Colors.white,
        addBtnColor: Colors.white,
        onAddPressed: () => addNew(),
        onSavePressed: () => validateInput(),
      ),
      body: BlocBuilder<BeginningBalanceCubit, BeginningBalanceState>(
        builder: (context, state) {
          return state.when(
              initial: () => const SizedBox(),
              loading: () => Loader(),
              success: (balances) {
                mainBalanceEntityList = balances;
                handleSuccess(balances);
                return  BeginningBalanceFormContainer(
                  transactionTextController: transactionTextController,
                  nameArabicTextController: nameArabicTextController,
                  nameEnglishTextController: nameEnglishTextController,
                  notesTextController: notesTextController,
                  clientVendorDropdownController:
                  clientVendorDropdownController,
                  datePickerController: datePickerController,
                  debitTextController: debitTextController,
                  creditTextController: creditTextController,
                  originalPaperBillTextController:
                  originalPaperBillTextController,
                  vatIdTextController: vatIdTextController,
                  branchDropdownController: branchDropdownController,
                  formNavigationController: formNavigationController,
                  onNavigatorChanged: (index ) => updateTextFilled(mainBalanceEntityList[index - 1]),
                );
              },
              empty: () {
                handleEmpty();
                return BeginningBalanceFormContainer(
                  transactionTextController: transactionTextController,
                  nameArabicTextController: nameArabicTextController,
                  nameEnglishTextController: nameEnglishTextController,
                  notesTextController: notesTextController,
                  clientVendorDropdownController:
                  clientVendorDropdownController,
                  datePickerController: datePickerController,
                  debitTextController: debitTextController,
                  creditTextController: creditTextController,
                  originalPaperBillTextController:
                  originalPaperBillTextController,
                  vatIdTextController: vatIdTextController,
                  branchDropdownController: branchDropdownController,
                  formNavigationController: formNavigationController,
                  onNavigatorChanged: (index ) => updateTextFilled(mainBalanceEntityList[index - 1]),
                );



              },
              error: (e) => CustomErrorWidget(
                    errorMessage: e,
                  ));
        },
      ),
    );
  }
}
