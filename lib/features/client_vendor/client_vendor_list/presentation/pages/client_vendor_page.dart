import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/navigation/navigation.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/custom_error_widget.dart';
import '../../../../../core/presentation/widgets/data_grid_paginated.dart';
import '../../../../../core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import '../../../../../core/presentation/widgets/loader_widget.dart';
import '../../../../../core/presentation/widgets/ok_alert.dart';
import '../../../../../core/utils/logger.dart';
import '../../domain/entities/client_vendor_entity/client_vendor_entity_model.dart';
import '../manager/client_vendor_cubit.dart';
import 'add_client_vendor_page.dart';

class ClientVendorPage extends StatefulWidget {
  const ClientVendorPage({super.key});

  @override
  State<ClientVendorPage> createState() => _ClientVendorPageState();
}

class _ClientVendorPageState extends State<ClientVendorPage> {
  List<ClientVendorEntity> clientsVendors = [];

  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (context.read<ClientVendorCubit>().isClosed) {
      LoggerSingleton.logger.i('The Bloc is closed.');
    }
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.client_vendor,
        onAddPressed: () {
          AppNavigation.push(AddClientVendorPage(
            newIndex: newIndex,
          ));
        },
      ),
      body: BlocBuilder<ClientVendorCubit, ClientVendorState>(
        builder: (context, state) {
          return state.when(initial: () {
            return const Text('Initial State');
          }, loading: () {
            return Center(child: Loader());
          }, success: (data) {
            newIndex = data == [] ? 1 : data.last.clientVendorNo.round() + 1;
            return ListView(
              // padding: const EdgeInsets.symmetric(horizontal: 10.0),
              children: [
                // ...data.map((e) => Text(e.clientVendorNo.toString())),
                data == []
                    ? const Text('No Records')
                    : SizedBox(
                        height: MediaQuery.of(context).size.height - 100,
                        child: DataGridPaginated(
                          onEditPressed: (id) {
                            AppNavigation.push(
                              AddClientVendorPage(
                                newIndex: id.round(),
                                isEdit: true,
                                data: data.firstWhere((element) =>
                                    element.clientVendorNumber.round() == id),
                              ),
                            );
                          },
                          onDeletePressed: (id) {
                            context
                                .read<ClientVendorCubit>()
                                .deleteClientVendor(id: id);
                            data.removeWhere(
                                (element) => element.clientVendorNumber == id);
                            showOKDialog(
                              context: context,
                              title: AppLocalizations.of(context)!.success,
                              message: '',
                            );
                          },
                          data: data,
                          allowFiltering: true,
                          fill: Platform.isLinux ||
                              Platform.isMacOS ||
                              Platform.isWindows,
                        ),
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
