import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/card.dart';
import '../../../../../core/presentation/widgets/check_box_with_controller/check_box_controller.dart';
import '../../../../../core/presentation/widgets/check_box_with_controller/custom_check_box_with_controller.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_with_controller.dart';
import '../../../../../core/presentation/widgets/empty_widgets/empty_drop_down.dart';
import '../../../../../core/presentation/widgets/label.dart';
import '../../../../../core/presentation/widgets/loader_widget.dart';
import '../../../../../core/presentation/widgets/toast_notification.dart';
import '../../../../../core/utils/validator.dart';
import '../../domain/entities/user_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/text_box.dart';
import '../manager/user_registration_cubit.dart';

class UserFormView extends StatefulWidget {
  final User? user;
  final int index;

  const UserFormView({
    super.key,
    this.user,
    required this.index,
  });

  @override
  State<UserFormView> createState() => _UserFormViewState();
}

class _UserFormViewState extends State<UserFormView> {
  late TextEditingController loginController;
  late TextEditingController arabicNameController;
  late TextEditingController englishNameController;
  late TextEditingController contactController;
  late CustomDropdownController branchesDropdownController;
  late CustomCheckboxController adminCheckboxController;
  late CustomCheckboxController userCheckboxController;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();

    loginController = TextEditingController();
    arabicNameController = TextEditingController();
    englishNameController = TextEditingController();
    contactController = TextEditingController();
    branchesDropdownController = CustomDropdownController();
    adminCheckboxController = CustomCheckboxController(false);
    userCheckboxController = CustomCheckboxController(false);

    checkForEditCase();
  }

  void onSubmit() {
    User user = User(
      personNumber: widget.index,
      arabicName: arabicNameController.text,
      englishName: englishNameController.text,
      email: loginController.text,
      mainContact1: contactController.text,
      isUser: adminCheckboxController.value == false
          ? userCheckboxController.value
          : adminCheckboxController.value,
    );

    widget.user != null
        ? context.read<UserRegistrationCubit>().updateUser(user)
        : context.read<UserRegistrationCubit>().insertUser(user);
    Navigator.pop(context);
  }

  void checkForEditCase() {
    if (widget.user != null) {
      arabicNameController.text = widget.user!.arabicName;
      englishNameController.text = widget.user!.englishName ?? "";
      loginController.text = widget.user!.email;
      contactController.text = widget.user!.mainContact1 ?? "";
      userCheckboxController.value = widget.user!.isUser;
      adminCheckboxController.value = !widget.user!.isUser;
    }
  }

  CustomDropdownWithController branchDropDownHandler(List<Branch> branches) {
    branchesDropdownController.value = branches[0].branchNumber;
    return CustomDropdownWithController(
      controller: branchesDropdownController,
      items: branches.map((branch) {
        return DropdownMenuItem(
          value: branch.branchNumber,
          child: Text(branch.arabicName),
        );
      }).toList(),
      onChanged: (value) {
        //LoggerSingleton.logger.i(dbNamesDropDownController.value);
      },
    );
  }

  void validateInput() {
    final validator = Validator(context);
    final validateEmail = validator.validate(
        loginController.text.trim(),
      appLocalizations.login
    );
    final validateName =
        validator.validate(
            arabicNameController.text.trim(),
          appLocalizations.arabic_name
        );

    if (validateName != null) {
      showToast(
        duration: 4,
        context: context,
        message: validateName,
        backgroundColor: AppColors.redColor,
      );
      return;
    }
    if (validateEmail != null) {
      showToast(
        duration: 4,
        context: context,
        message: validateEmail,
        backgroundColor: AppColors.redColor,
      );
      return;
    }
    if (adminCheckboxController.value == false &&
        userCheckboxController.value == false) {
      showToast(
        duration: 4,
        context: context,
        message: appLocalizations.user_or_admin_required,
        backgroundColor: AppColors.redColor,
      );
      return;
    }

    onSubmit();
  }

  @override
  void dispose() {
    super.dispose();
    loginController.dispose();
    arabicNameController.dispose();
    englishNameController.dispose();
    contactController.dispose();
    branchesDropdownController.dispose();
    adminCheckboxController.dispose();
    userCheckboxController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = responsiveValue<double>(context,
        defaultValue: 200.0, md: 230.0, lg: 300, xl: 400);

    appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.user_registration,
        onSavePressed: () => validateInput(),
        color: AppColors.primaryColor,
        textColor: AppColors.onPrimary,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          CustomCard(
            child: FB5Grid(
              classNames:
                  'row-cols-xs-1 row-cols-sm-1 row-cols-md-2 mx-0 mt-2 justify-content-center no-gutters',
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Label(
                      text: appLocalizations.person,
                      color: AppColors.primaryColor,
                    ),
                    Spacer(),
                    TextBox(
                      labelWidth: width,
                      isEnabled: false,
                      initialValue:
                          '${widget.user?.personNumber ?? widget.index}',
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Label(
                        text: appLocalizations.login,
                        color: AppColors.primaryColor),
                    Spacer(),
                    TextBox(
                      labelWidth: width,
                      controller: loginController,
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Label(
                        text: appLocalizations.arabic_name,
                        color: AppColors.primaryColor),
                    const Spacer(),
                    TextBox(
                      labelWidth: width,
                      controller: arabicNameController,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Label(
                        text: appLocalizations.english_name,
                        color: AppColors.primaryColor),
                    const Spacer(),
                    TextBox(
                      labelWidth: width,
                      controller: englishNameController,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Label(
                        text: appLocalizations.contact1,
                        color: AppColors.primaryColor),
                    const Spacer(),
                    TextBox(
                      labelWidth: width,
                      controller: contactController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Label(
                        text: appLocalizations.branch,
                        color: AppColors.primaryColor),
                    const Spacer(),
                    SizedBox(
                      width: width,
                      child: BlocBuilder<BranchCubit, BranchState>(
                        builder: (context, state) {
                          return state.when(
                              initial: () => const SizedBox(),
                              loading: () =>
                                  Loader(showText: false, strokeWidth: 5),
                              success: (branches) =>
                                  branchDropDownHandler(branches),
                              error: (_) => const Text("No available branches"),
                              empty: () => EmptyDropDown(
                                  controller: branchesDropdownController,
                                  emptyText: "Branches is empty"));
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomCheckboxWithController(
                      label: appLocalizations.admin,
                      controller: adminCheckboxController,
                    ),
                    CustomCheckboxWithController(
                      label: appLocalizations.user,
                      controller: userCheckboxController,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
