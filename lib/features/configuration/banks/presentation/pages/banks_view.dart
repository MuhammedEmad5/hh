import 'package:InvoiceF/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF/core/presentation/widgets/custom_error_widget.dart';
import 'package:InvoiceF/core/presentation/widgets/form_navigator_with_controller/form_navigator_controller.dart';
import 'package:InvoiceF/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF/features/configuration/banks/domain/entities/bank_entity.dart';
import 'package:InvoiceF/features/configuration/banks/presentation/manager/bank_cubit.dart';
import 'package:InvoiceF/features/configuration/banks/presentation/widgets/banks_form_container.dart';
import 'package:InvoiceF/features/configuration/user_options/presentation/widgets/user_options_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import '../../../../../core/presentation/widgets/toast_notification.dart';
import '../../../../../core/utils/validator.dart';

class BanksView extends StatefulWidget {
  const BanksView({super.key});

  @override
  State<BanksView> createState() => _BanksViewState();
}

class _BanksViewState extends State<BanksView> {

  late  TextEditingController bankNumberController;
  late TextEditingController arabicNameController;
  late TextEditingController englishNameController;
  late FormNavigationController formNavigationController;
  late AppLocalizations appLocalizations;
  late FocusScopeNode _focusScopeNode ;
  bool isNewBank = false;
  List<BankEntity> mainBankList = [];

  @override
  void initState() {
    super.initState();
    arabicNameController = TextEditingController();
    englishNameController = TextEditingController();
    bankNumberController = TextEditingController();
    formNavigationController = FormNavigationController();
    _focusScopeNode  = FocusScopeNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    arabicNameController.dispose();
    englishNameController.dispose();
    formNavigationController.dispose();
    bankNumberController.dispose();
    _focusScopeNode.dispose();
  }

  void addNew() {
    isNewBank = true;
    final newBank =
        BankEntity(
            bankAccountNumber: int.parse( bankNumberController.text)+ 1
            , arabicName: '');
    mainBankList.add(newBank);
    updateTextFields(newBank);
    formNavigationController.updateIndex(mainBankList.length);
    formNavigationController.setLength(mainBankList.length);
  }

  void handleSuccess(List<BankEntity> bankList) {
    updateTextFields(bankList[0]);
    formNavigationController.setLength(bankList.length);
  }

  void handleEmpty() {
    isNewBank = true;
    final newBank = BankEntity(bankAccountNumber: 1, arabicName: '');
    mainBankList.add(newBank);
    updateTextFields(newBank);
    formNavigationController.updateIndex(1);
    formNavigationController.setLength(mainBankList.length);
  }

  void onSubmit() {
    BankEntity bankEntity = BankEntity(
        bankAccountNumber: int.parse( bankNumberController.text),
        arabicName: arabicNameController.text,
        englishName: englishNameController.text);

    isNewBank
        ? context.read<BankCubit>().insertBank(bankEntity)
        : context.read<BankCubit>().updateBank(bankEntity);
    isNewBank = false;
    formNavigationController.updateIndex(1);
    _focusScopeNode.requestFocus(FocusNode());
  }

  void updateTextFields(BankEntity bankEntity) {
    bankNumberController.text = bankEntity.bankAccountNumber.toString();
    arabicNameController.text = bankEntity.arabicName;
    englishNameController.text = bankEntity.englishName ?? "";
  }

  void validateInput() {
    final validator = Validator(context);
    final validateName = validator.validate(
        arabicNameController.text.trim(), appLocalizations.arabic_name);

    if (validateName != null) {
      showToast(
        duration: 4,
        context: context,
        message: validateName,
        backgroundColor: AppColors.redColor,
      );
      return;
    }

    onSubmit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onSavePressed: () => validateInput(),
        onAddPressed: () => addNew(),
        title: appLocalizations.banks,
        saveBtnColor: Colors.white,
        addBtnColor: Colors.white,
        color: AppColors.primaryColor,
        textColor: Colors.white,
      ),
      body: FocusScope(
        node: _focusScopeNode,
        child: BlocBuilder<BankCubit, BankState>(
          builder: (context, state) {
            return state.when(
                initial: () => const SizedBox(),
                loading: () => Loader(),
                success: (bankList) {
                  mainBankList = bankList;
                  handleSuccess(bankList);
                  return Column(
                    children: [
                      Expanded(
                          child: BanksFormContainer(
                            bankNumberController: bankNumberController,
                        arabicNameController: arabicNameController,
                        englishNameController: englishNameController,
                        formNavigationController: formNavigationController,
                        appLocalizations: appLocalizations,
                        onNavigatorChanged: (index) =>
                            updateTextFields(mainBankList[index - 1]),
                      )),
                    ],
                  );
                },
                empty: () {
                  handleEmpty();
                  return  Column(
                    children: [
                      Expanded(
                          child: BanksFormContainer(
                            bankNumberController: bankNumberController,
                            arabicNameController: arabicNameController,
                            englishNameController: englishNameController,
                            formNavigationController: formNavigationController,
                            appLocalizations: appLocalizations,
                            onNavigatorChanged: (index) =>
                                updateTextFields(mainBankList[index - 1]),
                          )),
                    ],
                  );
                },
                error: (msg) => CustomErrorWidget(
                      errorMessage: msg,
                    ));
          },
        ),
      ),
    );
  }
}
