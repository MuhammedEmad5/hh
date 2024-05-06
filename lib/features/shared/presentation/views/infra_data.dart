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

import '../../../client_vendor/client_vendor_list/data/repositories/client_vendor_repo.dart';
import '../../../client_vendor/client_vendor_list/di/client_vendor_service.dart';
import '../../../client_vendor/client_vendor_list/presentation/manager/client_vendor_cubit.dart';
import '../../../client_vendor/client_vendor_list/presentation/pages/client_vendor_page.dart';
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
import '../../../configuration/unit/data/repositories/unit_repo.dart';
import '../../../configuration/unit/di/unit_service.dart';
import '../../../configuration/unit/presentation/manager/unit_cubit.dart';
import '../../../configuration/unit/presentation/views/unit_page.dart';
import '../../../configuration/user_options/presentation/pages/user_options_view.dart';
import '../../../product/product_classification/data/repositories/product_classification_impl.dart';
import '../../../product/product_classification/di/product_classification_service.dart';
import '../../../product/product_classification/presentation/manager/product_classification_cubit.dart';
import '../../../product/product_classification/presentation/pages/product_classification_view.dart';
import '../../../product/products_list/data/repositories/product_repo_impl.dart';
import '../../../product/products_list/di/product_service.dart';
import '../../../product/products_list/presentation/manager/product_cubit.dart';
import '../../../product/products_list/presentation/pages/product_ss_page.dart';
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
        appLocalizations.product,
        'products',
        () {
          ProductService().initDi();
          AppNavigation.pushPageRoute(_buildPageRoute(
            builder: (context) {
              return RepositoryProvider(
                create: (context) => GetIt.I<ProductRepo>(),
                child: BlocProvider<ProductCubit>.value(
                  value: GetIt.I<ProductCubit>(),
                  child: const ProductSSPage(),
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
      ScreenItem(appLocalizations.client_vendor, 'clientvendor', () {
        ClientVendorService().initDi();
        AppNavigation.pushPageRoute(_buildPageRoute(
          builder: (context) {
            return RepositoryProvider(
                create: (context) => GetIt.I<ClientVendorRepo>(),
                child: BlocProvider<ClientVendorCubit>.value(
                  value: GetIt.I<ClientVendorCubit>()..getClientsVendors(),
                  child: const ClientVendorPage(),
                ));
          },
        ));
      }),
      ScreenItem(
        appLocalizations.products_classification,
        'productsclassification',
        () {
          ProductClassificationService().initDi();
          AppNavigation.pushPageRoute(
            _buildPageRoute(
              builder: (context) {
                return RepositoryProvider(
                  create: (context) => GetIt.I<ProductClassificationRepo>(),
                  child: BlocProvider<ProductClassificationCubit>.value(
                    value: GetIt.I<ProductClassificationCubit>()
                      ..getAllProduct(),
                    child: const ProductClassificationView(),
                  ),
                );
              },
            ),
          );
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
        () {
          AppNavigation.pushPageRoute(_buildPageRoute(
            builder: (context) {
              return const UserOptionView();
            },
          ));
        },
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
        () {

    }

      ),
      ScreenItem(
        appLocalizations.banks,
        'bank',
        () {
          AppNavigation.pushPageRoute(_buildPageRoute(
            builder: (context) {
              return const BanksView();
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
