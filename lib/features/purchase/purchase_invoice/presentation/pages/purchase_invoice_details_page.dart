import 'package:InvoiceF_ClientVendor/core/navigation/navigation.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/bottom_tab_bar.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/card.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/checkbox.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/custom_button.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/dropdown.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/dropdown_search.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/icon_button.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/label.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/ok_alert.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/split_screen.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/text_box.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/data/repositories/invoice_buy_repo_impl.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/entities/invoice_buy_unit/invoice_buy_unit_entity_model.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/presentation/manager/invoice_buy_cubit.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/presentation/pages/purchase_invoice_list_ss_page.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/presentation/widgets/purchase_item_card.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/data/models/invoice_buy_return_model.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/data/repositories/purchase_return_invoice_repo.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/presentation/manager/purchase_return_invoice_cubit.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/presentation/pages/purchase_return_invoice_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/constants/colors.dart';

class AddBuyInvoicePage extends StatefulWidget {
  final int newIndex;
  final bool isEdit;
  final InvoiceBuyEntity? data;
  final bool isAddPurchaseReturnInvoice;
  final bool isHomeCalled;
  final bool disableSave;
  final String? newIndexReturn;
  const AddBuyInvoicePage({
    super.key,
    required this.newIndex,
    this.isEdit = false,
    this.data,
    this.isAddPurchaseReturnInvoice = false,
    this.isHomeCalled = false,
    this.disableSave = false,
    this.newIndexReturn,
  });

  @override
  State<AddBuyInvoicePage> createState() => _AddBuyInvoicePageState();
}

class _AddBuyInvoicePageState extends State<AddBuyInvoicePage>
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
  bool isPosted = false;
  int buildingNo = 0;

  late TabController tabController;
  List<String> branchNames = [
    'Main Branch - الفرع الرئيسى',
  ];
  List<int> buildingNumbers = [0];
  List<String> clientVendorNamesList = ['ClientVendor'];
  List<int> clientVendorNumbers = [0];
  List<InvoiceBuyUnitEntity> items = [];
  List<InvoiceBuyUnitEntity> addedItems = [];

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
    aName.text = widget.data?.aName ?? 'فاتورة شراء';
    invoiceVATID.text = widget.data?.invoiceVATID ?? '0';
    telephone.text = widget.data?.telephone ?? '';
    subNetTotalPlusTax.text = '${widget.data?.subNetTotalPlusTax ?? '0'}';
    buildingNo = (widget.data?.buildingNo == null
        ? 0
        : widget.data?.buildingNo.round())!;
    amountLeft.text = '${widget.data?.amountLeft ?? '0'}';
    eName.text = widget.data?.eName ?? 'Purchase Invoice';
    amountPayed.text = '0';
    paperBillNum.text = widget.data?.paperBillNum ?? '0';
    storeNo.text = '1';
    vATTypeNO.text = '1';
    taxRate1_Total.text = '${widget.data?.subNetTotalPlusTax ?? '0'}';
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
    setState(() {
      amountLeft.text =
          '${double.parse(cash.text) + double.parse(span.text) + double.parse(visa.text) - double.parse(subNetTotalPlusTax.text)}';
      num tPT = 0;
      for (var element in items) {
        tPT += element.totalPlusTax;
      }
      subNetTotalPlusTax.text = tPT.toString();
      num total = 0;
      for (var element in items) {
        total += element.total;
      }
      subNetTotal.text = total.toString();
      num totalVAT = 0;
      for (var element in items) {
        totalVAT += element.taxRate1_Total;
      }
      taxRate1_Total.text = totalVAT.toString();
    });
  }

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InvoiceBuyCubit>.value(
      value: GetIt.I<InvoiceBuyCubit>(),
      child: BlocBuilder<InvoiceBuyCubit, InvoiceBuyState>(
          builder: (context, state) {
        if (!isLoaded) {
          context
              .read<InvoiceBuyCubit>()
              .getInvoiceData(invoiceNo, widget.isEdit);
          isLoaded = true;
        }
        if (state is InvoiceBuyDataLoaded) {
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
        }
        return Scaffold(
          appBar: CustomAppBar(
            title: widget.isAddPurchaseReturnInvoice
                ? AppLocalizations.of(context)!.purchase_invoice_return
                : widget.disableSave
                    ? AppLocalizations.of(context)!.purchase_invoice_return
                    : AppLocalizations.of(context)!.purchase_invoice,
            color: AppColors.primaryColor,
            textColor: AppColors.onPrimary,
            addBtnColor: AppColors.onPrimary,
            onAddPressed: widget.isAddPurchaseReturnInvoice
                ? () {
                    InvoiceBuyReturn invoiceBuyReturnEntity = InvoiceBuyReturn(
                      Inv_invoiceNo: int.parse(invoiceNo),
                      Inv_buildingNo: buildingNo,
                      invoiceNo: int.parse(widget.newIndexReturn!),
                      userNumber:
                          widget.isEdit ? invoiceNo.toString() : invoiceNo,
                      aName: aName.text.isEmpty ? 'فاتورة بيع' : aName.text,
                      eName: eName.text.isEmpty ? 'Sale Invoice' : eName.text,
                      subNetTotal: double.parse(subNetTotal.text),
                      subNetTotalPlusTax: double.parse(subNetTotalPlusTax.text),
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
                        .read<InvoiceBuyCubit>()
                        .insertPurchaseReturnInvoice(invoiceBuyReturnEntity);
                    showOKDialog(
                        context: context,
                        title: AppLocalizations.of(context)!.success,
                        message: '',
                        onOkPressed: () {
                          AppNavigation.pop();
                          AppNavigation.pop();
                          AppNavigation.pushReplacement(RepositoryProvider(
                              create: (context) =>
                                  GetIt.I<PurchaseReturnInvoiceRepo>(),
                              child: BlocProvider<
                                  PurchaseReturnInvoiceCubit>.value(
                                value: GetIt.I<PurchaseReturnInvoiceCubit>()
                                  ..getAllPurchaseReturnInvoice(),
                                child: const PurchaseReturnInvoiceListPage(),
                              )));
                        });
                  }
                : null,
            onSavePressed: widget.disableSave
                ? null
                : () {
                    InvoiceBuyEntity newInvoice = InvoiceBuyEntity(
                      invoiceNo: int.parse(invoiceNo),
                      userNumber:
                          widget.isEdit ? invoiceNo.toString() : invoiceNo,
                      aName: aName.text.isEmpty ? 'فاتورة شراء' : aName.text,
                      eName:
                          eName.text.isEmpty ? 'Purchase Invoice' : eName.text,
                      subNetTotal: double.parse(subNetTotal.text),
                      subNetTotalPlusTax: double.parse(subNetTotalPlusTax.text),
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
                            .read<InvoiceBuyCubit>()
                            .updateInvoiceBuy(invoiceBuyEntity: newInvoice)
                        : context
                            .read<InvoiceBuyCubit>()
                            .insertInvoiceBuy(newInvoice);
                    showOKDialog(
                        context: context,
                        title: AppLocalizations.of(context)!.success,
                        message: '',
                        onOkPressed: () {
                          if (!widget.isAddPurchaseReturnInvoice) {
                            AppNavigation.pop();
                            if (!widget.isHomeCalled) {
                              AppNavigation.pushReplacement(RepositoryProvider(
                                  create: (context) =>
                                      GetIt.I<InvoiceBuyRepo>(),
                                  child: BlocProvider<InvoiceBuyCubit>.value(
                                    value: GetIt.I<InvoiceBuyCubit>(),
                                    child: const BuyInvoiceSSPage(),
                                  )));
                            }
                          }
                        });
                  },
          ),
          body: state is! InvoiceBuyDataLoaded
              ? Loader()
              : TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    // Items
                    ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                            label: AppLocalizations.of(context)!.invoice_total,
                            isEnabled: false,
                            controller: subNetTotal,
                          ),
                        ),
                        SplitScreenWidget(
                          alignment: CrossAxisAlignment.start,
                          child1: DropDown(
                            items: clientVendorNamesList == []
                                ? []
                                : clientVendorNamesList,
                            initialValue: clientVendorNamesList == []
                                ? null
                                : clientVendorNamesList[!clientVendorNumbers
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
                            label: AppLocalizations.of(context)!.arabic_name,
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
                            label: AppLocalizations.of(context)!.telephone1,
                            controller: telephone,
                          ),
                          child2: TextBox(
                            controller: subNetTotalPlusTax,
                            label:
                                AppLocalizations.of(context)!.invoice_net_value,
                            isEnabled: false,
                          ),
                        ),
                        DropDown(
                          items: branchNames == [] ? [] : branchNames,
                          initialValue: branchNames == []
                              ? null
                              : branchNames[
                                  !buildingNumbers.contains(buildingNo)
                                      ? 0
                                      : buildingNumbers.indexOf(buildingNo)],
                          label: AppLocalizations.of(context)!.branch,
                          onChanged: (value) {
                            buildingNo =
                                buildingNumbers[branchNames.indexOf(value)];
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
                          label: AppLocalizations.of(context)!.left_ammount,
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
                                    text: AppLocalizations.of(context)!.product,
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
                                isNumberBox: true,
                                label: AppLocalizations.of(context)!
                                    .barcode_search,
                                overAllColor: AppColors.onPrimary,
                                controller: barCode,
                                onSubmitted: (value) async {
                                  InvoiceBuyUnitEntity newItem = await context
                                      .read<InvoiceBuyCubit>()
                                      .searchItem(barCode.text, invoiceNo);
                                  addedItems.insert(0, newItem);
                                  setState(() {});
                                },
                                textColor: Colors.black,
                                suffix: IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    color: AppColors.primaryColor,
                                  ),
                                  onPressed: () async {
                                    InvoiceBuyUnitEntity newItem = await context
                                        .read<InvoiceBuyCubit>()
                                        .searchItem(barCode.text, invoiceNo);
                                    addedItems.insert(0, newItem);
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Label(
                                  text: AppLocalizations.of(context)!.barcode,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Label(
                                  text: AppLocalizations.of(context)!.name,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Label(
                                  text: AppLocalizations.of(context)!.quantity,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Label(
                                  text: AppLocalizations.of(context)!.price,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...addedItems.map((e) => BuyItemCard(
                              data: e,
                              onDelete: () {
                                setState(() {
                                  addedItems
                                      .removeWhere((element) => element == e);
                                });
                              },
                            )),
                        ...items.map((e) => BuyItemCard(
                              data: e,
                              onDelete: () {
                                setState(() {
                                  items.removeWhere((element) => element == e);
                                });
                              },
                            )),
                        const SizedBox(height: 20),
                      ],
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
                            text:
                                AppLocalizations.of(context)!.apply_vat_effect,
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
      }),
    );
  }
}
