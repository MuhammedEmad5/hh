// import 'package:appy_einvoice_flutter/core/presentation/widgets/app_bar.dart';
// import 'package:appy_einvoice_flutter/core/presentation/widgets/custom_error_widget.dart';
// import 'package:appy_einvoice_flutter/core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
// import 'package:appy_einvoice_flutter/core/presentation/widgets/loader_widget.dart';
// import 'package:appy_einvoice_flutter/features/product/products_list/presentation/manager/product_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import '../../../../../core/config/colors.dart';

// class ProductsListPage extends StatefulWidget {
//   const ProductsListPage({super.key});

//   @override
//   State<ProductsListPage> createState() => _ProductsListPageState();
// }

// class _ProductsListPageState extends State<ProductsListPage> {
//   bool isList = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: AppLocalizations.of(context)?.productList ?? 'Products List',
//         color: AppColors.primaryColor,
//         textColor: AppColors.onPrimary,
//         addBtnColor: AppColors.onPrimary,
//         onAddPressed: () {},
//       ),
//       body: BlocBuilder<ProductCubit, ProductState>(
//         builder: (context, state) {
//           return state.when(
//               initial: () => const SizedBox(),
//               loading: () {
//                 context.read<ProductCubit>().getAllProducts();
//                 return const Center(
//                   child: Loader(),
//                 );
//               },
//               success: (branches) {
//                 return ListView(
//                   children: [
//                     ExpansionTile(
//                       title: Text(
//                         AppLocalizations.of(context)?.search ?? 'Search',
//                       ),
//                       children: [
//                         TextFormField(
//                           onTapOutside: (_) {
//                             FocusScope.of(context).unfocus();
//                           },
//                           decoration: InputDecoration(
//                             hintText:
//                                 AppLocalizations.of(context)?.nameOrBarcode ??
//                                     "Name or Barcode",
//                             prefixIcon: const Icon(
//                               Icons.search,
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               },
//               error: (e) => CustomErrorWidget(
//                     errorMessage: e,
//                   ),
//               empty: () {
//                 return CustomEmptyWidget(
//                   text: AppLocalizations.of(context)!.no_db_available,
//                 );
//               });
//         },
//       ),
//     );
//   }
// }
