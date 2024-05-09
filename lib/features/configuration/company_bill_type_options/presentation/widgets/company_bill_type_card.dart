import 'package:InvoiceF/core/presentation/widgets/dropdown.dart';
import 'package:InvoiceF/core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import 'package:InvoiceF/core/presentation/widgets/dropdown_with_controller/custom_dropdown_with_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/constants/colors.dart';
import 'package:InvoiceF/core/presentation/widgets/text_box.dart';

class CompanyBillTypeCard<T> extends StatefulWidget {
  final TextEditingController reference;
  final CustomDropdownController<T> printingTypeC;
  final List<DropdownMenuItem> defaultReportList;
  final List<DropdownMenuItem> printingTypeOnPostList;
  final List<DropdownMenuItem> vatTypeList;
  final List<DropdownMenuItem> vatGroupList;
  final CustomDropdownController defaultReportC;
  final CustomDropdownController vatTypeC;
  final CustomDropdownController vatGroupC;
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
        // CustomDropdownWithController(
        //   items: widget.printingTypeOnPostList,
        //   label: AppLocalizations.of(context)!.printing_type_on_post,
        //   controller: widget.printingTypeC,
        //   labelColor: AppColors.primaryColor,
        // ),
        CustomDropdownWithController(
          controller: widget.printingTypeC,
          items: widget.printingTypeOnPostList,
          title: AppLocalizations.of(context)!.printing_type_on_post,
          titleColor: AppColors.primaryColor,
          onChanged: (v) {},
        ),
        CustomDropdownWithController(
          items: widget.defaultReportList,
          title: AppLocalizations.of(context)!.default_report,
          controller: widget.defaultReportC,
          titleColor: AppColors.primaryColor,
          onChanged: (v) {},
        ),
        CustomDropdownWithController(
          items: widget.vatTypeList,
          title: AppLocalizations.of(context)!.vat_type,
          controller: widget.vatTypeC,
          titleColor: AppColors.primaryColor,
          onChanged: (v) {},
        ),
        CustomDropdownWithController(
          items: widget.vatGroupList,
          title: AppLocalizations.of(context)!.vat_group,
          controller: widget.vatGroupC,
          titleColor: AppColors.primaryColor,
          onChanged: (v) {},
        ),
        SizedBox(height: 10),
        TextBox(
          label: AppLocalizations.of(context)!.report_under_header_arabic_text,
          labelColor: AppColors.primaryColor,
          controller: widget.reportUHAC,
          textDirection: TextDirection.rtl,
          maxLines: 5,
        ),
        TextBox(
          label: AppLocalizations.of(context)!.report_under_header_english_text,
          labelColor: AppColors.primaryColor,
          controller: widget.reportUHEC,
          textDirection: TextDirection.ltr,
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
