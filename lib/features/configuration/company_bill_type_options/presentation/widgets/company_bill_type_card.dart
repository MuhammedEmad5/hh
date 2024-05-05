import 'package:InvoiceF_Configuration/core/presentation/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/constants/colors.dart';
import 'package:InvoiceF_Configuration/core/presentation/widgets/text_box.dart';

class CompanyBillTypeCard<T> extends StatefulWidget {
  final TextEditingController reference;
  final DropDownController<T> printingTypeC;
  final List<String> defaultReportList;
  final List<String> printingTypeOnPostList;
  final List<String> vatTypeList;
  final List<String> vatGroupList;
  final DropDownController defaultReportC;
  final DropDownController vatTypeC;
  final DropDownController vatGroupC;
  final TextEditingController reportUHAC;
  final TextEditingController reportUHEC;
  final TextEditingController reportUDSC;
  const CompanyBillTypeCard({
    super.key,
    required this.reference,
    required this.printingTypeC,
    required this.printingTypeOnPostList,
    required this.defaultReportList,
    required this.vatGroupList,
    required this.vatTypeList,
    required this.defaultReportC,
    required this.vatTypeC,
    required this.vatGroupC,
    required this.reportUHAC,
    required this.reportUHEC,
    required this.reportUDSC,
  });

  @override
  State<CompanyBillTypeCard> createState() => _CompanyBillTypeCardState();
}

class _CompanyBillTypeCardState extends State<CompanyBillTypeCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // CustomDropdownController dropDownC = CustomDropdownController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextBox(
          label: AppLocalizations.of(context)!.invoice_type,
          labelColor: AppColors.primaryColor,
          isEnabled: false,
          controller: widget.reference,
        ),
        DropDown(
          items: widget.printingTypeOnPostList,
          label: AppLocalizations.of(context)!.printing_type_on_post,
          controller: widget.printingTypeC,
          labelColor: AppColors.primaryColor,
        ),
        DropDown(
          items: widget.defaultReportList,
          label: AppLocalizations.of(context)!.default_report,
          controller: widget.defaultReportC,
          labelColor: AppColors.primaryColor,
        ),
        DropDown(
          items: widget.vatTypeList,
          label: AppLocalizations.of(context)!.vat_type,
          controller: widget.vatTypeC,
          labelColor: AppColors.primaryColor,
        ),
        DropDown(
          items: widget.vatGroupList,
          label: AppLocalizations.of(context)!.vat_group,
          controller: widget.vatGroupC,
          labelColor: AppColors.primaryColor,
        ),
        TextBox(
          label: AppLocalizations.of(context)!.report_under_header_arabic_text,
          labelColor: AppColors.primaryColor,
          controller: widget.reportUHAC,
          maxLines: 5,
        ),
        TextBox(
          label: AppLocalizations.of(context)!.report_under_header_english_text,
          labelColor: AppColors.primaryColor,
          controller: widget.reportUHEC,
          maxLines: 5,
        ),
        TextBox(
          label: AppLocalizations.of(context)!.report_under_data_statement,
          labelColor: AppColors.primaryColor,
          controller: widget.reportUDSC,
          maxLines: 5,
        ),
      ],
    );
  }
}
