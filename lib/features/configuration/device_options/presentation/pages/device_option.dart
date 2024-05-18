import 'package:InvoiceF/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF/core/presentation/widgets/check_box_with_controller/check_box_controller.dart';
import 'package:InvoiceF/features/configuration/device_options/presentation/manager/device_option_cubit.dart';
import 'package:InvoiceF/features/configuration/device_options/presentation/widgets/blue_label_Widget.dart';
import 'package:InvoiceF/features/configuration/device_options/presentation/widgets/default_Check_box.dart';
import 'package:InvoiceF/features/configuration/device_options/presentation/widgets/default_text_box_widget.dart';
import 'package:InvoiceF/features/configuration/device_options/presentation/widgets/suffix_icons_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/card.dart';
import '../widgets/drop_down_search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeviceOptionView extends StatefulWidget {
  const DeviceOptionView({super.key});

  @override
  State<DeviceOptionView> createState() => _DeviceOptionViewState();
}

class _DeviceOptionViewState extends State<DeviceOptionView> with TickerProviderStateMixin{
  late CustomCheckboxController isTouchUiModeChecked;
  late CustomCheckboxController isShowStatusBarChecked;
  late CustomCheckboxController isWarningOnApplicationExitChecked;
  late CustomCheckboxController isAskForDataBaseBackupChecked;
  late TextEditingController filterFromDaysController;
  late TextEditingController touchScaleFactorController;
  late TextEditingController first80mmPcLogoIconController;
  late TextEditingController firstA4PcLogoIconController;
  late TextEditingController second80mmPcLogoIconController;
  late TextEditingController secondA4PcLogoIconController;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
    isTouchUiModeChecked = CustomCheckboxController(false);
    isShowStatusBarChecked = CustomCheckboxController(false);
    isWarningOnApplicationExitChecked = CustomCheckboxController(false);
    isAskForDataBaseBackupChecked = CustomCheckboxController(false);
    filterFromDaysController = TextEditingController();
    touchScaleFactorController = TextEditingController();
    first80mmPcLogoIconController = TextEditingController();
    firstA4PcLogoIconController = TextEditingController();
    second80mmPcLogoIconController = TextEditingController();
    secondA4PcLogoIconController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   CustomCheckboxController.dispose();
  //   CustomCheckboxController.dispose();
  //   CustomCheckboxController.dispose();
  //   CustomCheckboxController.dispose();
  //   TextEditingController.dispose();
  //   TextEditingController.dispose();
  //   TextEditingController.dispose();
  //   TextEditingController.dispose();
  //   TextEditingController.dispose();
  //   TextEditingController.dispose();
  // }
  @override
  void dispose() {
    super.dispose();
    isTouchUiModeChecked.dispose();
    isShowStatusBarChecked.dispose();
    isWarningOnApplicationExitChecked.dispose();
    isAskForDataBaseBackupChecked.dispose();
    filterFromDaysController.dispose();
    touchScaleFactorController.dispose();
    first80mmPcLogoIconController.dispose();
    firstA4PcLogoIconController.dispose();
    second80mmPcLogoIconController.dispose();
    secondA4PcLogoIconController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.device_options,
        color: AppColors.primaryColor,
        textColor: AppColors.onPrimary,
        saveBtnColor: AppColors.onPrimary,
        onSavePressed: () {},
      ),
      body: BlocBuilder<DeviceOptionCubit, DeviceOptionState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomCard(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DeviceOptionBlueLabelWidget(
                        label: appLocalizations.general_data_filter),
                    const SizedBox(height: 10),
                    DeviceOptionTextBoxWidget(
                      label: appLocalizations.filter_from_days,
                      controller: filterFromDaysController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionDropdownWidget(
                        appLocalizations: appLocalizations),
                    const SizedBox(height: 15),
                    DeviceOptionBlueLabelWidget(
                        label: appLocalizations.touch),
                    const SizedBox(height: 10),
                    DeviceOptionTextBoxWidget(
                      label: appLocalizations.touch_scale_factor,
                      controller: touchScaleFactorController,
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionCheckBoxWidget(
                      controller: isTouchUiModeChecked,
                      label: appLocalizations.touch_ui_mode,
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionBlueLabelWidget(
                        label: appLocalizations.main_form),
                    const SizedBox(height: 10),
                    DeviceOptionCheckBoxWidget(
                      controller: isShowStatusBarChecked,
                      label: appLocalizations.show_status_bar,
                    ),
                    DeviceOptionCheckBoxWidget(
                      controller: isWarningOnApplicationExitChecked,
                      label: appLocalizations.warning_on_application_exit,
                    ),
                    DeviceOptionCheckBoxWidget(
                      controller: isAskForDataBaseBackupChecked,
                      label: appLocalizations.ask_for_database_backup,
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionBlueLabelWidget(
                        label: appLocalizations.head_icon),
                    const SizedBox(height: 10),
                    DeviceOptionTextBoxWidget(
                      label: appLocalizations.first_80_mm_pc_logo_icon,
                      controller: first80mmPcLogoIconController,
                      suffix: DeviceOptionSuffixIconWidget(
                        moreFunction: () {
                          //context.read<DeviceOptionCubit>().pickImage();
                        },
                        plusFunction: () {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionTextBoxWidget(
                      label: appLocalizations.first_a4_pc_logo_icon,
                      controller: firstA4PcLogoIconController,
                      suffix: DeviceOptionSuffixIconWidget(
                        moreFunction: () {},
                        plusFunction: () {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionBlueLabelWidget(
                        label: appLocalizations.footer_icon),
                    const SizedBox(height: 10),
                    DeviceOptionTextBoxWidget(
                      label: appLocalizations.second_80_mm_pc_logo_icon,
                      controller: second80mmPcLogoIconController,
                      suffix: DeviceOptionSuffixIconWidget(
                        moreFunction: () {},
                        plusFunction: () {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionTextBoxWidget(
                      label: appLocalizations.second_a4_ac_logo_icon,
                      controller: secondA4PcLogoIconController,
                      suffix: DeviceOptionSuffixIconWidget(
                        moreFunction: () {},
                        plusFunction: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
