import 'package:InvoiceF_ClientVendor/core/presentation/widgets/date_picker_with_controller/date_picker_controller.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/date_picker_with_controller/date_picker_with_controller.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/dropdown_with_controller/custom_dropdown_with_controller.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/empty_widgets/empty_drop_down.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_list/data/repositories/client_vendor_repo.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_list/di/client_vendor_service.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_list/presentation/manager/client_vendor_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/presentation/widgets/bootstrap/multi_line_text_box_bootstrap.dart';
import '../../../../../core/presentation/widgets/bootstrap/text_box_bootstrap.dart';
import '../../../../../core/presentation/widgets/form_navigator_with_controller/form_navigator_controller.dart';
import '../../../../../core/presentation/widgets/form_navigator_with_controller/form_navigator_with_controller.dart';
import '../../../client_vendor_list/domain/entities/client_vendor_entity/client_vendor_entity_model.dart';

class BeginningBalanceFormContainer extends StatelessWidget {
  final TextEditingController transactionTextController;
  final CustomDropdownController clientVendorDropdownController;
  final CustomDropdownController branchDropdownController;
  final TextEditingController nameArabicTextController;
  final TextEditingController nameEnglishTextController;
  final DatePickerController datePickerController;
  final TextEditingController debitTextController;
  final TextEditingController creditTextController;
  final TextEditingController originalPaperBillTextController;
  final TextEditingController vatIdTextController;
  final TextEditingController notesTextController;
  final FormNavigationController formNavigationController;
  final void Function(int) onNavigatorChanged;

  late AppLocalizations appLocalizations;

  BeginningBalanceFormContainer({
    super.key,
      required this.transactionTextController,
      required this.nameArabicTextController,
      required this.nameEnglishTextController,
      required this.notesTextController,
      required this.clientVendorDropdownController,
      required this.datePickerController,
      required this.debitTextController,
      required this.creditTextController,
      required this.originalPaperBillTextController,
      required this.vatIdTextController,
      required this.branchDropdownController,
      required this.formNavigationController,
    required this.onNavigatorChanged
      });

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;

    ClientVendorService().initDi();

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: FB5Row(
              classNames: 'px-xs-3 px-lg-custom-10 mt-3 ',
              children: [
                FB5Col(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextBoxBootstrap(
                              hint: "",
                              initialValue: transactionTextController.text,
                              keyboardType: const TextInputType.numberWithOptions(
                                  decimal: true),
                              label: appLocalizations.transaction,
                              readOnly: true,
                              textFiledWidth: 200,
                              controller: transactionTextController,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomDropdownWithController(
                              controller: branchDropdownController,
                              title: appLocalizations.branch,
                              items: [
                                DropdownMenuItem(child: Text("shared prefrence"))
                              ],
                            ),
                          ),
                        ],
                      ),
                      RepositoryProvider(
                        create: (context) => GetIt.I<ClientVendorRepo>(),
                        child: BlocProvider<ClientVendorCubit>.value(
                          value: GetIt.instance<ClientVendorCubit>()
                            ..getClientsVendors(),
                          child: BlocBuilder<ClientVendorCubit, ClientVendorState>(
                            builder: (context, state) {
                              return state.when(
                                  initial: () => const SizedBox(),
                                  success: (clientVendors){
                                    final List<ClientVendorEntity> clientVendorList = clientVendors;

                                    clientVendorDropdownController.value = clientVendorList[0].clientVendorNo;

                                    return CustomDropdownWithController(
                                      controller: clientVendorDropdownController,
                                      title: appLocalizations.client_vendor,
                                      items: clientVendorList.map((clientVendor) {
                                        return DropdownMenuItem(
                                          value: clientVendor.clientVendorNo,
                                            child: Text("${clientVendor.aName ?? "no arabic name"} - ${clientVendor.eName ?? "no english name"} ")

                                        );

                                      }).toList(),
                                      onChanged: (value){},
                                    );

                                  } ,
                                  loading: () => EmptyDropDown(
                                        controller: clientVendorDropdownController,
                                        emptyText: appLocalizations.loading,
                                        dropDownTitle: appLocalizations.client_vendor,


                                  ),
                                  error: (_) => EmptyDropDown(
                                        controller: clientVendorDropdownController,
                                        emptyText: appLocalizations.error_Fetch_date,
                                        dropDownTitle: appLocalizations.client_vendor,


                                  ),
                                  empty: () => EmptyDropDown(
                                        controller: clientVendorDropdownController,
                                        emptyText: appLocalizations.no_client_vendor_inserted,
                                        dropDownTitle: appLocalizations.client_vendor,
                                      ));
                            },
                          ),
                        ),
                      ),
                      TextBoxBootstrap(
                        label: appLocalizations.arabic_name,
                        controller: nameArabicTextController,
                      ),
                      TextBoxBootstrap(
                        label: appLocalizations.english_name,
                        controller: nameEnglishTextController,
                      ),
                      DatePickerWithController(
                          label: appLocalizations.date,
                          onChanged: (date) {},
                          controller: datePickerController),
                      Row(
                        children: [
                          Expanded(
                            child: TextBoxBootstrap(
                              label: appLocalizations.debit,
                              controller: debitTextController,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextBoxBootstrap(
                              label: appLocalizations.credit,
                              controller: creditTextController,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextBoxBootstrap(
                              label: appLocalizations.original_paper_bill,
                              controller: originalPaperBillTextController,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextBoxBootstrap(
                              label: appLocalizations.vat_id,
                              controller: vatIdTextController,
                            ),
                          ),
                        ],
                      ),
                      MultiLineTextBoxBootStrap(
                        label: appLocalizations.note,
                        controller: notesTextController,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        FB5Col(
          classNames: 'mb-5',
          child: FormNavigationWithController(
            onChanged: onNavigatorChanged,
            controller: formNavigationController,
          ),
        )
      ],
    );
  }
}
