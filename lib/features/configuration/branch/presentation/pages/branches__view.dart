import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/custom_error_widget.dart';
import '../../../../../core/presentation/widgets/form_navigation.dart';
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
  late AppLocalizations appLocalizations ;
  List<Branch> branchesList = [];

  bool isNewBranch = false;

  void updateTextFields(Branch branch) {
    branchTextController.text =  branch.branchNumber.toString();
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
    setState(() {
      final newBranch =
          Branch(branchNumber: branchesList.length + 1, arabicName: '');
      branchesList.add(newBranch);
      updateTextFields(newBranch);
    });
  }

  void resetAll() {
    nameArabicTextController.clear();
    descriptionArabicTextController.clear();
    nameEnglishTextController.clear();
    descriptionEnglishTextController.clear();
    notesTextController.clear();
    addressTextController.clear();
  }

  void deleteBranch(String id) {
    context.read<BranchCubit>().deleteBranch(id: double.parse(id));
  }

  void handleSuccess(List<Branch> branchList) {
    if (branchesList.isEmpty) {
      isNewBranch = true;
      updateTextFields(Branch(branchNumber: 1, arabicName: ""));
      return;
    }

    if (!isNewBranch) {
      updateTextFields(branchList[0]);
    }
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

  @override
  void initState() {
    super.initState();
    branchTextController = TextEditingController();
    clientTextController = TextEditingController();
    nameArabicTextController = TextEditingController();
    descriptionArabicTextController = TextEditingController();
    nameEnglishTextController = TextEditingController();
    descriptionEnglishTextController = TextEditingController();
    notesTextController = TextEditingController();
    addressTextController = TextEditingController();
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
  }

  @override
  Widget build(BuildContext context) {

    appLocalizations = AppLocalizations.of(context)!;

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
                branchesList = branches;
                handleSuccess(branchesList);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: BranchFormContainer(
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
                      ),
                    ),
                    FB5Col(
                      classNames: 'mb-5',
                      child: FormNavigation(
                        length: branchesList.length,
                        onChanged: (index) {
                          updateTextFields(branchesList[index - 1]);
                        },
                      ),
                    )
                  ],
                );
              },
              error: (e) => CustomErrorWidget(errorMessage: e,),
              empty: (){

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (context != null && mounted) {
                    showToast(
                        context: context,
                        backgroundColor: AppColors.primaryColor,
                        message: "No Branches Available please insert one");
                  }
                });



                  handleSuccess(branchesList);
                return Column(
                  children: [
                    Expanded(
                      child: BranchFormContainer(
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
                      ),
                    ),
                    FB5Col(
                      classNames: 'mb-5',
                      child: FormNavigation(
                        length: branchesList.length,
                        onChanged: (index) {
                          updateTextFields(branchesList[index - 1]);
                        },
                      ),
                    )
                  ],
                );
          }
          );
        }
      ),
    );
  }
}
