// ignore_for_file: use_build_context_synchronously

import 'package:InvoiceF_Sales/core/navigation/navigation.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/bottom_tab_bar.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/card.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/checkbox.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/custom_button.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/dropdown.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/dropdown_search.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/icon_button.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/label.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/ok_alert.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/split_screen.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/text_box.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/toast_notification.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/data/models/invoice_sell_return_model.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/data/repositories/invoice_sale_return_repo.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/presentation/manager/invoice_sale_return_cubit.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/presentation/pages/invoice_sale_return_list.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/domain/entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/presentation/manager/invoice_sell_cubit.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/presentation/pages/sell_invoice_list_ss_page.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/presentation/widgets/sell_item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/constants/colors.dart';

class SellInvoiceDetailsPage extends StatefulWidget {
  final int newIndex;
  final bool isEdit;
  final InvoiceSellEntity? data;
  final bool isAddInvoiceReturn;
  final bool isHomeCalled;
  final bool disableSave;
  final String? newIndexReturn;
  const SellInvoiceDetailsPage({
    super.key,
    required this.newIndex,
    this.isEdit = false,
    this.data,
    this.isAddInvoiceReturn = false,
    this.isHomeCalled = false,
    this.disableSave = false,
    this.newIndexReturn,
  });

  @override
  State<SellInvoiceDetailsPage> createState() => _SellInvoiceDetailsPageState();
}

class _SellInvoiceDetailsPageState extends State<SellInvoiceDetailsPage>
    with TickerProviderStateMixin {
  String dateG =
      '${DateTime.now().toString().substring(0, 10)} ${TimeOfDay.now().toString().substring(10, 15)}';
  String invoiceNo = '0';
  int clientVendorNo = 0;
  TextEditingController subNetTotal = TextEditingController();
  TextEditingController subTotalDiscount = TextEditingController();
  TextEditingController aName = TextEditingController();
  TextEditingController invoiceVATID = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController subNetTotalPlusTax = TextEditingController();
  TextEditingController amountLeft = TextEditingController();
  TextEditingController eName = TextEditingController();
  TextEditingController amountPayed = TextEditingController();
  TextEditingController paperBillNum = TextEditingController();
  TextEditingController storeNo = TextEditingController();
  TextEditingController vATTypeNO = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController barCode = TextEditingController();
  TextEditingController cash = TextEditingController();
  TextEditingController span = TextEditingController();
  TextEditingController visa = TextEditingController();
  TextEditingController vATNo = TextEditingController();
  TextEditingController taxRate1_Total = TextEditingController();
  int buildingNo = 0;
  bool isPosted = false;

  late TabController tabController;
  List<String> branchNames = [
    'Main Branch - الفرع الرئيسى',
  ];
  List<int> buildingNumbers = [0];
  List<String> clientVendorNamesList = ['ClientVendor'];
  List<int> clientVendorNumbers = [0];
  List<InvoiceSellUnitEntity> items = [];
  List<InvoiceSellUnitEntity> addedItems = [];
  List<InvoiceSellUnitEntity> deletedItems = [];
  List<InvoiceSellUnitEntity> updatedItems = [];
  List addedItemsValues = [];

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );

    invoiceNo = '${widget.newIndex == -1 ? 1 : widget.newIndex}';
    invoiceNo = invoiceNo == '0' ? '1' : invoiceNo;
    dateG = widget.data?.dateG ??
        '${DateTime.now().toString().substring(0, 10)} ${TimeOfDay.now().toString().substring(10, 15)}';
    subNetTotal.text = '${widget.data?.subNetTotal ?? '0'}';
    clientVendorNo =
        int.parse('${widget.data?.clientVendorNo?.round() ?? '0'}');
    subTotalDiscount.text = '${widget.data?.subTotalDiscount ?? '0'}';
    aName.text = widget.data?.aName ?? 'فاتورة بيع';
    invoiceVATID.text = widget.data?.invoiceVATID ?? '0';
    telephone.text = widget.data?.telephone ?? '';
    subNetTotalPlusTax.text = '${widget.data?.subNetTotalPlusTax ?? '0'}';
    buildingNo = (widget.data?.buildingNo == null
        ? 0
        : widget.data?.buildingNo.round())!;
    amountLeft.text = '${widget.data?.amountLeft ?? '0'}';
    eName.text = widget.data?.eName ?? 'Sale Invoice';
    amountPayed.text = '0';
    paperBillNum.text = '0';
    storeNo.text = '1';
    vATTypeNO.text = '1';
    taxRate1_Total.text = '${widget.data?.taxRate1_Total ?? '0'}';
    isPosted = widget.data?.isPosted != null
        ? widget.data!.isPosted == 0
            ? false
            : true
        : false;
    note.text = '';
    barCode.text = '';
    cash.text = '${widget.data?.amountPayed01 ?? '0'}';
    span.text = '${widget.data?.amountPayed02 ?? '0'}';
    visa.text = '${widget.data?.amountPayed03 ?? '0'}';
    vATNo.text = '0';
  }

  @override
  void dispose() {
    tabController.dispose();
    subNetTotal.dispose();
    subTotalDiscount.dispose();
    aName.dispose();
    invoiceVATID.dispose();
    telephone.dispose();
    subNetTotalPlusTax.dispose();
    amountLeft.dispose();
    eName.dispose();
    amountPayed.dispose();
    paperBillNum.dispose();
    storeNo.dispose();
    vATTypeNO.dispose();
    note.dispose();
    barCode.dispose();
    cash.dispose();
    span.dispose();
    visa.dispose();
    vATNo.dispose();
    taxRate1_Total.dispose();
    super.dispose();
  }

  calculate() {
    try {
      setState(() {
        try {
          // AMOUNT LEFT
          amountLeft.text = (double.parse(cash.text) +
                  double.parse(span.text) +
                  double.parse(visa.text) -
                  double.parse(subNetTotalPlusTax.text))
              .toStringAsFixed(2);
          // INVOICE TOTAL (without tax)
          num total = 0;
          for (var element in items) {
            total += element.quantity * element.price;
          }

          for (var element in addedItems) {
            var itemData = addedItemsValues[addedItemsValues
                .indexWhere((e) => e['itemNo'] == element.itemNo)];
            total += itemData['quantity'] * element.price;
          }
          subNetTotal.text =
              total is double ? total.toStringAsFixed(2) : total.toString();
          // DISCOUNT
          num discount = 0;
          for (var element in addedItems) {
            var itemData = addedItemsValues[addedItemsValues
                .indexWhere((e) => e['itemNo'] == element.itemNo)];
            discount += itemData['quantity'] *
                (element.discountPercent * element.price);
          }
          for (var element in items) {
            discount +=
                element.quantity * (element.discountPercent * element.price);
          }
          subTotalDiscount.text = discount is double
              ? discount.toStringAsFixed(2)
              : discount.toString();
          // VAT
          num totalVAT = 0;
          for (var element in items) {
            totalVAT += element.quantity *
                (element.taxRate1_Percentage *
                    (element.price - element.discount));
          }
          for (var element in addedItems) {
            var itemData = addedItemsValues[addedItemsValues
                .indexWhere((e) => e['itemNo'] == element.itemNo)];
            totalVAT += itemData['quantity'] *
                (element.taxRate1_Percentage *
                    (element.price - element.discount));
          }
          taxRate1_Total.text = totalVAT is double
              ? totalVAT.toStringAsFixed(2)
              : totalVAT.toString();
          // INVOICE NET VALUE
          num net = num.parse(subNetTotal.text) - discount + totalVAT;
          subNetTotalPlusTax.text =
              net is double ? net.toStringAsFixed(2) : net.toString();
        } catch (e) {
          print(e);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InvoiceSellCubit>.value(
      value: GetIt.I<InvoiceSellCubit>(),
      child: BlocBuilder<InvoiceSellCubit, InvoiceSellState>(
        builder: (context, state) {
          handleAddItem() async {
            late InvoiceSellUnitEntity newItem;
            try {
              newItem = await context
                  .read<InvoiceSellCubit>()
                  .searchItem(barCode.text, invoiceNo);
            } catch (e) {
              showToast(
                  context: context,
                  message: AppLocalizations.of(context)!.item_not_found);
            }

            if (addedItems.indexWhere(
                    (element) => element.itemNo == newItem.itemNo) !=
                -1) {
              showToast(
                  context: context,
                  message: AppLocalizations.of(context)!.item_already_added);
            } else if (items.indexWhere(
                    (element) => element.itemNo == newItem.itemNo) !=
                -1) {
              showToast(
                  context: context,
                  message: AppLocalizations.of(context)!.item_already_added);
            } else {
              addedItems.add(newItem);
              showToast(
                  context: context,
                  message: AppLocalizations.of(context)!.success);
              calculate();
            }
            Future.delayed(Duration(seconds: 1), () {
              calculate();
            });
          }

          if (!isLoaded) {
            context
                .read<InvoiceSellCubit>()
                .getInvoiceData(invoiceNo, widget.isEdit);
            isLoaded = true;
          }
          if (state is InvoiceSellDataLoaded) {
            if (widget.newIndex == -1) {
              invoiceNo = state.data['index'];
            }
            clientVendorNamesList = state.data['clientsVendors'][0];
            clientVendorNumbers = state.data['clientsVendors'][1];
            branchNames = state.data['branches'][0];
            buildingNumbers = state.data['branches'][1];
            if (widget.isEdit) {
              items = state.data['items'];
            }
            calculate();
          }
          return Scaffold(
            appBar: CustomAppBar(
              title: widget.isAddInvoiceReturn
                  ? AppLocalizations.of(context)!.sell_invoice_return
                  : widget.disableSave
                      ? AppLocalizations.of(context)!.sell_invoice_return
                      : AppLocalizations.of(context)!.pos_sell_invoice,
              color: AppColors.primaryColor,
              textColor: AppColors.onPrimary,
              addBtnColor: AppColors.onPrimary,
              onAddPressed: widget.isAddInvoiceReturn
                  ? () {
                      InvoiceSellReturn invoiceSellReturnEntity =
                          InvoiceSellReturn(
                        Inv_invoiceNo: int.parse(invoiceNo),
                        Inv_buildingNo: buildingNo,
                        invoiceNo: int.parse(widget.newIndexReturn!),
                        userNumber: invoiceNo,
                        aName: aName.text.isEmpty ? 'فاتورة بيع' : aName.text,
                        eName: eName.text.isEmpty ? 'Sale Invoice' : eName.text,
                        subNetTotal: double.parse(subNetTotal.text),
                        subNetTotalPlusTax:
                            double.parse(subNetTotalPlusTax.text),
                        subTotalDiscount: double.parse(subTotalDiscount.text),
                        buildingNo: buildingNo,
                        amountLeft: double.parse(amountLeft.text),
                        amountPayed: double.parse(amountPayed.text),
                        isPosted: isPosted ? 1 : 0,
                        clientVendorNo: clientVendorNo,
                        invoiceVATID: invoiceVATID.text,
                        note: note.text,
                        paperBillNum: paperBillNum.text,
                        telephone: telephone.text,
                        dateG: dateG,
                        taxRate1_Total: double.parse(taxRate1_Total.text),
                        amountCalculatedPayed: double.parse(cash.text) +
                            double.parse(span.text) +
                            double.parse(visa.text),
                      );
                      context
                          .read<InvoiceSellCubit>()
                          .insertInvoiceSellReturn(invoiceSellReturnEntity);
                      showOKDialog(
                          context: context,
                          title: AppLocalizations.of(context)!.success,
                          message: '',
                          onOkPressed: () {
                            AppNavigation.pop();
                            AppNavigation.pop();
                            AppNavigation.pushReplacement(RepositoryProvider(
                                create: (context) =>
                                    GetIt.I<InvoiceSaleReturnRepo>(),
                                child:
                                    BlocProvider<InvoiceSaleReturnCubit>.value(
                                  value: GetIt.I<InvoiceSaleReturnCubit>()
                                    ..getAllInvoiceSalesReturn(),
                                  child: const InvoiceSaleReturnListPage(),
                                )));
                          });
                    }
                  : null,
              onSavePressed: widget.disableSave
                  ? null
                  : () {
                      InvoiceSellEntity newInvoice = InvoiceSellEntity(
                        invoiceNo: int.parse(invoiceNo),
                        userNumber: invoiceNo,
                        aName: aName.text.isEmpty ? 'فاتورة بيع' : aName.text,
                        eName: eName.text.isEmpty ? 'Sale Invoice' : eName.text,
                        subNetTotal: double.parse(subNetTotal.text),
                        subNetTotalPlusTax:
                            double.parse(subNetTotalPlusTax.text),
                        subTotalDiscount: double.parse(subTotalDiscount.text),
                        buildingNo: buildingNo,
                        amountLeft: double.parse(amountLeft.text),
                        amountPayed: double.parse(amountPayed.text),
                        isPosted: isPosted ? 1 : 0,
                        StoreNo: int.parse(storeNo.text),
                        VATTypeNO: int.parse(vATTypeNO.text),
                        clientVendorNo: clientVendorNo,
                        invoiceVATID: invoiceVATID.text,
                        note: note.text,
                        paperBillNum: paperBillNum.text,
                        telephone: telephone.text,
                        dateG: dateG,
                        amountPayed01: double.parse(cash.text),
                        amountPayed02: double.parse(span.text),
                        amountPayed03: double.parse(visa.text),
                        taxRate1_Total: double.parse(taxRate1_Total.text),
                        amountCalculatedPayed: double.parse(cash.text) +
                            double.parse(span.text) +
                            double.parse(visa.text),
                      );
                      widget.isEdit
                          ? context
                              .read<InvoiceSellCubit>()
                              .updateInvoiceSell(invoiceSellEntity: newInvoice)
                          : context
                              .read<InvoiceSellCubit>()
                              .insertInvoiceSell(newInvoice);

                      for (var item in addedItems) {
                        item.buildingNo = buildingNo;
                        context.read<InvoiceSellCubit>().insertInvoiceSellUnit(
                            item,
                            items.length + addedItems.indexOf(item) + 1,
                            addedItemsValues.firstWhere((element) =>
                                element['itemNo'] == item.itemNo)['quantity']);
                      }

                      for (var item in deletedItems) {
                        context.read<InvoiceSellCubit>().removeItem(item);
                      }

                      for (var item in updatedItems) {
                        context
                            .read<InvoiceSellCubit>()
                            .updateItemQuantity(item, item.quantity.toString());
                      }

                      showOKDialog(
                          context: context,
                          title: AppLocalizations.of(context)!.success,
                          message: '',
                          onOkPressed: () {
                            if (!widget.isAddInvoiceReturn) {
                              AppNavigation.pop();
                              if (!widget.isHomeCalled) {
                                AppNavigation.pushReplacement(
                                    RepositoryProvider(
                                        create: (context) =>
                                            GetIt.I<InvoiceSellRepo>(),
                                        child: BlocProvider<
                                            InvoiceSellCubit>.value(
                                          value: GetIt.I<InvoiceSellCubit>(),
                                          child: const SellInvoiceSSPage(),
                                        )));
                              }
                            }
                          });
                    },
            ),
            body: state is! InvoiceSellDataLoaded
                ? Loader()
                : TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Label(
                                textAlign: TextAlign.left,
                                text:
                                    '${AppLocalizations.of(context)!.invoice} # $invoiceNo',
                                size: 20,
                                weight: FontWeight.w500,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SplitScreenWidget(
                                child1: TextBox(
                                  label: AppLocalizations.of(context)!.date,
                                  initialValue: dateG,
                                  isEnabled: false,
                                  onChanged: (value) {
                                    dateG = value;
                                  },
                                ),
                                child2: TextBox(
                                  label: AppLocalizations.of(context)!
                                      .invoice_total,
                                  isEnabled: false,
                                  controller: subNetTotal,
                                ),
                              ),
                              SplitScreenWidget(
                                alignment: CrossAxisAlignment.start,
                                child1: DropdownSearch(
                                  items: clientVendorNamesList == []
                                      ? []
                                      : clientVendorNamesList,
                                  initialValue: clientVendorNamesList == []
                                      ? null
                                      : clientVendorNamesList[
                                          !clientVendorNumbers
                                                  .contains(clientVendorNo)
                                              ? 0
                                              : clientVendorNumbers
                                                  .indexOf(clientVendorNo)],
                                  label: AppLocalizations.of(context)!.client,
                                  onChanged: (value) {
                                    clientVendorNo = clientVendorNumbers[
                                        clientVendorNamesList.indexOf(value)];
                                  },
                                ),
                                child2: TextBox(
                                  label: AppLocalizations.of(context)!.discount,
                                  isEnabled: false,
                                  controller: subTotalDiscount,
                                ),
                              ),
                              SplitScreenWidget(
                                child1: TextBox(
                                  label:
                                      AppLocalizations.of(context)!.arabic_name,
                                  controller: aName,
                                ),
                                child2: TextBox(
                                  label: AppLocalizations.of(context)!.vat,
                                  isEnabled: false,
                                  controller: taxRate1_Total,
                                ),
                              ),
                              SplitScreenWidget(
                                child1: TextBox(
                                  label:
                                      AppLocalizations.of(context)!.telephone1,
                                  controller: telephone,
                                ),
                                child2: TextBox(
                                  controller: subNetTotalPlusTax,
                                  label: AppLocalizations.of(context)!
                                      .invoice_net_value,
                                  isEnabled: false,
                                ),
                              ),
                              DropDown(
                                items: branchNames == [] ? [] : branchNames,
                                initialValue: branchNames == []
                                    ? null
                                    : branchNames[!buildingNumbers
                                            .contains(buildingNo)
                                        ? 0
                                        : buildingNumbers.indexOf(buildingNo)],
                                label: AppLocalizations.of(context)!.branch,
                                onChanged: (value) {
                                  buildingNo = buildingNumbers[
                                      branchNames.indexOf(value)];
                                },
                              ),
                              const Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: TextBox(
                                      isNumberBox: true,
                                      label: AppLocalizations.of(context)!.cash,
                                      controller: cash,
                                      onChanged: (v) => calculate(),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: TextBox(
                                      isNumberBox: true,
                                      label: AppLocalizations.of(context)!.span,
                                      controller: span,
                                      onChanged: (v) => calculate(),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: TextBox(
                                      isNumberBox: true,
                                      label: AppLocalizations.of(context)!.visa,
                                      controller: visa,
                                      onChanged: (v) => calculate(),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                              TextBox(
                                isNumberBox: true,
                                label:
                                    AppLocalizations.of(context)!.left_ammount,
                                controller: amountLeft,
                                isEnabled: false,
                              ),
                              const Divider(),
                              CustomCard(
                                color: AppColors.primaryColor,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Label(
                                          text: AppLocalizations.of(context)!
                                              .product,
                                          color: AppColors.onPrimary,
                                          size: 18,
                                        ),
                                        CustomIconButton(
                                          icon: Icons.add,
                                          onTap: () {
                                            //TODO: Push add product
                                          },
                                          size: 25,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    TextBox(
                                      // isNumberBox: true,
                                      label: AppLocalizations.of(context)!
                                          .barcode_search,
                                      overAllColor: AppColors.onPrimary,
                                      controller: barCode,
                                      onSubmitted: (value) async {
                                        handleAddItem();
                                      },
                                      textColor: Colors.black,
                                      suffix: IconButton(
                                        icon: const Icon(
                                          Icons.search,
                                          color: AppColors.primaryColor,
                                        ),
                                        onPressed: () async {
                                          handleAddItem();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Label(
                                        text: AppLocalizations.of(context)!
                                            .barcode,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Label(
                                        text:
                                            AppLocalizations.of(context)!.name,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Label(
                                        text: AppLocalizations.of(context)!
                                            .quantity,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Label(
                                        text:
                                            AppLocalizations.of(context)!.price,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              ...items.map((e) => SellItemCard(
                                    data: e,
                                    onQuantityChanged: (value) {
                                      var updatedItem = e;
                                      updatedItem.quantity = num.parse(value);
                                      updatedItems.add(updatedItem);
                                      calculate();
                                    },
                                    onDelete: () {
                                      deletedItems.add(e);
                                      items.removeWhere(
                                          (element) => element == e);
                                      if (updatedItems.indexWhere((element) =>
                                              element.itemNo == e.itemNo) !=
                                          -1) {
                                        updatedItems.removeWhere((element) =>
                                            element.itemNo == e.itemNo);
                                      }
                                      calculate();
                                    },
                                  )),
                              ...addedItems.map((e) {
                                bool isNew = false;
                                if (addedItemsValues.indexWhere((element) =>
                                        element['itemNo'] == e.itemNo) !=
                                    -1) {
                                } else {
                                  isNew = true;
                                  addedItemsValues.add({
                                    'itemNo': e.itemNo,
                                    'quantity': 1,
                                    'onQuantityChange': (value) {
                                      addedItemsValues.firstWhere((element) =>
                                              element['itemNo'] ==
                                              e.itemNo)['quantity'] =
                                          int.parse(value);
                                      calculate();
                                    }
                                  });
                                }

                                return SellItemCard(
                                  onQuantityChanged:
                                      addedItemsValues.firstWhere((element) =>
                                          element['itemNo'] ==
                                          e.itemNo)['onQuantityChange'],
                                  data: e,
                                  quantity: isNew
                                      ? 1
                                      : addedItemsValues[addedItemsValues
                                          .indexWhere((element) =>
                                              element['itemNo'] ==
                                              e.itemNo)]['quantity'],
                                  onDelete: () {
                                    setState(() {
                                      addedItems.removeWhere(
                                          (element) => element == e);
                                      addedItemsValues.removeWhere((element) =>
                                          element['itemNo'] == e.itemNo);
                                      calculate();
                                    });
                                  },
                                );
                              }),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      // Other Data
                      ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        children: [
                          const SizedBox(height: 10),
                          SplitScreenWidget(
                            child1: TextBox(
                              label: AppLocalizations.of(context)!.vat_no,
                              isNumberBox: true,
                              controller: vATNo,
                            ),
                            child2: TextBox(
                              label: AppLocalizations.of(context)!.english_name,
                              controller: eName,
                            ),
                          ),
                          SplitScreenWidget(
                            child1: TextBox(
                              label: AppLocalizations.of(context)!.payed_total,
                              isNumberBox: true,
                              controller: amountPayed,
                            ),
                            child2: TextBox(
                              label:
                                  '${AppLocalizations.of(context)!.original_paper_bill} #',
                              controller: paperBillNum,
                            ),
                          ),
                          SplitScreenWidget(
                            alignment: CrossAxisAlignment.start,
                            child1: DropDown(
                              items: ['Main Branch', 'Second Branch'],
                              onChanged: (value) {},
                              initialValue: 'Main Branch',
                              label: AppLocalizations.of(context)!.store,
                            ),
                            child2: DropdownSearch(
                              items: ['VAT type 1', 'VAT type 2'],
                              initialValue: 'VAT type 1',
                              label: AppLocalizations.of(context)!.vat_type,
                              onChanged: (value) {
                                vATTypeNO.text = value;
                              },
                            ),
                          ),
                          SplitScreenWidget(
                            child1: CustomCheckbox(
                              initialValue: isPosted,
                              isExpanded: true,
                              label: AppLocalizations.of(context)!.posted,
                              onChanged: (value) {
                                isPosted = value;
                              },
                            ),
                            child2: CustomButton(
                              text: AppLocalizations.of(context)!
                                  .apply_vat_effect,
                              onPressed: () {},
                            ),
                          ),
                          TextBox(
                            label: AppLocalizations.of(context)!.note,
                            maxLines: 4,
                            controller: note,
                          )
                        ],
                      ),
                    ],
                  ),
            bottomNavigationBar: BottomTabBar(
              items: [
                AppLocalizations.of(context)!.items,
                AppLocalizations.of(context)!.other_data
              ],
              tabController: tabController,
            ),
          );
        },
      ),
    );
  }
}
