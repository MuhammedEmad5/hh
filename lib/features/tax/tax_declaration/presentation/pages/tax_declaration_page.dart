// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';
import 'package:InvoiceF/core/constants/colors.dart';
import 'package:InvoiceF/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF/core/presentation/widgets/custom_button.dart';
import 'package:InvoiceF/core/presentation/widgets/custom_error_widget.dart';
import 'package:InvoiceF/core/presentation/widgets/data_grid/data_grid_paginated/data_grid_paginated.dart';
import 'package:InvoiceF/core/presentation/widgets/date_picker.dart';
import 'package:InvoiceF/core/presentation/widgets/dropdown.dart';
import 'package:InvoiceF/core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import 'package:InvoiceF/core/presentation/widgets/icon_button.dart';
import 'package:InvoiceF/core/presentation/widgets/label.dart';
import 'package:InvoiceF/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF/core/presentation/widgets/text_icon_button.dart';
import 'package:InvoiceF/core/presentation/widgets/toast_notification.dart';
import 'package:InvoiceF/core/utils/logger.dart';
import 'package:InvoiceF/features/tax/tax_declaration/presentation/manager/tax_declaration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;
import 'package:syncfusion_flutter_pdf/pdf.dart';

class TaxDeclarationPage extends StatefulWidget {
  const TaxDeclarationPage({super.key});

  @override
  State<TaxDeclarationPage> createState() => _TaxDeclarationPageState();
}

class _TaxDeclarationPageState extends State<TaxDeclarationPage> {
  List<String> branchNames = ['Main Branch - الفرع الرئيسى'];
  List<int> buildingNumbers = [0];
  int buildingNo = -1;
  String dateTo = '';
  String dateFrom = '';
  bool isLoading = true;
  final GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();
  void getBranches() async {
    var res = await context.read<TaxDeclarationCubit>().getBranches();
    setState(() {
      branchNames = [AppLocalizations.of(context)!.selectOption, ...res[0]];
      buildingNumbers = [-1, ...res[1]];
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    dateFrom = DateTime.now()
        .subtract(const Duration(days: 7))
        .toString()
        .substring(0, 10);
    dateTo = DateTime.now().toString().substring(0, 10);

    getBranches();
  }

  void exportDataGridToExcel() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    var appPath = Directory('${documentsDirectory.path}\\einvoice');
    appPath.create();
    var excelPath = Directory('${documentsDirectory.path}\\einvoice\\excel');
    excelPath.create();
    final excel.Workbook workbook = _key.currentState!.exportToExcelWorkbook();
    try {
      final List<int> bytes = workbook.saveAsStream();
      File('${excelPath.path}\\DataGrid.xlsx').writeAsBytes(bytes);
      workbook.dispose();
      showToast(
          context: context,
          message:
              '${AppLocalizations.of(context)!.success}: ${excelPath.path}\\DataGrid.xlsx');
    } catch (e) {
      showToast(context: context, message: e.toString());
    }
    OpenFile.open('${excelPath.path}\\DataGrid.xlsx');
  }

  void exportDataGridToPdf() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    var appPath = Directory('${documentsDirectory.path}\\einvoice');
    appPath.create();
    var pdfPath = Directory('${documentsDirectory.path}\\einvoice\\pdf');
    pdfPath.create();
    late Uint8List fontData;
    if (Platform.isWindows) {
      fontData = File('assets/fonts/arial.ttf').readAsBytesSync();
    } else {
      ByteData data = await rootBundle.load('assets/fonts/arial.ttf');
      fontData = data.buffer.asUint8List();
    }
    final PdfFont font = PdfTrueTypeFont(fontData, 8);
    PdfDocument document = PdfDocument();
    PdfPage pdfPage = document.pages.add();
    PdfGrid pdfGrid = _key.currentState!.exportToPdfGrid();
    pdfGrid.style = PdfGridStyle(
      font: font,
    );
    pdfGrid.columns[1].format = PdfStringFormat(
      textDirection: PdfTextDirection.rightToLeft,
      // alignment: PdfTextAlignment.center,
    );
    pdfGrid.draw(
      page: pdfPage,
      // format: ,
      bounds: const Rect.fromLTWH(0, 0, 0, 0),
    );
    try {
      final List<int> bytes = document.saveSync();
      File('${pdfPath.path}\\DataGrid.pdf').writeAsBytes(bytes);
      document.dispose();
      showToast(
          context: context,
          message:
              '${AppLocalizations.of(context)!.success}: ${pdfPath.path}\\DataGrid.pdf');
    } catch (e) {
      showToast(context: context, message: e.toString());
    }
    OpenFile.open('${pdfPath.path}\\DataGrid.pdf');
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<TaxDeclarationCubit>().isClosed) {
      LoggerSingleton.logger.i('The Bloc is closed.');
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.vat_reports_tax_declaration,
      ),
      body: BlocBuilder<TaxDeclarationCubit, TaxDeclarationState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return isLoading
                  ? Loader()
                  : ListView(
                      padding: const EdgeInsets.all(10),
                      children: [
                        DatePicker(
                          label: AppLocalizations.of(context)!.date_from,
                          labelColor: AppColors.primaryColor,
                          onChanged: (value) {
                            dateFrom = value;
                          },
                          initialValue: dateFrom,
                        ),
                        DatePicker(
                          label: AppLocalizations.of(context)!.date_to,
                          labelColor: AppColors.primaryColor,
                          onChanged: (value) {
                            dateTo = value;
                          },
                          initialValue: dateTo,
                        ),
                        DropDown(
                          labelColor: AppColors.primaryColor,
                          label: AppLocalizations.of(context)!.branch,
                          items: branchNames,
                          initialValue: branchNames[0],
                          onChanged: (value) {
                            buildingNo =
                                buildingNumbers[branchNames.indexOf(value)];
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: AppLocalizations.of(context)!.show,
                          onPressed: () async {
                            await context
                                .read<TaxDeclarationCubit>()
                                .getData(dateTo, dateFrom, '$buildingNo');
                          },
                        ),
                      ],
                    );
            },
            loading: () {
              return Center(child: Loader());
            },
            success: (data) {
              return ListView(
                children: [
                  Container(
                    color: AppColors.primaryColor,
                    height: 55,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: Platform.isLinux ||
                                Platform.isMacOS ||
                                Platform.isWindows
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.spaceAround,
                        children: [
                          TextIconButton(
                            title: AppLocalizations.of(context)!.export_as_pdf,
                            onTap: () {
                              exportDataGridToPdf();
                            },
                            icon: Icons.picture_as_pdf,
                            iconColor: AppColors.onPrimary,
                            textColor: AppColors.onPrimary,
                            iconSize: 20,
                            fontSize: 14,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextIconButton(
                            title:
                                AppLocalizations.of(context)!.export_as_excel,
                            onTap: () {
                              exportDataGridToExcel();
                            },
                            icon: Icons.table_view,
                            iconColor: AppColors.onPrimary,
                            textColor: AppColors.onPrimary,
                            iconSize: 20,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataGridPaginated(
                    noBorder: true,
                    gridKey: _key,
                    data: data,
                    allowSorting: true,
                  ),
                ],
              );
            },
            empty: () {
              return CustomEmptyWidget(
                text: AppLocalizations.of(context)!.no_data_found,
              );
            },
            error: (e) {
              return CustomErrorWidget(errorMessage: e);
            },
          );
        },
      ),
    );
  }
}
