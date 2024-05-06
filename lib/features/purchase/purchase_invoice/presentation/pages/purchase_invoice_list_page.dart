// import 'dart:io';

// import 'package:appy_einvoice_flutter/core/presentation/widgets/app_bar.dart';
// import 'package:appy_einvoice_flutter/core/presentation/widgets/custom_error_widget.dart';
// import 'package:appy_einvoice_flutter/core/presentation/widgets/data_grid_paginated.dart';
// import 'package:appy_einvoice_flutter/core/presentation/widgets/loader_widget.dart';
// import 'package:appy_einvoice_flutter/features/purchase/purchase_invoice/domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart';
// import 'package:appy_einvoice_flutter/features/purchase/purchase_invoice/presentation/manager/invoice_buy_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BuyInvoicePage extends StatefulWidget {
//   const BuyInvoicePage({super.key});

//   @override
//   State<BuyInvoicePage> createState() => _BuyInvoicePageState();
// }

// class _BuyInvoicePageState extends State<BuyInvoicePage> {
//   List<Widget> data = [];

//   addBuyInvoice() {
//     InvoiceBuyEntity newInvoice = InvoiceBuyEntity(
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
//     context.read<InvoiceBuyCubit>().insertInvoiceBuy(newInvoice);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Buy Invoice',
//         onAddPressed: () {},
//       ),
//       body: SafeArea(
//         child: BlocBuilder<InvoiceBuyCubit, InvoiceBuyState>(
//           builder: (context, state) {
//             return state.when(
//               initial: () {
//                 return const Text('Initial State');
//               },
//               loading: () {
//                 // context.read<InvoiceBuyCubit>().getInvoiceBuys();
//                 context.read<InvoiceBuyCubit>().getInvoiceBuy(id: 20);
//                 return const Loader();
//               },
//               success: (data) {
//                 return ListView(
//                   // padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         // context
//                         //     .read<InvoiceBuyCubit>()
//                         //     .updateClientVendor(
//                         //         clientVendorEntity: ClientVendorEntity(
//                         //             clientVendorNo: 348,
//                         //             aName: 'Arabic Name 00000000',
//                         //             eName: 'English Name000000'));

//                         // context.read<InvoiceBuyCubit>().getInvoiceBuy(id: 23);

//                         // context
//                         //     .read<InvoiceBuyCubit>()
//                         //     .deleteInvoiceBuy(id: 70);

//                         // context.read<InvoiceBuyCubit>().updateInvoiceBuy(
//                         //         invoiceBuyEntity: InvoiceBuyEntity(
//                         //       invoiceNo: 71,
//                         //       aName: 'Test aName',
//                         //       eName: 'Test eName',
//                         //       subNetTotal: 0.0,
//                         //       subNetTotalPlusTax: 0.0,
//                         //       subTotalDiscount: 0.0,
//                         //       buildingNo: 1,
//                         //       amountLeft: 0.0,
//                         //       amountPayed: 0.0,
//                         //       isPosted: false,
//                         //       StoreNo: 1,
//                         //       VATTypeNO: 1,
//                         //       clientVendorNo: 1,
//                         //     ));

//                         // InvoiceBuyEntity newInvoice = InvoiceBuyEntity(
//                         //   aName: 'aName',
//                         //   eName: 'eName',
//                         //   subNetTotal: 0,
//                         //   subNetTotalPlusTax: 0,
//                         //   subTotalDiscount: 0,
//                         //   buildingNo: 1,
//                         //   amountLeft: 0,
//                         //   amountPayed: 0,
//                         //   isPosted: 0,
//                         //   StoreNo: 1,
//                         //   VATTypeNO: 1,
//                         //   clientVendorNo: 1,
//                         //   invoiceNo: 500000,
//                         //   invoiceVATID: 'invoiceVATID.text',
//                         //   note: '',
//                         //   paperBillNum: '1',
//                         //   telephone: 'telephone',
//                         //   dateG: '2022-05-31T20:55:11.100Z',
//                         // );
//                         // context
//                         //     .read<InvoiceBuyCubit>()
//                         //     .insertInvoiceBuy(newInvoice);
//                         context
//                             .read<InvoiceBuyCubit>()
//                             .deleteInvoiceBuy(id: 500000);
//                       },
//                       child: const Text('Query test'),
//                     ),
//                     const SizedBox(height: 10),
//                     DataGridPaginated(
//                       data: data,
//                       allowFiltering: true,
//                       fill: Platform.isLinux ||
//                           Platform.isMacOS ||
//                           Platform.isWindows,
//                     )

//                     // FilterBar(
//                     //   onSearchFieldChanged: (value) => searchField = value,
//                     //   onSearchTermChanged: (value) => searchTerm = value,
//                     //   onAddPressed: () =>
//                     //       AppNavigation.push(const AddClientVendorView()),
//                     //   onApplyPressed: () => context
//                     //       .read<InvoiceBuyCubit>()
//                     //       .getClientVendor(id: 5),
//                     //   onClearPressed: () => print('Clear'),
//                     //   expandedHeight: fHeight,
//                     //   // children: filters,
//                     // ),
//                     // PagesFormView(data: getDataCards(data)),
//                   ],
//                 );
//               },
//               error: (e) {
//                 return CustomErrorWidget(errorMessage: e);
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
