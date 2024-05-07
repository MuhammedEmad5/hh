import 'dart:io';

import 'package:InvoiceF/core/navigation/navigation.dart';
import 'package:InvoiceF/features/tax/tax_declaration/data/repositories/tax_declaration_repo.dart';
import 'package:InvoiceF/features/tax/tax_declaration/di/tax_declaration_service.dart';
import 'package:InvoiceF/features/tax/tax_declaration/presentation/manager/tax_declaration_cubit.dart';
import 'package:InvoiceF/features/tax/tax_declaration/presentation/pages/tax_declaration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/presentation/widgets/app_bar.dart';
import '../../home_models/screen_item_model.dart';
import '../widgets/screen_item_card.dart';

class ReportsView extends StatelessWidget {
  late AppLocalizations appLocalizations;
  ReportsView({super.key});
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

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;

    List<ScreenItem> reportsScreens = [
      ScreenItem(
        appLocalizations.vat_reports_tax_declaration,
        'taxdeclaration',
        () {
          TaxDeclarationService().initDi();
          AppNavigation.pushPageRoute(
            _buildPageRoute(
              builder: (context) {
                return RepositoryProvider(
                    create: (context) => GetIt.I<TaxDeclarationRepo>(),
                    child: BlocProvider<TaxDeclarationCubit>.value(
                      value: GetIt.I<TaxDeclarationCubit>()..reset(),
                      child: const TaxDeclarationPage(),
                    ));
              },
            ),
          );
        },
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
