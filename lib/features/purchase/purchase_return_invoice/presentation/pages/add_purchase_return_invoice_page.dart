import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/blocs/connection_type_bloc/connection_bloc.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/data/datasources/connection.dart';
import '../../../../../core/data/datasources/local_data_source/sqlLite/local_connection.dart';
import '../../../../../core/data/datasources/remote_data_source/remote_connection.dart';
import '../../../../../core/enums/connection_enum.dart';
import '../../../../../core/navigation/navigation.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/custom_button.dart';
import '../../../../../core/presentation/widgets/dropdown.dart';
import '../../../purchase_invoice/domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/text_box.dart';

import '../../../purchase_invoice/presentation/pages/purchase_invoice_details_page.dart';
class AddPurchaseReturnInvoicePage extends StatefulWidget {
  const AddPurchaseReturnInvoicePage({super.key});

  @override
  State<AddPurchaseReturnInvoicePage> createState() =>
      _AddPurchaseReturnInvoicePageState();
}

class _AddPurchaseReturnInvoicePageState
    extends State<AddPurchaseReturnInvoicePage> {
  TextEditingController invoiceNo = TextEditingController();

  late IConnection connection;
  late InvoiceBuyEntity invoiceData;
  getInvoiceData() async {
    var response = await connection.readQuery(
        'SELECT * FROM invoicesell WHERE invoiceNo = ${invoiceNo.text}');
    setState(() {
      invoiceData = InvoiceBuyEntity.fromJson(response[0]);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    connection = context.read<ConnectionTypeBloc>().state.connection ==
            ConnectionEnum.local
        ? LocalConnection()
        : RemoteConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:
            '${AppLocalizations.of(context)!.add} ${AppLocalizations.of(context)!.purchase_invoice_return}',
        textColor: AppColors.onPrimary,
        color: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropDown(
              items: const [
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
              isNumberBox: true,
              controller: invoiceNo,
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
                    InvoiceSellService().initDi();
                    AppNavigation.push(
                      AddBuyInvoicePage(
                        newIndex: invoiceData.invoiceNo,
                        data: invoiceData,
                        isEdit: true,
                        isAddPurchaseReturnInvoice: true,
                      ),
                    );
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
