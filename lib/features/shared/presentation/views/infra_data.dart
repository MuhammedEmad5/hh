
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'dart:io';
import 'package:get_it/get_it.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/presentation/widgets/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../client_vendor/client_vendor_list/data/repositories/client_vendor_repo.dart';
import '../../../client_vendor/client_vendor_list/di/client_vendor_service.dart';
import '../../../client_vendor/client_vendor_list/presentation/manager/client_vendor_cubit.dart';
import '../../../client_vendor/client_vendor_list/presentation/pages/client_vendor_page.dart';
import '../../home_models/screen_item_model.dart';
import '../widgets/screen_item_card.dart';

//todo: Make sure we close all bloc in dispose
class InfraDataView extends StatelessWidget {
  late AppLocalizations appLocalizations;
  InfraDataView({super.key});

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;

    Route _buildPageRoute({
      required WidgetBuilder builder,
    }) {
      if (kIsWeb) {
        return MaterialPageRoute(builder: builder);
      }
      if (Platform.isIOS) {
        return CupertinoPageRoute(
          builder: builder,
        );
      }
      return MaterialPageRoute(
        builder: builder,
      );
    }

    List<ScreenItem> infraDataScreens = [



      ScreenItem(
        appLocalizations.client_vendor,
        'clientvendor',
        () {
          ClientVendorService().initDi();
          AppNavigation.pushPageRoute(
            _buildPageRoute(
              builder: (context) {
                return RepositoryProvider(
                    create: (context) => GetIt.I<ClientVendorRepo>(),
                    child: BlocProvider<ClientVendorCubit>.value(
                      value: GetIt.I<ClientVendorCubit>()..getClientsVendors(),
                      child: const ClientVendorPage(),
                    ));
              },
            ),
          );
        },
      ),



    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.infraData,
        showBack: false,
        showSettings: true,
      ),
      body: SingleChildScrollView(
        child: FB5Grid(
          classNames:
              'row-cols-xs-2 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 mx-2 my-3',
          children: [...infraDataScreens.map((e) => ScreenItemCard(data: e))],
        ),
      ),
    );
  }
}
