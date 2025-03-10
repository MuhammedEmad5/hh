import 'package:InvoiceF/features/configuration/banks/data/repositories/banks_repo.dart';
import 'package:InvoiceF/features/configuration/banks/presentation/manager/bank_cubit.dart';
import 'package:InvoiceF/features/configuration/device_options/data/repositories/device_options_repo_impl.dart';
import 'package:InvoiceF/features/configuration/device_options/presentation/manager/device_option_cubit.dart';
import 'package:InvoiceF/features/configuration/device_options/presentation/pages/device_option.dart';
import 'package:InvoiceF/features/configuration/user_options/data/repositories/user_options_repo.dart';
import 'package:InvoiceF/features/configuration/user_options/di/user_options_service.dart';
import 'package:InvoiceF/features/configuration/user_options/presentation/manager/user_options_cubit.dart';
import 'package:InvoiceF/features/configuration/company_bill_type_options/data/repositories/company_bill_type_repo.dart';
import 'package:InvoiceF/features/configuration/company_bill_type_options/di/company_bill_type_service.dart';
import 'package:InvoiceF/features/configuration/company_bill_type_options/presentation/manager/company_bill_type_options_cubit.dart';
import 'package:InvoiceF/features/configuration/company_bill_type_options/presentation/views/company_bill_type_options_page.dart';
import 'package:InvoiceF/features/configuration/accounting_options/presentation/pages/accounting_options_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/presentation/widgets/app_bar.dart';
import '../../../configuration/banks/di/bank_service.dart';
import '../../../configuration/banks/presentation/pages/banks_view.dart';
import '../../../configuration/branch/data/repositories/branch_repo_impl.dart';
import '../../../configuration/branch/di/branch_service.dart';
import '../../../configuration/branch/presentation/manager/branch_cubit.dart';
import '../../../configuration/branch/presentation/pages/branches__view.dart';
import '../../../configuration/company/data/repositories/company_repo_impl.dart';
import '../../../configuration/company/di/company_service.dart';
import '../../../configuration/company/presentation/manager/company_cubit.dart';
import '../../../configuration/company/presentation/pages/company_view.dart';
import '../../../configuration/company_unit/data/repositories/company_unit_repo.dart';
import '../../../configuration/company_unit/di/company_unit_service.dart';
import '../../../configuration/company_unit/presentation/manager/company_unit_cubit.dart';
import '../../../configuration/company_unit/presentation/views/company_unit_page.dart';
import '../../../configuration/device_options/di/device_option_service.dart';
import '../../../configuration/unit/data/repositories/unit_repo.dart';
import '../../../configuration/unit/di/unit_service.dart';
import '../../../configuration/unit/presentation/manager/unit_cubit.dart';
import '../../../configuration/unit/presentation/views/unit_page.dart';
import '../../../configuration/user_options/presentation/pages/user_options_view.dart';

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
      ScreenItem(appLocalizations.branch_store_cashier, 'branch', () {
        BranchService().initDi();
        AppNavigation.pushPageRoute(_buildPageRoute(builder: (context) {
          return RepositoryProvider(
              create: (context) => GetIt.I<BranchRepo>(),
              child: BlocProvider<BranchCubit>.value(
                  value: GetIt.I<BranchCubit>()..getAllBranches(),
                  child: const BranchesView()));
        }));
      }),
      ScreenItem(
        appLocalizations.company_bill_type_Options,
        'companybill',
        () {
          CompanyBillTypeService().initDi();
          AppNavigation.pushPageRoute(_buildPageRoute(
            builder: (context) {
              return RepositoryProvider(
                create: (context) => GetIt.I<CompanyBillTypeRepo>(),
                child: BlocProvider<CompanyBillTypeCubit>.value(
                  value: GetIt.I<CompanyBillTypeCubit>()
                    ..getAllCompanyBillTypes(),
                  child: const CompanyBillTypeOptionsPage(),
                ),
              );
            },
          ));
        },
      ),
      ScreenItem(appLocalizations.unit, 'units', () {
        UnitService().initDi();
        AppNavigation.pushPageRoute(
          _buildPageRoute(
            builder: (context) {
              return RepositoryProvider(
                create: (context) => GetIt.I<UnitRepo>(),
                child: BlocProvider<UnitCubit>.value(
                  value: GetIt.I<UnitCubit>()..getAllUnits(),
                  child: const UnitPage(),
                ),
              );
            },
          ),
        );
      }),
      ScreenItem(
        appLocalizations.company,
        'company',
        () {
          CompanyService().initDi();
          AppNavigation.pushPageRoute(_buildPageRoute(
            builder: (context) {
              return RepositoryProvider(
                create: (context) => GetIt.I<CompanyRepo>(),
                child: BlocProvider<CompanyCubit>.value(
                  value: GetIt.I<CompanyCubit>()..getAllCompanies(),
                  child: CompanyView(),
                ),
              );
            },
          ));
        },
      ),
      ScreenItem(
        appLocalizations.company_unit,
        'companyunits',
        () {
          CompanyUnitService().initDi();
          AppNavigation.pushPageRoute(_buildPageRoute(
            builder: (context) {
              return RepositoryProvider(
                create: (context) => GetIt.I<CompanyUnitRepo>(),
                child: BlocProvider<CompanyUnitCubit>.value(
                  value: GetIt.I<CompanyUnitCubit>()..getAllCompanyUnits(),
                  child: const CompanyUnitPage(),
                ),
              );
            },
          ));
        },
      ),
      ScreenItem(
        appLocalizations.user_options,
        'useroptions',
        () {
          AppNavigation.pushPageRoute(_buildPageRoute(
            builder: (context) {
              UserOptionsService().initDi();

              return RepositoryProvider<UserOptionsRepo>(
                create: (context) => GetIt.I<UserOptionsRepo>(),
                child: BlocProvider<UserOptionsCubit>.value(
                  value: GetIt.I<UserOptionsCubit>()..getAllThemes(),
                  child: UserOptionView(),
                ),
              );
            },
          ));
        },
      ),
      ScreenItem(
        appLocalizations.accounting_options,
        'acc',
        () {
          AppNavigation.pushPageRoute(_buildPageRoute(
            builder: (context) {
              return const AccountingOptionsPage();
            },
          ));
        },
      ),
      ScreenItem(
        appLocalizations.device_options,
        'pc',
        () {
          DeviceOptionService().initDi();
          AppNavigation.pushPageRoute(_buildPageRoute(
            builder: (context) {
              return RepositoryProvider(
                  create: (context) => GetIt.I<DeviceOptionRepo>(),
                  child: BlocProvider<DeviceOptionCubit>.value(
                      value: GetIt.I<DeviceOptionCubit>()..getDeviceOptionObject(),
                      child: const DeviceOptionView()));
            },
          ));
        },
      ),
      ScreenItem(
        appLocalizations.barcode,
        'barcode',
        () {},
      ),
      ScreenItem(
        appLocalizations.domain,
        'domain',
        () {},
      ),
      ScreenItem(appLocalizations.backup_restore, 'backup', () {}),
      ScreenItem(
        appLocalizations.banks,
        'bank',
        () {
          AppNavigation.pushPageRoute(_buildPageRoute(
            builder: (context) {
              BankService().initDi();
              return RepositoryProvider<BanksRepo>(
                create: (context) => GetIt.I<BanksRepo>(),
                child: BlocProvider<BankCubit>.value(
                  value: GetIt.I<BankCubit>()..getAllBanks(),
                  child: const BanksView(),
                ),
              );
            },
          ));
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
