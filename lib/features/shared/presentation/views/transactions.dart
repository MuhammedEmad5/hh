import 'dart:io';
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
        appLocalizations.receive_bill,
        'receivebill',
        () {},
      ),
      ScreenItem(
        appLocalizations.payment_bill,
        'paymentbill',
        () {},
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
