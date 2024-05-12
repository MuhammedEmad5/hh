import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/custom_error_widget.dart';
import '../../../../../core/presentation/widgets/form_navigation.dart';
import '../../../../../core/presentation/widgets/form_navigator_with_controller/form_navigator_controller.dart';
import '../../../../../core/presentation/widgets/loader_widget.dart';
import '../../../../../core/presentation/widgets/toast_notification.dart';
import '../../../../../core/utils/validator.dart';
import '../../domain/entities/branch_entity/branch_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../manager/branch_cubit.dart';
import '../widgets/branch_form_container.dart';

class BranchesView extends StatefulWidget {
  const BranchesView({super.key});

  @override
  State<BranchesView> createState() => _BranchesViewState();
}

class _BranchesViewState extends State<BranchesView> {
  late TextEditingController branchTextController;
  late TextEditingController clientTextController;
  late TextEditingController nameArabicTextController;
  late TextEditingController descriptionArabicTextController;
  late TextEditingController nameEnglishTextController;
  late TextEditingController descriptionEnglishTextController;
  late TextEditingController notesTextController;
  late TextEditingController addressTextController;
  late FormNavigationController formNavigationController;

  late AppLocalizations appLocalizations ;
  List<Branch> mainBranchesList = [];

  bool isNewBranch = false;



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
    branchTextController.dispose();
    clientTextController.dispose();
    nameArabicTextController.dispose();
    descriptionArabicTextController.dispose();
    nameEnglishTextController.dispose();
    descriptionEnglishTextController.dispose();
    notesTextController.dispose();
    addressTextController.dispose();
    formNavigationController.dispose();
  }



  void updateTextFields(Branch branch) {
    branchTextController.text = branch.branchNumber.toString();
    nameArabicTextController.text = branch.arabicName;
    clientTextController.text = branch.branchNumber.toString();
    descriptionArabicTextController.text = branch.arabicDescription ?? "";
    nameEnglishTextController.text = branch.englishName ?? "";
    descriptionEnglishTextController.text = branch.englishDescription ?? "";
    notesTextController.text = branch.note ?? "";
    addressTextController.text = branch.address ?? "";
  }

  void addNew() {
    isNewBranch = true;
      final newBranch =
          Branch(branchNumber: mainBranchesList.length + 1, arabicName: '');
      mainBranchesList.add(newBranch);
      updateTextFields(newBranch);
    formNavigationController.updateIndex(mainBranchesList.length);
    formNavigationController.setLength(mainBranchesList.length);
  }

  void handleSuccess(List<Branch> branchList) {
      updateTextFields(branchList[0]);
      formNavigationController.setLength(branchList.length);
  }

  void handleEmpty() {
    isNewBranch = true;
    Branch newBranch =  Branch(branchNumber: 1, arabicName: "");
    mainBranchesList.add(newBranch);
    updateTextFields(newBranch);
    formNavigationController.updateIndex(1);
    formNavigationController.setLength(mainBranchesList.length);
  }

  void onSubmit() {
    final Branch branch = Branch(
        branchNumber: int.parse(branchTextController.text),
        customerNumber: clientTextController.text,
        arabicName: nameArabicTextController.text,
        arabicDescription: descriptionArabicTextController.text,
        englishName: nameEnglishTextController.text,
        englishDescription: descriptionEnglishTextController.text,
        address: addressTextController.text,
        note: notesTextController.text);

    isNewBranch
        ? context.read<BranchCubit>().insertBranch(branch)
        : context.read<BranchCubit>().updateBranch(branch: branch);
    isNewBranch = false;
    formNavigationController.updateIndex(1);

  }

  void validateInput() {
    final validator = Validator(context);
    final validateName =
        validator.validate(
            nameArabicTextController.text.trim(),
            appLocalizations.arabic_name
        );

    if (validateName != null) {
      showToast(
        duration: 4, //Optional in seconds
        context: context,
        message: validateName,
        backgroundColor: AppColors.redColor,
      );
      return;
    }

    onSubmit();
  }

  void initControllers(){
    branchTextController = TextEditingController();
    clientTextController = TextEditingController();
    nameArabicTextController = TextEditingController();
    descriptionArabicTextController = TextEditingController();
    nameEnglishTextController = TextEditingController();
    descriptionEnglishTextController = TextEditingController();
    notesTextController = TextEditingController();
    addressTextController = TextEditingController();
    formNavigationController = FormNavigationController();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.branch_store_cashier,
        onAddPressed: () => addNew(),
        onSavePressed: () => validateInput(),
        saveBtnColor: Colors.white,
        textColor: Colors.white,
        addBtnColor: Colors.white,
        color: AppColors.primaryColor,

      ),
      body: BlocBuilder<BranchCubit, BranchState>(
        builder: (context, state) {
          return state.when(
              initial: () => const SizedBox(),
              loading: () =>  Center(child: Loader()),
              success: (branches)  {
                mainBranchesList = branches;
                handleSuccess(mainBranchesList);
                return BranchFormContainer(
                  branchTextController: branchTextController,
                  clientTextController: clientTextController,
                  nameArabicTextController: nameArabicTextController,
                  descriptionArabicTextController:
                  descriptionArabicTextController,
                  nameEnglishTextController: nameEnglishTextController,
                  descriptionEnglishTextController:
                  descriptionEnglishTextController,
                  notesTextController: notesTextController,
                  addressTextController: addressTextController,
                  appLocalizations: appLocalizations,
                  formNavigationController: formNavigationController,
                  onNavigatorChanged: (index) => updateTextFields(mainBranchesList[index - 1]),

                );
              },
              error: (e) => CustomErrorWidget(errorMessage: e,),
              empty: (){
                handleEmpty();
                return BranchFormContainer(
                  branchTextController: branchTextController,
                  clientTextController: clientTextController,
                  nameArabicTextController: nameArabicTextController,
                  descriptionArabicTextController:
                  descriptionArabicTextController,
                  nameEnglishTextController: nameEnglishTextController,
                  descriptionEnglishTextController:
                  descriptionEnglishTextController,
                  notesTextController: notesTextController,
                  addressTextController: addressTextController,
                  appLocalizations: appLocalizations,
                  formNavigationController: formNavigationController,
                  onNavigatorChanged: (index) => updateTextFields(mainBranchesList[index - 1]),
                );
          }
          );
        }
      ),
    );
  }
}
