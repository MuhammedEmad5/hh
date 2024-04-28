
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
import '../../../configuration/unit/data/repositories/unit_repo.dart';
import '../../../configuration/unit/di/unit_service.dart';
import '../../../configuration/unit/presentation/manager/unit_cubit.dart';
import '../../../configuration/unit/presentation/views/unit_page.dart';
import '../../../configuration/user_registration/data/repositories/user_registration_impl.dart';
import '../../../configuration/user_registration/di/user_registration_service.dart';
import '../../../configuration/user_registration/presentation/manager/user_registration_cubit.dart';
import '../../../configuration/user_registration/presentation/pages/users_view.dart';
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
        appLocalizations.branch_store_cashier,
        'branch',
        () {
          BranchService().initDi();
          AppNavigation.pushPageRoute(_buildPageRoute(
            builder: (context) {
              return RepositoryProvider(
                create: (context) => GetIt.I<BranchRepo>(),
                child: BlocProvider<BranchCubit>.value(
                  value: GetIt.I<BranchCubit>()..getAllBranches(),
                  child: const BranchesView(),
                ),
              );
            },
          ));
        },
      ),

      ScreenItem(
        appLocalizations.company_bill_type_Options,
        'companybill',
        () {},
      ),
      ScreenItem(
        appLocalizations.unit,
        'units',
        () {
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
        },
      ),
      ScreenItem(
        appLocalizations.user_registration,
        'userregisteration',
        () {
          UserRegistrationService().initDi();
          BranchService().initDi();

          AppNavigation.pushPageRoute(_buildPageRoute(builder: (context) {
            return MultiRepositoryProvider(
                providers: [
                  RepositoryProvider(
                    create: (context) => GetIt.I<UserRegistrationRepo>(),
                  ),
                  RepositoryProvider(
                    create: (context) => GetIt.I<BranchRepo>(),
                  )
                ],
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: GetIt.I<UserRegistrationCubit>()..getAllUsers(),
                    ),
                    BlocProvider.value(
                      value: GetIt.I<BranchCubit>(),
                    )
                  ],
                  child: UsersView(),
                ));
          }));
        },
      ),
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
        () {},
      ),
      ScreenItem(
        appLocalizations.accounting_options,
        'acc',
        () {},
      ),
      ScreenItem(
        appLocalizations.device_options,
        'pc',
        () {},
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
      ScreenItem(
        appLocalizations.backup_restore,
        'backup',
        () {},
      ),
      ScreenItem(
        appLocalizations.banks,
        'bank',
        () {},
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
