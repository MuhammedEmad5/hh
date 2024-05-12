import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/custom_error_widget.dart';
import '../../../../../core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import '../../../../../core/presentation/widgets/form_navigation.dart';
import '../../../../../core/presentation/widgets/loader_widget.dart';
import '../../data/models/Met_Unit_model.dart';
import '../manager/unit_cubit.dart';
import '../widgets/unit_card.dart';

class UnitPage extends StatefulWidget {
  const UnitPage({super.key});

  @override
  State<UnitPage> createState() => _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {
  int currentIndex = 1;
  List<Met_Unit> units = [];

  TextEditingController reference = TextEditingController();
  TextEditingController aName = TextEditingController();
  TextEditingController eName = TextEditingController();
  void updateTextFields(Met_Unit unit) {
    reference.text = '${unit.referenceNo}';
    aName.text = unit.aName ?? "";
    eName.text = unit.eName ?? "";
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.unit,
        color: AppColors.primaryColor,
        textColor: AppColors.onPrimary,
      ),
      body: BlocBuilder<UnitCubit, UnitState>(
        builder: (context, state) {
          return state.when(initial: () {
            return const Text('Initial State');
          }, loading: () {
            return  Center(child: Loader());
          }, success: (data) {
            units = data;

            if (currentIndex == 1 && reference.text == '') {
              updateTextFields(units[0]);
            }
            return ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              children: [
                UnitCard(
                  appLocalizations: appLocalizations,
                  reference: reference,
                  eName: eName,
                  aName: aName,
                ),
                FormNavigation(
                  length: data.length,
                  onChanged: (index) {
                    setState(() {
                      updateTextFields(units[index - 1]);
                    });
                  },
                ),
              ],
            );
          }, error: (e) {
            return CustomErrorWidget(errorMessage: e);
          }, empty: () {
            return CustomEmptyWidget(
              text: AppLocalizations.of(context)!.no_data,
            );
          });
        },
      ),
    );
  }
}
