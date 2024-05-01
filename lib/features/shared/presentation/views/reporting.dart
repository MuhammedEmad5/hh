import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/navigation/navigation.dart';
import '../../../../core/presentation/widgets/app_bar.dart';
import '../../../invoice_a4/data/repositories/invoice_a4_repo_impl.dart';
import '../../../invoice_a4/di/invoice_a4_service.dart';
import '../../../invoice_a4/presentation/manager/invoice_a4_cubit.dart';
import '../../../invoice_a4/presentation/pages/invoice_a4_page.dart';
import '../../..//invoice_a4/presentation/pages/invoice_a4_page.dart';
import '../../home_models/screen_item_model.dart';
import '../widgets/screen_item_card.dart';

class ReportsView extends StatelessWidget {
  late AppLocalizations appLocalizations;
  ReportsView({super.key});

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

    List<ScreenItem> reportsScreens = [
      ScreenItem(
        appLocalizations.invoice_A4,
        'invoicea4',
        () {
          InvoiceA4Service().initDi();
          AppNavigation.pushPageRoute(
            _buildPageRoute(
              builder: (context) {
                return RepositoryProvider(
                    create: (context) => GetIt.I<InvoiceA4Repo>(),
                    child: BlocProvider<InvoiceA4Cubit>.value(
                      value: GetIt.I<InvoiceA4Cubit>(),
                      child: const InvoiceA4Page(),
                    ));
              },
            ),
          );
        },
      ),
      ScreenItem(
        appLocalizations.invoice_80mm,
        'posinvoicelarge',
        () {},
      ),
      ScreenItem(
        appLocalizations.invoice_56mm,
        'posinvoicesmall',
        () {},
      ),
      ScreenItem(
        appLocalizations.bill_A4,
        'printbill',
        () {},
      ),
      ScreenItem(
        appLocalizations.client_vendor_transaction,
        'clientvendortrans',
        () {},
      ),
      ScreenItem(
        appLocalizations.client_vendor_running_balance,
        'clientvendorrunningbalance',
        () {},
      ),
      ScreenItem(
        appLocalizations.vat_reports_tax_declaration,
        'taxdeclaration',
        () {},
      ),
      ScreenItem(
        appLocalizations.purchase_sales_with_vat_list,
        'purchasesalesvat',
        () {},
      ),
      ScreenItem(
        appLocalizations.purchase_sales_exempt_from_vat_exempts_list,
        'purchasesalesvatexempts',
        () {},
      ),
      ScreenItem(
        appLocalizations.purchase_sales_with_vat_exempts,
        'purchasesaleswithvatexempts',
        () {},
      ),
      ScreenItem(
        appLocalizations.exempts_list,
        'purchasesalesexemptsfromvat',
        () {},
      ),
      ScreenItem(
        appLocalizations.bills_deleted_numbers,
        'billspostedbutdeleted',
        () {},
      ),
      ScreenItem(
        appLocalizations.bills_posted_but_was_detected_list,
        'deletedbills',
        () {},
      ),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.reporting,
        showBack: false,
        showSettings: true,
      ),
      body: SingleChildScrollView(
        child: FB5Grid(
          classNames:
              'row-cols-xs-2 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 mx-2 my-3',
          children: [...reportsScreens.map((e) => ScreenItemCard(data: e))],
        ),
      ),
    );
  }
}
