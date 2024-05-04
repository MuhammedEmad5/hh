import 'package:InvoiceF_ClientVendor/features/product/products_list/presentation/pages/product_ss_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/navigation/navigation.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/checkbox.dart';
import '../../../../../core/presentation/widgets/dropdown.dart';
import '../../../../../core/presentation/widgets/label.dart';
import '../../../../../core/presentation/widgets/ok_alert.dart';
import '../../../../../core/presentation/widgets/text_box.dart';
import '../../data/repositories/product_repo_impl.dart';
import '../../domain/entities/item_entity_model.dart';
import '../manager/product_cubit.dart';

class ProductDetailsPage extends StatefulWidget {
  final int newIndex;
  final ItemEntity? data;
  final bool isEdit;
  const ProductDetailsPage(
      {super.key, this.data, required this.newIndex, this.isEdit = false});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  TextEditingController aName = TextEditingController();
  TextEditingController eName = TextEditingController();
  TextEditingController barcode = TextEditingController();
  int unitNo_defaultSell = 1;
  int itemClassificationTreeNo = 1;
  TextEditingController taxPurchasePercent = TextEditingController();
  bool tax_isUseSeparateFieldsForTax = true;
  TextEditingController buyPrice = TextEditingController();
  TextEditingController taxPurchaseAmount = TextEditingController();
  int taxPercent = 0;
  TextEditingController sellPrice = TextEditingController();
  TextEditingController sellPrice2 = TextEditingController();
  TextEditingController sellPrice3 = TextEditingController();
  TextEditingController sellPrice4 = TextEditingController();

  TextEditingController sellPriceTax = TextEditingController();
  TextEditingController sellPrice2Tax = TextEditingController();
  TextEditingController sellPrice3Tax = TextEditingController();
  TextEditingController sellPrice4Tax = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController discount_Percentage = TextEditingController();

  List<String> sellVatPercent = [
    '0',
    '5',
    '15',
  ];

  List<String> saleUnits = [
    '1/2 sq. in',
    '1/2 pt',
    '1/2 in',
    '1/2 lb',
    '1/4 sq. in',
    '1/4 in',
    '1/4 lb',
    '1/8 in',
    '1/8 sq. in',
    '10 Cartons',
    'oz',
    'Red',
    'Bar',
    'Whole bale',
    'Card',
    'cried',
    'Pelt',
    'Bloc',
    'in',
    'sq. in',
    'Puffeih',
    'Sell',
    'Change',
    'Tank',
    'Gallon',
    'Pan',
    'g',
    'Jarcle',
    'Lump',
    'Safe',
    'Piece',
    '2 Pcs',
    'Bundle',
    'Service',
    'Locker',
    '12 Pcs',
    'Sacrifice',
    'Tie',
    'Quarter',
    'Quarter dozen',
    'Quarter sacrifice',
    '1/4 kilo',
    'lb',
    'Roll',
    'Hour',
    'Bucket',
    'Basket',
    'cm',
    'cm2',
    'cm3',
    'Tie',
    'Full Tie',
    'Big Tie',
    'Slice',
    'Bag',
    'Month',
    'Saj',
    'Plate',
    'Small S',
    'Plate',
    'Box',
    'Pressure',
    'Big plate',
    'Double plate',
    'Tablia',
    'Set',
    'Ton',
    'Envelope',
    'C 18',
    'C 21',
    'C 24',
    'C 925',
    'Normal N',
    'Can',
    'Package',
    'Offer',
    'Box',
    'Bottle',
    'Room',
    'Steam Wash',
    'Clean & Press',
    'Brush',
    'Cork',
    'Towel',
    'Flask',
    'Mold',
    'ft',
    'sq. ft',
    'Piece',
    'Cown',
    'Cup',
    'Full',
    'Big',
    'Card',
    'Box',
    'Small Box',
    'Full Box',
    'Big Box',
    'Cherry',
    'km',
    'Quantity',
    'Glass',
    'Press Only',
    'Bag',
    'Small bag',
    'Full bag',
    'Large bag',
    'kg',
    'Nothing',
    'Roll',
    'Liter',
    'm',
    'm2',
    'm3',
    'Envelope',
    'Cube',
    'ml',
    'mg',
    'mm',
    'mm2',
    'mm3',
    'mile',
    '6 Pcs',
    'Carcass half',
    'Half',
    'Medium',
    'Half a packet',
    'Half a dozen',
    'Half sheep',
    'Half Tie',
    'Half Carton',
    '1/2 Kilo',
    'Half a kilo',
    'Weight',
    'Half',
    'yd',
    'Day',
  ];

  String itemNo = '0';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    itemNo = '${widget.newIndex == -1 ? 1 : widget.newIndex}';
    itemNo = itemNo == '0' ? '1' : itemNo;
    aName.text = widget.data?.aName ?? 'منتج جديد';
    eName.text = widget.data?.eName ?? 'New Product';
    barcode.text = widget.data?.barCode ?? itemNo;
    unitNo_defaultSell = widget.data?.unitNo_defaultSell ?? 1;
    itemClassificationTreeNo =
        widget.data?.itemClassificationTreeNo.round() ?? 1;
    taxPurchasePercent.text = '${widget.data?.taxPurchasePercent ?? 0}';
    taxPurchaseAmount.text = '${widget.data?.taxPurchaseAmount ?? 0}';
    tax_isUseSeparateFieldsForTax =
        widget.data?.tax_isUseSeparateFieldsForTax == 1 ? true : false;
    buyPrice.text = '${widget.data?.buyPrice ?? 0}';
    taxPercent = widget.data?.taxPercent.round() ?? 2;
    sellPrice.text = '${widget.data?.sellPrice ?? 0}';
    sellPrice2.text = '${widget.data?.sellPrice2 ?? 0}';
    sellPrice3.text = '${widget.data?.sellPrice3 ?? 0}';
    sellPrice4.text = '${widget.data?.sellPrice4 ?? 0}';
    discount.text = '${widget.data?.discount ?? 0}';
    discount_Percentage.text = '${widget.data?.discount_Percentage ?? 0}';
    calculateTax();
  }

  calculateTax() {
    setState(() {
      sellPriceTax.text =
          '${num.parse(sellPrice.text) + num.parse(sellPrice.text) * num.parse(sellVatPercent[taxPercent]) / 100}';
      sellPrice2Tax.text =
          '${num.parse(sellPrice2.text) + num.parse(sellPrice2.text) * num.parse(sellVatPercent[taxPercent]) / 100}';
      sellPrice3Tax.text =
          '${num.parse(sellPrice3.text) + num.parse(sellPrice3.text) * num.parse(sellVatPercent[taxPercent]) / 100}';
      sellPrice4Tax.text =
          '${num.parse(sellPrice4.text) + num.parse(sellPrice4.text) * num.parse(sellVatPercent[taxPercent]) / 100}';
      taxPurchaseAmount.text =
          '${num.parse(taxPurchasePercent.text) * num.parse(buyPrice.text) / 100}';
      discount.text =
          '${num.parse(discount_Percentage.text) * num.parse(sellPrice.text) / 100}';
    });
  }

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return BlocProvider<ProductCubit>.value(
      value: GetIt.I<ProductCubit>(),
      child: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
        if (widget.newIndex == -1) {
          if (!isLoaded) {
            context.read<ProductCubit>().getLastIndex();
            isLoaded = true;
          }
          if (state is ProductIndexLoaded) {
            itemNo = state.data;
            barcode.text = state.data;
          }
        }
        return Scaffold(
          appBar: CustomAppBar(
            title: appLocalizations.product_details,
            color: AppColors.primaryColor,
            textColor: AppColors.onPrimary,
            onSavePressed: () {
              ItemEntity item = ItemEntity(
                itemNo: int.parse(itemNo),
                barCode: barcode.text == '' || barcode.text == '-1'
                    ? itemNo
                    : barcode.text,
                userNumber: itemNo,
                aName: aName.text,
                eName: eName.text,
                unitNo_defaultSell: unitNo_defaultSell,
                itemClassificationTreeNo: itemClassificationTreeNo,
                taxPurchasePercent: double.parse(taxPurchasePercent.text),
                taxPurchaseAmount: double.parse(taxPurchaseAmount.text),
                tax_isUseSeparateFieldsForTax:
                    tax_isUseSeparateFieldsForTax ? 1 : 0,
                buyPrice: double.parse(buyPrice.text),
                taxPercent: taxPercent,
                sellPrice: double.parse(sellPrice.text),
                sellPrice2: double.parse(sellPrice2.text),
                sellPrice3: double.parse(sellPrice3.text),
                sellPrice4: double.parse(sellPrice4.text),
                discount: double.parse(discount.text),
                discount_Percentage: double.parse(discount_Percentage.text),
              );

              widget.isEdit
                  ? context.read<ProductCubit>().updateProduct(product: item)
                  : context.read<ProductCubit>().insertProduct(item);
              showOKDialog(
                  context: context,
                  title: AppLocalizations.of(context)!.success,
                  message: '',
                  onOkPressed: () {
                    AppNavigation.pop();
                    AppNavigation.pushReplacement(RepositoryProvider(
                      create: (context) => GetIt.I<ProductRepo>(),
                      child: BlocProvider<ProductCubit>.value(
                        value: GetIt.I<ProductCubit>()..getAllProducts(),
                        child: const ProductSSPage(),
                      ),
                    ));
                  });
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBox(
                    label: '${AppLocalizations.of(context)?.product}#',
                    initialValue: itemNo,
                    isEnabled: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBox(
                    label: appLocalizations.arabic_name,
                    controller: aName,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBox(
                    label: appLocalizations.english_name,
                    controller: eName,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          label: appLocalizations.barcode,
                          controller: barcode,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Label(
                          text: AppLocalizations.of(context)!.sale_unit,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: DropDown(
                          items: saleUnits,
                          initialValue: saleUnits[unitNo_defaultSell],
                          onChanged: (value) {
                            unitNo_defaultSell = saleUnits.indexOf(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Label(
                          text: appLocalizations.classification,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: DropDown(
                          items: [
                            appLocalizations.no_data,
                          ],
                          // initialValue: itemClassificationTreeNo,
                          onChanged: (value) {
                            // itemClassificationTreeNo = classifications.indexOf(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Label(
                          text:
                              '${AppLocalizations.of(context)?.tax_purchase}%',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          controller: taxPurchasePercent,
                          onChanged: (value) {
                            calculateTax();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCheckbox(
                    label: appLocalizations.use_purchase_tax,
                    initialValue: tax_isUseSeparateFieldsForTax,
                    onChanged: (v) {
                      tax_isUseSeparateFieldsForTax = v;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Label(
                          text: appLocalizations.purchase_price,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          controller: buyPrice,
                          onChanged: (value) {
                            calculateTax();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child:
                            Label(text: appLocalizations.tax_purchase_ammount),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          controller: taxPurchaseAmount,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Label(
                          text: '${AppLocalizations.of(context)?.tax_sell} %',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: DropDown(
                          items: sellVatPercent,
                          initialValue: sellVatPercent[taxPercent],
                          onChanged: (value) {
                            taxPercent = sellVatPercent.indexOf(value);
                            calculateTax();
                          },
                        ),
                      ),
                      const Expanded(
                        child: SizedBox.shrink(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Label(
                          text: '${AppLocalizations.of(context)!.sell_price} 1',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          controller: sellPrice,
                          onChanged: (value) {
                            calculateTax();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.compare_arrows,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          controller: sellPriceTax,
                          isEnabled: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Label(
                          text: '${AppLocalizations.of(context)!.sell_price} 2',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          controller: sellPrice2,
                          onChanged: (value) {
                            calculateTax();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.compare_arrows,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          isEnabled: false,
                          controller: sellPrice2Tax,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Label(
                          text: '${AppLocalizations.of(context)!.sell_price} 3',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          controller: sellPrice3,
                          onChanged: (value) {
                            calculateTax();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.compare_arrows,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          isEnabled: false,
                          controller: sellPrice3Tax,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Label(
                          text: '${AppLocalizations.of(context)!.sell_price} 4',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          controller: sellPrice4,
                          onChanged: (value) {
                            calculateTax();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.compare_arrows,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          isEnabled: false,
                          controller: sellPrice4Tax,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          isEnabled: false,
                          label: appLocalizations.discount,
                          controller: discount,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextBox(
                          isNumberBox: true,
                          label: '${AppLocalizations.of(context)?.discount} %',
                          controller: discount_Percentage,
                          onChanged: (value) {
                            calculateTax();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
