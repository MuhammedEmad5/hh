import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/custom_error_widget.dart';
import '../../../../../core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import '../../../../../core/presentation/widgets/form_navigation.dart';
import '../../../../../core/presentation/widgets/loader_widget.dart';
import '../../domain/entities/company_unit_entity/company_unit_entity_model.dart';
import '../manager/company_unit_cubit.dart';
import '../widgets/company_unit_card.dart';

class CompanyUnitPage extends StatefulWidget {
  const CompanyUnitPage({super.key});

  @override
  State<CompanyUnitPage> createState() => _CompanyUnitPageState();
}

class _CompanyUnitPageState extends State<CompanyUnitPage> {
  List<CompanyUnitEntity> cUnitsData = [];
  int lastIndex = 1;
  List<int> addedIndexs = [];
  int currentIndex = 1;

  TextEditingController reference = TextEditingController();
  TextEditingController aName = TextEditingController();
  TextEditingController eName = TextEditingController();

  void updateTextFields(CompanyUnitEntity cUnit) {
    reference.text = '${cUnit.unitNo}';
    aName.text = cUnit.aName;
    eName.text = cUnit.eName;
  }

  @override
  void dispose() {
    super.dispose();
  }

  handleAdd() {
    int newIndex = lastIndex + 1;
    if (cUnitsData.isEmpty) {
      newIndex = 1;
    }
    addedIndexs.add(newIndex);
    var cUnit = CompanyUnitEntity(
        unitNo: newIndex, aName: 'الاسم بالعربي', eName: 'English Name');
    setState(() {
      cUnitsData.add(cUnit);
      currentIndex = cUnitsData.length;
      updateTextFields(cUnit);
    });
  }

  handleSave() {
    CompanyUnitEntity cUnit = CompanyUnitEntity(
      unitNo: cUnitsData[currentIndex - 1].unitNo,
      aName: aName.text,
      eName: eName.text,
    );
    cUnitsData[currentIndex - 1] = cUnit;
    addedIndexs.contains(cUnit.unitNo)
        ? context.read<CompanyUnitCubit>().insertCompanyUnit(cUnit)
        : context
            .read<CompanyUnitCubit>()
            .updateCompanyUnit(companyUnit: cUnit);
    if (addedIndexs.contains(cUnit.unitNo)) {
      addedIndexs.remove(cUnit.unitNo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.company_unit,
        color: AppColors.primaryColor,
        textColor: AppColors.onPrimary,
        onAddPressed: () {
          handleAdd();
        },
        onSavePressed: () {
          handleSave();
        },
        addBtnColor: AppColors.onPrimary,
      ),
      body: BlocBuilder<CompanyUnitCubit, CompanyUnitState>(
        builder: (context, state) {
          return state.when(initial: () {
            return const Text('Initial State');
          }, loading: () {
            return  Center(child: Loader());
          }, success: (data) {
            if (data.isEmpty) {
              if (cUnitsData.isEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  handleAdd();
                });
              }
            }
            cUnitsData = data.isEmpty ? cUnitsData : data;
            lastIndex = cUnitsData.last.unitNo;

            if (currentIndex == 1 && reference.text == '') {
              updateTextFields(cUnitsData[0]);
            }

            return ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              children: [
                CompanyUnitCard(
                  reference: reference,
                  eName: eName,
                  aName: aName,
                ),
                FormNavigation(
                  length: cUnitsData.length,
                  pagerIndex: currentIndex,
                  setPagerIndex: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  onChanged: (index) {
                    setState(() {
                      updateTextFields(cUnitsData[index - 1]);
                    });
                  },
                ),
                // PagesFormView(itemsPerPage: 1, data: companyUnits),
              ],
            );
          }, error: (e) {
            return CustomErrorWidget(errorMessage: e);
          }, empty: () {
            return const CustomEmptyWidget(
              text: 'No Company Unit available please insert one',
            );
          });
        },
      ),
    );
  }
}
