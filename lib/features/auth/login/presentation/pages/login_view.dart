import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/blocs/connection_type_bloc/connection_bloc.dart';
import '../../../../../core/blocs/language_bloc/language_bloc.dart';
import '../../../../../core/blocs/language_bloc/language_event.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sf_keys.dart';
import '../../../../../core/data/datasources/connection.dart';
import '../../../../../core/data/datasources/local_data_source/shared_prefrence/sf_manager.dart';
import '../../../../../core/navigation/navigation.dart';
import '../../../../../core/presentation/widgets/bootstrap/text_box_bootstrap.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_with_controller.dart';
import '../../../../../core/presentation/widgets/empty_widgets/empty_drop_down.dart';
import '../../../../../core/presentation/widgets/loader_widget.dart';
import '../../../../../core/presentation/widgets/submit_button.dart';
import '../../../../../core/presentation/widgets/toast_notification.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../configuration/branch/domain/use_cases/create_branch_use_case.dart';
import '../../../../configuration/branch/domain/use_cases/delete_branch_use_case.dart';
import '../../../../configuration/branch/domain/use_cases/read_all_branch_use_case.dart';
import '../../../../configuration/branch/domain/use_cases/read_branch_use_case.dart';
import '../../../../configuration/branch/domain/use_cases/update_branch_use_case.dart';
import '../../../../shared/di/shared_service.dart';
import '../../../../shared/presentation/views/bottom_navigation_tabs.dart';
import '../../data/repositories/login_repo_impl.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/save_language_use_case.dart';
import '../manager/login_cubit.dart';
import '../widgets/hint_view.dart';
import 'package:InvoiceF/features/configuration/branch/domain/entities/branch_entity/branch_model.dart';
import 'package:InvoiceF/features/configuration/branch/presentation/manager/branch_cubit.dart';
import 'package:InvoiceF/features/configuration/branch/data/repositories/branch_repo_impl.dart';
import 'package:InvoiceF/features/configuration/branch/presentation/manager/branch_cubit.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late CustomDropdownController languageDropdownController;
  late CustomDropdownController branchDropdownController;
  late CustomDropdownController storeDropdownController;
  late CustomDropdownController cashRegisterDropdownController;
  late TextEditingController loginTextEditingController;
  late TextEditingController passTextEditingController;
  late SubmitButtonController loginButtonController;

  late AppLocalizations appLocalizations;

  List<Branch> branchList = [];

  @override
  void initState() {
    super.initState();
    languageDropdownController = CustomDropdownController(context.read<LanguageBloc>().state.languageCode);
    branchDropdownController = CustomDropdownController();
    storeDropdownController = CustomDropdownController();
    cashRegisterDropdownController = CustomDropdownController();
    loginTextEditingController = TextEditingController();
    passTextEditingController = TextEditingController();
    loginButtonController = SubmitButtonController();


  }

  @override
  void dispose() {
    super.dispose();
    languageDropdownController.dispose();
    branchDropdownController.dispose();
    storeDropdownController.dispose();
    cashRegisterDropdownController.dispose();
    loginTextEditingController.dispose();
    passTextEditingController.dispose();
    // loginButtonController.dispose();
  }

  void validateInput(BuildContext context) {
    final validator = Validator(context);
    final validateEmail =
        validator.validate(loginTextEditingController.text.trim(),appLocalizations.login);
    final validatePass =
        validator.validate(passTextEditingController.text.trim(),appLocalizations.password);

    if (validateEmail != null) {
      showToast(
        duration: 4,
        context: context,
        message: validateEmail,
        backgroundColor: AppColors.redColor,
      );
      loginButtonController.reset();
      return;
    }
    if (validatePass != null) {
      showToast(
        duration: 4,
        context: context,
        message: validatePass,
        backgroundColor: AppColors.redColor,
      );
      loginButtonController.reset();
      return;
    }

    //todo:- handle password
    context
        .read<LoginCubit>()
        .login(loginTextEditingController.text.trim(), "mt");
  }

  void onError() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context != null && mounted) {
        showToast(
            context: context,
            message: appLocalizations.email_or_pass_incorrect,
            backgroundColor: AppColors.redColor);
      }
    });
    loginButtonController.reset();
  }

  void onSuccess() {
    if (loginTextEditingController.value.toString().isNotEmpty &&
        passTextEditingController.toString().isNotEmpty) {
      loginButtonController.success();
      Future.delayed(const Duration(milliseconds: 300),
          () => AppNavigation.pushReplacement(const BottomNavigationTabs()));
    }
  }

  void onLanguageChange(String value){

    context.read<LanguageBloc>().add(ChangeLanguageEvent(value));
    context.read<LoginCubit>().saveLanguage(SfKeys.language, value);
  }




  //todo refactor to custom widget
  CustomDropdownWithController dropDownHandler(List<Branch> branches,
      CustomDropdownController controller, String title) {
    branchList = branches;
    controller.value = branchList[0].branchNumber;
    return CustomDropdownWithController(
      title: title,
      titleColor: Colors.white,
      controller: controller,
      items: branchList.map((branch) {
        return DropdownMenuItem(
          value: branch.branchNumber,
          child: Text("${branch.arabicName} - ${branch.englishName} "),
        );
      }).toList(),
      onChanged: (value) => controller.value = value,
    );
  }

  @override
  Widget build(BuildContext context) {

    appLocalizations = AppLocalizations.of(context)!;
    return MultiRepositoryProvider(
  providers: [
    RepositoryProvider(
  create: (context) => BranchRepo(GetIt.instance<IConnection>()),
),
    RepositoryProvider(
      create: (context) => LoginRepo(GetIt.instance<IConnection>(),GetIt.instance<SfManager>()),
    ),
  ],
  child: MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => BranchCubit(
          CreateBranchUseCase(branchRepo: context.read<BranchRepo>()),
          ReadBranchUseCase(branchRepo: context.read<BranchRepo>()),
          DeleteBranchUseCase(branchRepo: context.read<BranchRepo>()),
          UpdateBranchUseCase(branchRepo: context.read<BranchRepo>()),
          ReadAllBranchesUseCase(branchRepo: context.read<BranchRepo>()))
        ..getAllBranches(),
),
    BlocProvider(
      create: (context) => LoginCubit(
          LoginUseCase( loginRepo: context.read<LoginRepo>()),
        SaveLanguageUseCase(context.read<LoginRepo>())

      ),
    ),
  ],
  child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.login,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomDropdownWithController(
            title: 'Language / اللغة',
            titleColor: Colors.white,
            controller: languageDropdownController,
            items: const [
              DropdownMenuItem(
                value: 'en',
                child: Text(
                  "English - الإنجليزية ",
                ),
              ),
              DropdownMenuItem(
                value: 'ar',
                child: Text(
                  "Arabic - العربية",
                ),
              ),
            ],
            onChanged: (value) => onLanguageChange(value),
          ),
          const SizedBox(
            height: 20,
          ),
          TextBoxBootstrap(
            label: AppLocalizations.of(context)!.login,
            controller: loginTextEditingController,
            labelColor: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          TextBoxBootstrap(
            label: AppLocalizations.of(context)!.password,
            controller: passTextEditingController,
            isSecure: true,
            labelColor: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<BranchCubit, BranchState>(
            builder: (context, state) {
              LoggerSingleton.logger.w(state.toString());

              return state.when(
                  initial: () => const SizedBox(),
                  loading: () =>  Loader(
                    loaderColor: Colors.white,
                  ),
                  empty: () => Column(
                    children: [
                      EmptyDropDown(
                        controller: branchDropdownController,
                        dropDownTitle:
                        AppLocalizations.of(context)!.branch,
                        emptyText: 'Branches is empty',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      EmptyDropDown(
                        controller: storeDropdownController,
                        dropDownTitle:
                        AppLocalizations.of(context)!.store,
                        emptyText: 'Stores is empty',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      EmptyDropDown(
                        controller: cashRegisterDropdownController,
                        dropDownTitle:
                        AppLocalizations.of(context)!.cash_register,
                        emptyText: 'cashRegister is empty',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  success: (branches) {
                    return Column(
                      children: [
                        dropDownHandler(branches, branchDropdownController,
                            AppLocalizations.of(context)!.branch),
                        const SizedBox(
                          height: 20,
                        ),
                        dropDownHandler(branches, storeDropdownController,
                            AppLocalizations.of(context)!.store),
                        const SizedBox(
                          height: 20,
                        ),
                        dropDownHandler(
                            branches,
                            cashRegisterDropdownController,
                            AppLocalizations.of(context)!.cash_register),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                  error: (_) => Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text("No branches Available"),
                  ));
            },
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              state.whenOrNull(
                success: () => onSuccess(),
                error: (e) => onError(),
              );

              return SubmitButton(
                buttonHeight: 50,
                title: AppLocalizations.of(context)!.login.toUpperCase(),
                textColor: AppColors.redColor,
                color: Colors.white,
                isExpanded: false,
                controller: loginButtonController,
                onPressed: () => validateInput(context),
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
          const HintView(),
        ],
      ),
),
);
  }
}
