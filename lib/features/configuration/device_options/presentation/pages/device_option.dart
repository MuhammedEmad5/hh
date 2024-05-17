import 'package:InvoiceF/core/presentation/widgets/app_bar.dart';
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

class DeviceOptionView extends StatelessWidget {
   DeviceOptionView({super.key});

  bool? isTouchUiModeChecked;
  bool? isShowStatusBarChecked;
  bool? isWarningOnApplicationExitChecked;
  bool? isAskForDataBaseBackupChecked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Device Options',
        color: AppColors.primaryColor,
        textColor: AppColors.onPrimary,
        saveBtnColor: AppColors.onPrimary,
        onSavePressed: () {
        },
      ),
      body: BlocProvider(
        create: (context) => DeviceOptionCubit(),
        child: BlocBuilder<DeviceOptionCubit, DeviceOptionState>(
          builder: (context, state) {
            final deviceOptionCubit = context.watch<DeviceOptionCubit>();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomCard(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DeviceOptionBlueLabelWidget(
                          label: 'General Data Filter'),
                      const SizedBox(height: 10),
                      const DeviceOptionTextBoxWidget(
                          label: 'Filter From Days',
                          keyboardType: TextInputType.number),
                      const SizedBox(height: 10),
                      const DeviceOptionDropdownWidget(),
                      const SizedBox(height: 15),
                      const DeviceOptionBlueLabelWidget(label: 'Touch'),
                      const SizedBox(height: 10),
                      const DeviceOptionTextBoxWidget(
                          label: 'Touch Scale Factor'),
                      const SizedBox(height: 10),
                      DeviceOptionCheckBoxWidget(
                        checked: isTouchUiModeChecked??false,
                        label: 'Touch i mode',
                      ),
                      const SizedBox(height: 10),
                      const DeviceOptionBlueLabelWidget(label: 'Main Form'),
                      const SizedBox(height: 10),
                      DeviceOptionCheckBoxWidget(
                        checked: isShowStatusBarChecked??false,
                        label: 'Show Status Bar',
                      ),
                      DeviceOptionCheckBoxWidget(
                        checked: isWarningOnApplicationExitChecked??false,
                        label: 'Warning on Application Exit',
                      ),
                      DeviceOptionCheckBoxWidget(
                        checked: isAskForDataBaseBackupChecked??false,
                        label: 'Ask For DataBase backup',
                      ),
                      const SizedBox(height: 10),
                      const DeviceOptionBlueLabelWidget(label: 'Head Icon '),
                      const SizedBox(height: 10),
                      DeviceOptionTextBoxWidget(
                        label: 'First 80 mm: Pc Logo Icon',
                        suffix: DeviceOptionSuffixIconWidget(moreFunction: () {  }, plusFunction: () {  },),
                      ),
                      const SizedBox(height: 10),
                      DeviceOptionTextBoxWidget(
                          label: 'First A4: Pc Logo Icon',
                        suffix: DeviceOptionSuffixIconWidget(moreFunction: () {  }, plusFunction: () {  },),
                      ),
                      const SizedBox(height: 10),
                      const DeviceOptionBlueLabelWidget(label: 'Footer Icon'),
                      const SizedBox(height: 10),
                      DeviceOptionTextBoxWidget(
                          label: 'Second 80 mm: Pc Logo Icon',
                        suffix: DeviceOptionSuffixIconWidget(moreFunction: () {  }, plusFunction: () {  },),
                      ),
                      const SizedBox(height: 10),
                      DeviceOptionTextBoxWidget(
                          label: 'Second 80 mm: Pc Logo Icon',
                        suffix: DeviceOptionSuffixIconWidget(moreFunction: () {  }, plusFunction: () {  },),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
