import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/presentation/widgets/app_bar.dart';
import '../../../purchase/purchase_invoice/data/repositories/invoice_buy_repo_impl.dart';
import '../../../purchase/purchase_invoice/di/invoice_buy_service.dart';
import '../../../purchase/purchase_invoice/presentation/manager/invoice_buy_cubit.dart';
import '../../../purchase/purchase_invoice/presentation/pages/purchase_invoice_list_ss_page.dart';
import '../../../purchase/purchase_return_invoice/di/purchase_return_invoice_service.dart';
import '../../../purchase/purchase_return_invoice/presentation/manager/purchase_return_invoice_cubit.dart';
import '../../../purchase/purchase_return_invoice/presentation/pages/purchase_return_invoice_list.dart';
import '../../home_models/screen_item_model.dart';
import '../widgets/screen_item_card.dart';

class TransactionsView extends StatelessWidget {
  late AppLocalizations appLocalizations;
  TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    Route _buildPageRoute({
      required WidgetBuilder builder,
    }) {
      return Platform.isIOS
          ? CupertinoPageRoute(
              builder: builder,
            )
          : MaterialPageRoute(
              builder: builder,
            );
    }

    List<ScreenItem> transactionsScreens = [

      ScreenItem(
        appLocalizations.purchase_invoice,
        'purchaseinvoice',
        () {
          InvoiceBuyService().initDi();
          AppNavigation.pushPageRoute(
            _buildPageRoute(
              builder: (context) {
                return RepositoryProvider(
                    create: (context) => GetIt.I<InvoiceBuyRepo>(),
                    child: BlocProvider<InvoiceBuyCubit>.value(
                      value: GetIt.I<InvoiceBuyCubit>(),
                      child: const BuyInvoiceSSPage(),
                    ));
              },
            ),
          );
        },
      ),


      ScreenItem(
        appLocalizations.purchase_invoice_return,
        'purchasereturn',
        () {
          PurchaseReturnInvoiceService().initDi();
          AppNavigation.pushPageRoute(
            _buildPageRoute(
              builder: (context) {
                return RepositoryProvider(
                    create: (context) => GetIt.I<PurchaseReturnInvoiceState>(),
                    child: BlocProvider<PurchaseReturnInvoiceCubit>.value(
                      value: GetIt.I<PurchaseReturnInvoiceCubit>()
                        ..getAllPurchaseReturnInvoice(),
                      child: const PurchaseReturnInvoiceListPage(),
                    ));
              },
            ),
          );
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
