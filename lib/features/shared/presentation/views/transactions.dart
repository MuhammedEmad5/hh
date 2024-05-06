import 'dart:io';
import 'package:InvoiceF/core/navigation/navigation.dart';
import 'package:InvoiceF/features/client_vendor/client_vendor_beginning_balance/data/repositories/beginning_balance_repo.dart';
import 'package:InvoiceF/features/client_vendor/client_vendor_beginning_balance/di/beginning_balance_service.dart';
import 'package:InvoiceF/features/client_vendor/client_vendor_beginning_balance/presentation/manager/beginning_balance_cubit.dart';
import 'package:InvoiceF/features/client_vendor/client_vendor_beginning_balance/presentation/pages/beginning_balance_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/presentation/widgets/app_bar.dart';
import '../../home_models/screen_item_model.dart';
import '../widgets/screen_item_card.dart';

class TransactionsView extends StatelessWidget {
  late AppLocalizations appLocalizations;
  TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    // Route _buildPageRoute({
    //   required WidgetBuilder builder,
    // }) {
    //   return Platform.isIOS
    //       ? CupertinoPageRoute(
    //           builder: builder,
    //         )
    //       : MaterialPageRoute(
    //           builder: builder,
    //         );
    // }

    Route _buildPageRoute({
      required WidgetBuilder builder,
    }) {
      return MaterialPageRoute( // Always use MaterialPageRoute for web
        builder: builder,
      );
    }

    List<ScreenItem> transactionsScreens = [

      ScreenItem(
        appLocalizations.beginning_balance,
        'clientvendorbalance',
        () {


          BeginningBalanceService().initDi();
          AppNavigation.pushPageRoute(_buildPageRoute(
            builder: (context) {
              return RepositoryProvider(
                create: (context) => GetIt.I<BeginningBalanceRepo>(),
                child: BlocProvider<BeginningBalanceCubit>.value(
                  value: GetIt.I<BeginningBalanceCubit>()..getAllBeginningBalance(),
                  child:  BeginningBalanceView(),
                ),
              );
            },
          ));


        },
      ),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.transactions,
        showBack: false,
        showSettings: true,
      ),
      body: SingleChildScrollView(
        child: FB5Grid(
          classNames:
              'row-cols-xs-2 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 mx-2 my-3',
          children: [
            ...transactionsScreens.map((e) => ScreenItemCard(data: e))
          ],
        ),
      ),
    );
  }
}
