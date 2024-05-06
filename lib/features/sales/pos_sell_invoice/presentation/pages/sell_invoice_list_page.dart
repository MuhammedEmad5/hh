// import 'dart:io';

// import 'package:appy_einvoice_flutter/core/data/datasources/local_data_source/local_connection.dart';
// import 'package:appy_einvoice_flutter/core/presentation/widgets/app_bar.dart';
// import 'package:appy_einvoice_flutter/core/presentation/widgets/custom_error_widget.dart';
// import 'package:appy_einvoice_flutter/core/presentation/widgets/data_grid_paginated.dart';
// import 'package:appy_einvoice_flutter/core/presentation/widgets/loader_widget.dart';
// import 'package:appy_einvoice_flutter/features/sales/data/repositories/sales_repo.dart';
// import 'package:appy_einvoice_flutter/features/sales/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';
// import 'package:appy_einvoice_flutter/features/sales/domain/use_cases/branch_use_cases/create_invoice_sell_use_case.dart';
// import 'package:appy_einvoice_flutter/features/sales/domain/use_cases/branch_use_cases/delete_invoice_sell_use_case.dart';
// import 'package:appy_einvoice_flutter/features/sales/domain/use_cases/branch_use_cases/read_invoice_sell_use_case.dart';
// import 'package:appy_einvoice_flutter/features/sales/domain/use_cases/branch_use_cases/update_invoice_sell_use_case.dart';
// import 'package:appy_einvoice_flutter/features/sales/presentation/manager/sales_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SellInvoicePage extends StatefulWidget {
//   const SellInvoicePage({super.key});

//   @override
//   State<SellInvoicePage> createState() => _SellInvoicePageState();
// }

// class _SellInvoicePageState extends State<SellInvoicePage> {
//   List<Widget> data = [];

//   addSellInvoice() {
//     InvoiceSellEntity newInvoice = InvoiceSellEntity(
//       userNumber: '0',
//       aName: 'aName',
//       eName: 'eName',
//       subNetTotal: 0,
//       subNetTotalPlusTax: 0,
//       subTotalDiscount: 0,
//       buildingNo: 1,
//       amountLeft: 0,
//       amountPayed: 0,
//       isPosted: false,
//       StoreNo: 1,
//       VATTypeNO: 1,
//       clientVendorNo: 1,
//       invoiceNo: 1,
//       invoiceVATID: 'invoiceVATID.text',
//       note: '',
//       paperBillNum: '1',
//       telephone: 'telephone',
//       dateG: '2022-05-31T20:55:11.100Z',
//     );
//     context.read<SalesCubit>().insertInvoiceSell(newInvoice);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider(
//       create: (context) => SalesRepo((LocalConnection())),
//       child: BlocProvider(
//         create: (context) => SalesCubit(
//           salesRepo: context.read<SalesRepo>(),
//           createInvoiceSellUseCase:
//               CreateInvoiceSellUseCase(salesRepo: context.read<SalesRepo>()),
//           readInvoiceSellUseCase:
//               ReadInvoiceSellUseCase(salesRepo: context.read<SalesRepo>()),
//           updateInvoiceSellUseCase:
//               UpdateInvoiceSellUseCase(salesRepo: context.read<SalesRepo>()),
//           deleteInvoiceSellUseCase:
//               DeleteInvoiceSellUseCase(salesRepo: context.read<SalesRepo>()),
//         ),
//         child: Scaffold(
//           appBar: CustomAppBar(
//             title: 'Sell Invoice',
//             onAddPressed: () {},
//           ),
//           body: SafeArea(
//             child: BlocBuilder<SalesCubit, SalesState>(
//               builder: (context, state) {
//                 return state.when(
//                   initial: () {
//                     return const Text('Initial State');
//                   },
//                   loading: () {
//                     // context.read<SalesCubit>().getInvoiceSells();
//                     context.read<SalesCubit>().getInvoiceSell(id: 20);
//                     return const Loader();
//                   },
//                   success: (data) {
//                     return ListView(
//                       // padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             // context
//                             //     .read<SalesCubit>()
//                             //     .updateClientVendor(
//                             //         clientVendorEntity: ClientVendorEntity(
//                             //             clientVendorNo: 348,
//                             //             aName: 'Arabic Name 00000000',
//                             //             eName: 'English Name000000'));

//                             // context.read<SalesCubit>().getInvoiceSell(id: 23);

//                             // context
//                             //     .read<SalesCubit>()
//                             //     .deleteInvoiceSell(id: 70);

//                             // context.read<SalesCubit>().updateInvoiceSell(
//                             //         invoiceSellEntity: InvoiceSellEntity(
//                             //       invoiceNo: 71,
//                             //       aName: 'Test aName',
//                             //       eName: 'Test eName',
//                             //       subNetTotal: 0.0,
//                             //       subNetTotalPlusTax: 0.0,
//                             //       subTotalDiscount: 0.0,
//                             //       buildingNo: 1,
//                             //       amountLeft: 0.0,
//                             //       amountPayed: 0.0,
//                             //       isPosted: false,
//                             //       StoreNo: 1,
//                             //       VATTypeNO: 1,
//                             //       clientVendorNo: 1,
//                             //     ));

//                             // InvoiceSellEntity newInvoice = InvoiceSellEntity(
//                             //   aName: 'aName',
//                             //   eName: 'eName',
//                             //   subNetTotal: 0,
//                             //   subNetTotalPlusTax: 0,
//                             //   subTotalDiscount: 0,
//                             //   buildingNo: 1,
//                             //   amountLeft: 0,
//                             //   amountPayed: 0,
//                             //   isPosted: 0,
//                             //   StoreNo: 1,
//                             //   VATTypeNO: 1,
//                             //   clientVendorNo: 1,
//                             //   invoiceNo: 500000,
//                             //   invoiceVATID: 'invoiceVATID.text',
//                             //   note: '',
//                             //   paperBillNum: '1',
//                             //   telephone: 'telephone',
//                             //   dateG: '2022-05-31T20:55:11.100Z',
//                             // );
//                             // context
//                             //     .read<SalesCubit>()
//                             //     .insertInvoiceSell(newInvoice);
//                             context
//                                 .read<SalesCubit>()
//                                 .deleteInvoiceSell(id: 500000);
//                           },
//                           child: Text('Query test'),
//                         ),
//                         const SizedBox(height: 10),
//                         DataGridPaginated(
//                           data: data,
//                           allowFiltering: true,
//                           fill: Platform.isLinux ||
//                               Platform.isMacOS ||
//                               Platform.isWindows,
//                         )

//                         // FilterBar(
//                         //   onSearchFieldChanged: (value) => searchField = value,
//                         //   onSearchTermChanged: (value) => searchTerm = value,
//                         //   onAddPressed: () =>
//                         //       AppNavigation.push(const AddClientVendorView()),
//                         //   onApplyPressed: () => context
//                         //       .read<SalesCubit>()
//                         //       .getClientVendor(id: 5),
//                         //   onClearPressed: () => print('Clear'),
//                         //   expandedHeight: fHeight,
//                         //   // children: filters,
//                         // ),
//                         // PagesFormView(data: getDataCards(data)),
//                       ],
//                     );
//                   },
//                   error: (e) {
//                     return CustomErrorWidget(errorMessage: e);
//                   },
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );

//     // return Scaffold(
//     //   appBar: const CustomAppBar(
//     //     title: 'Sell Invoice',
//     //   ),
//     //   // body: ListView(
//     //   //   padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
//     //   //   children: [
//     //   //     FilterBar(
//     //   //       onSearchFieldChanged: (value) {},
//     //   //       onSearchTermChanged: (value) {},
//     //   //       expandedHeight: 350,
//     //   //       onClearPressed: () {},
//     //   //       onApplyPressed: () {},
//     //   //       onAddPressed: () {
//     //   //         AppNavigation.push(const AddSellInvoice());
//     //   //       },
//     //   //       // onAddFieldPressed: () {},
//     //   //     ),
//     //   //     PagesFormView(itemsPerPage: 3, data: [
//     //   //       SellInvoiceDataCard(),
//     //   //       SellInvoiceDataCard(),
//     //   //       SellInvoiceDataCard(),
//     //   //       SellInvoiceDataCard(),
//     //   //       SellInvoiceDataCard(),
//     //   //       SellInvoiceDataCard(),
//     //   //       SellInvoiceDataCard(),
//     //   //       SellInvoiceDataCard()
//     //   //     ]),
//     //   // ],
//     //   // ),
//     // );
//   }
// }
