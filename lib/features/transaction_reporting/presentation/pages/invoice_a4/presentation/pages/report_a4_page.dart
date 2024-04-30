import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/presentation/widgets/app_bar.dart';

class A4ReportPage extends StatefulWidget {
  const A4ReportPage({super.key});

  @override
  State<A4ReportPage> createState() => _A4ReportPageState();
}

class _A4ReportPageState extends State<A4ReportPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPath();
  }

  String pdfPath = '';
  getPath() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    var directory = await Directory('${appDocDirectory.path}/einvoice/pdf/')
        .create(recursive: true);
    pdfPath = '${directory.path}pdfFile.pdf';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: AppLocalizations.of(context)!.invoice_A4,
          textColor: AppColors.onPrimary,
          color: AppColors.primaryColor,
        ),
        body: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: OutlinedButton.icon(
                  onPressed: () async {
                    // createA4InvoicePdf(
                    //   items,
                    //   ClientVendorEntity(
                    //     clientVendorNo: 0,
                    //     aName: 'العميل الاول',
                    //     eName: 'A Client Name',
                    //   ),
                    // );
                    setState(() {});
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: AppColors.primaryColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  icon: const Icon(Icons.print_outlined),
                  label: Text(
                    'Export to pdf'.toUpperCase(),
                  ),
                ),
              ),
            ),
            pdfPath == ''
                ? SizedBox()
                : SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                    // width: 200,
                    child: SfPdfViewer.file(
                      File(pdfPath),
                    ),
                  ),
          ],
        ));
  }
}
