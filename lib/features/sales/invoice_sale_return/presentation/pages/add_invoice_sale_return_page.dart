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
import '../../../pos_sell_invoice/di/invoice_sell_service.dart';
import '../../../pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/text_box.dart';

import '../../../pos_sell_invoice/presentation/pages/sell_invoice_details_page.dart';

class AddInvoiceSaleReturnPage extends StatefulWidget {
  const AddInvoiceSaleReturnPage({super.key});

  @override
  State<AddInvoiceSaleReturnPage> createState() =>
      _AddInvoiceSaleReturnPageState();
}

class _AddInvoiceSaleReturnPageState extends State<AddInvoiceSaleReturnPage> {
  TextEditingController invoiceNo = TextEditingController();

  late IConnection connection;
  late InvoiceSellEntity invoiceData;
  getInvoiceData() async {
    var response = await connection.readQuery(
        'SELECT * FROM invoicesell WHERE invoiceNo = ${invoiceNo.text}');
    setState(() {
      invoiceData = InvoiceSellEntity.fromJson(response[0]);
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
            '${AppLocalizations.of(context)!.add} ${AppLocalizations.of(context)!.sell_invoice_return}',
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
                      SellInvoiceDetailsPage(
                        newIndex: invoiceData.invoiceNo,
                        data: invoiceData,
                        isEdit: true,
                        isAddInvoiceReturn: true,
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
