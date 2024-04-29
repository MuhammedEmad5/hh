import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/navigation/navigation.dart';
import '../../../../core/presentation/widgets/app_bar.dart';
import '../../../transaction_reporting/presentation/pages/invoice_a4_page.dart';
import '../../home_models/screen_item_model.dart';
import '../widgets/screen_item_card.dart';


class ReportsView extends StatelessWidget {

  late AppLocalizations appLocalizations;
   ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;


    List<ScreenItem> reportsScreens = [
      ScreenItem(
        appLocalizations.invoice_A4,
        'invoicea4',
            () {
          AppNavigation.push(const InvoiceA4Page());
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
      appBar:  CustomAppBar(
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

