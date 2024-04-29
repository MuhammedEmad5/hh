import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/data/datasources/remote_data_source/remote_connection.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/presentation/widgets/app_bar.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/dropdown.dart';
import '../../../../core/presentation/widgets/text_box.dart';
import 'a4_report_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'create_a4_invoice_pdf.dart';

class InvoiceA4Page extends StatefulWidget {
  const InvoiceA4Page({super.key});

  @override
  State<InvoiceA4Page> createState() => _InvoiceA4PageState();
}

class _InvoiceA4PageState extends State<InvoiceA4Page> {
  int type = 0;
  List<String> invoiceTypes = [
    AppLocalizations.of(AppNavigation.context)!.pos_sell_invoice,
    AppLocalizations.of(AppNavigation.context)!.purchase_invoice,
    AppLocalizations.of(AppNavigation.context)!.sell_invoice_return,
    AppLocalizations.of(AppNavigation.context)!.purchase_invoice_return,
  ];
  TextEditingController invoiceNoC = TextEditingController();
  late InvoiceSell invoiceData;
  late ClientVendorEntity clientVendorData;
  late ClientVendorEntity companyData;
  List<InvoiceSellUnitEntity> invoiceSellUnits = [];
  getInvoiceData() async {
    var response = await RemoteConnection().readQuery(
        'SELECT * FROM invoicesell WHERE invoiceNo = ${invoiceNoC.text}');
    try {
      invoiceData = InvoiceSell.fromJson(response[0]);
    } catch (e) {
      print(e);
      invoiceData = InvoiceSell();
    }
  }

  getClientVendorData() async {
    var response = await RemoteConnection().readQuery(
        'SELECT * FROM clientvendor WHERE clientVendorNo = ${invoiceData.clientVendorNo}');
    try {
      clientVendorData = ClientVendorEntity.fromJson(response[0]);
    } catch (e) {
      print(e);
      clientVendorData = ClientVendorEntity(clientVendorNo: 0);
    }
  }

  getItems() async {
    List response = await RemoteConnection().readQuery(
        'SELECT * FROM invoicesellunit WHERE invoiceNo = ${invoiceData.invoiceNo}');
    try {
      invoiceSellUnits = [];
      for (var element in response) {
        invoiceSellUnits.add(InvoiceSellUnitEntity.fromJson(element));
        print(InvoiceSellUnitEntity.fromJson(element));
      }
    } catch (e) {
      print(e);
      invoiceSellUnits = [];
      invoiceSellUnits.add(
        InvoiceSellUnitEntity(
          invoiceNo: 0,
          aName: '',
          eName: '',
        ),
      );
    }
  }

  getCompanyData() async {
    var response = await RemoteConnection().readQuery('SELECT * FROM company');
    try {
      response[0]['clientVendorNo'] = 0;
      response[0]['VATID'] = response[0]['businessRegistrationNo'];
      companyData = ClientVendorEntity.fromJson(response[0]);
    } catch (e) {
      print(e);
      companyData = ClientVendorEntity(clientVendorNo: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.invoice_A4,
        textColor: AppColors.onPrimary,
        color: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropDown(
              items: invoiceTypes,
              onChanged: (value) {
                type = invoiceTypes.indexOf(value);
              },
              initialValue: AppLocalizations.of(context)!.pos_sell_invoice,
            ),
            const SizedBox(
              height: 20,
            ),
            DropDown(
              items: [
                'Main Branch - الفرع الرئيسى',
              ],
              initialValue: 'Main Branch - الفرع الرئيسى',
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            TextBox(
              hint: AppLocalizations.of(context)!.invoiceNo,
              controller: invoiceNoC,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  text: AppLocalizations.of(context)!.cancel,
                  onPressed: () {
                    AppNavigation.pop();
                  },
                  isExpanded: false,
                ),
                CustomButton(
                  text: AppLocalizations.of(context)!.view,
                  onPressed: () async {
                    await getInvoiceData();
                    await getClientVendorData();
                    await getItems();
                    await getCompanyData();
                    await createA4InvoicePdf(type, invoiceSellUnits,
                        clientVendorData, invoiceData, companyData);
                    AppNavigation.push(const A4ReportPage());
                  },
                  isExpanded: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
