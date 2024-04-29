import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/presentation/widgets/bootstrap/text_box_bootstrap.dart';
import '../../../../../core/presentation/widgets/dropdown_search.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_with_controller.dart';
import '../../../../../core/presentation/widgets/label.dart';
import '../../domain/entities/product_classification/product_classification_entity.dart';

class ProductClassificationFormContainer extends StatelessWidget {

  final TextEditingController productClassificationTextController;
  final TextEditingController nameArabicTextController;
  final TextEditingController nameEnglishTextController;
  final CustomDropdownController parentDropdownController;
  final List<ProductClassification> productClassificationList;
  late AppLocalizations appLocalizations;





   ProductClassificationFormContainer({
    super.key,
    required this.productClassificationTextController,
    required this.nameArabicTextController,
    required this.nameEnglishTextController,
    required this.parentDropdownController,
    required this.productClassificationList

  });

  @override
  Widget build(BuildContext context) {

    appLocalizations = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: FB5Row(
          classNames: 'px-xs-3 px-lg-custom-10 mt-3 ',
          children: [
            FB5Col(
              classNames: 'col-xs-12 col-sm-12 ',
              child: TextBoxBootstrap(
                hint: "",
                initialValue:
                productClassificationTextController.text,
                keyboardType:
                const TextInputType.numberWithOptions(
                    decimal: true),
                label: appLocalizations.products_classification,
                readOnly: true,
                textFiledWidth: 100,
                controller:
                productClassificationTextController,
              ),
            ),
            FB5Col(
              classNames: 'col-xs-12 col-sm-6  py-2  ',
              child: Label(
                text: appLocalizations.parent,
              ),
            ),
            FB5Col(
                classNames: 'col-xs-12  col-sm-6 gx-2 ',
                child: CustomDropdownWithController(
                  controller: parentDropdownController,
                  onChanged: (value) {

                  },
                  items: productClassificationList.map(( product){
                    return DropdownMenuItem<String>(
                      value: product.productClassification.toString(),
                      child: Text( product.arabicName ?? "" ),
                    );
                  }).toList(),

                )),
            FB5Col(
              child: TextBoxBootstrap(
                label: appLocalizations.arabic_name,
                controller: nameArabicTextController,
              ),
            ),
            FB5Col(
                child: TextBoxBootstrap(
                  label: appLocalizations.english_name,
                  controller: nameEnglishTextController,
                )),
          ]),
    );
  }
}
