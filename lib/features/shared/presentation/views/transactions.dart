import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/presentation/widgets/app_bar.dart';
import '../../../sales/invoice_sale_return/data/repositories/invoice_sale_return_repo.dart';
import '../../../sales/invoice_sale_return/di/invoice_sale_return_service.dart';
import '../../../sales/invoice_sale_return/presentation/manager/invoice_sale_return_cubit.dart';
import '../../../sales/invoice_sale_return/presentation/pages/invoice_sale_return_list.dart';
import '../../../sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';
import '../../../sales/pos_sell_invoice/di/invoice_sell_service.dart';
import '../../../sales/pos_sell_invoice/presentation/manager/invoice_sell_cubit.dart';
import '../../../sales/pos_sell_invoice/presentation/pages/sell_invoice_list_ss_page.dart';
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
        appLocalizations.pos_sell_invoice,
        'posinvoice',
        () {
          InvoiceSellService().initDi();
          AppNavigation.pushPageRoute(
            _buildPageRoute(
              builder: (context) {
                return RepositoryProvider(
                    create: (context) => GetIt.I<InvoiceSellRepo>(),
                    child: BlocProvider<InvoiceSellCubit>.value(
                      value: GetIt.I<InvoiceSellCubit>(),
                      child: const SellInvoiceSSPage(),
                    ));
              },
            ),
          );
        },
      ),

      ScreenItem(
        appLocalizations.sell_invoice_return,
        'salereturn',
        () {
          InvoiceSaleReturnService().initDi();
          AppNavigation.pushPageRoute(
            _buildPageRoute(
              builder: (context) {
                return RepositoryProvider(
                    create: (context) => GetIt.I<InvoiceSaleReturnRepo>(),
                    child: BlocProvider<InvoiceSaleReturnCubit>.value(
                      value: GetIt.I<InvoiceSaleReturnCubit>()
                        ..getAllInvoiceSalesReturn(),
                      child: const InvoiceSaleReturnListPage(),
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
