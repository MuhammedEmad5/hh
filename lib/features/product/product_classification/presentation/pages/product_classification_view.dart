import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/custom_error_widget.dart';
import '../../../../../core/presentation/widgets/dropdown_search.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import '../../../../../core/presentation/widgets/form_navigation.dart';
import '../../../../../core/presentation/widgets/label.dart';
import '../../../../../core/presentation/widgets/loader_widget.dart';
import '../../../../../core/utils/logger.dart';
import '../../domain/entities/product_classification/product_classification_entity.dart';
import '../manager/product_classification_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/product_classification_form_Container.dart';


class ProductClassificationView extends StatefulWidget {
  const ProductClassificationView({
    super.key,
  });

  @override
  State<ProductClassificationView> createState() =>
      _ProductClassificationViewState();
}

class _ProductClassificationViewState extends State<ProductClassificationView> {
  late TextEditingController productClassificationTextController;
  late TextEditingController nameArabicTextController;
  late TextEditingController nameEnglishTextController;
  late CustomDropdownController parentDropdownController;

  late AppLocalizations appLocalizations;
  List<ProductClassification> productList = [];
  bool isNewProduct = false;

  @override
  void initState() {
    super.initState();
    productClassificationTextController = TextEditingController();
    nameArabicTextController = TextEditingController();
    nameEnglishTextController = TextEditingController();
    parentDropdownController = CustomDropdownController();
  }

  @override
  void dispose() {
    super.dispose();
    productClassificationTextController.dispose();
    nameArabicTextController.dispose();
    nameEnglishTextController.dispose();
    parentDropdownController.dispose();
  }

  // todo some parent with null
  void updateTextFields(ProductClassification productClassification) {
    LoggerSingleton.logger.i(productClassification.productClassification);
    productClassificationTextController.text =
        productClassification.productClassification.toString();
    nameArabicTextController.text = productClassification.arabicName ?? "";
    nameEnglishTextController.text = productClassification.englishName ?? "";
    parentDropdownController.value = productClassification.productClassification.toString();
  }

  void deleteProduct(String id) {
    context
        .read<ProductClassificationCubit>()
        .deleteProduct(id: double.parse(id));
  }

  void resetAll() {
    nameArabicTextController.clear();
    nameEnglishTextController.clear();
  }

  void addNew() {
    isNewProduct = true;
    setState(() {
      final newProduct =
          ProductClassification(productClassification: productList.length + 1);
      productList.add(newProduct);
      updateTextFields(newProduct);
    });
  }

  void handleSuccess(List<ProductClassification> productList) {
    if (productList.isEmpty) {
      isNewProduct = true;
      updateTextFields(ProductClassification(productClassification: 1));
      return;
    }

    if (!isNewProduct) {
      updateTextFields(productList[0]);
    }
  }

  void onSubmit() {
    final ProductClassification productClassification = ProductClassification(
        productClassification:
            int.parse(productClassificationTextController.text),
        //todo: Handle Parent
       // parent: int.parse(productClassificationTextController.text),
        parent: 1,
        arabicName: nameArabicTextController.text,
        englishName: nameEnglishTextController.text);

    isNewProduct
        ? context
            .read<ProductClassificationCubit>()
            .insertProduct(productClassification)
        : context
            .read<ProductClassificationCubit>()
            .updateProduct(productClassification: productClassification);
    isNewProduct = false;
  }

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        color: AppColors.primaryColor,
        addBtnColor: Colors.white,
        saveBtnColor: Colors.white,
        textColor: Colors.white,
        onAddPressed: () => addNew(),
        onSavePressed: () => onSubmit(),
       title: appLocalizations.products_classification,
      ),
      body: BlocBuilder<ProductClassificationCubit, ProductClassificationState>(
        builder: (context, state) {
          return state.when(
              initial: () => const SizedBox(),
              loading: () =>  Center(child: Loader()),
              success: (products) {
                productList = products;

                handleSuccess(productList);

                return Column(
                  children: [
                    Expanded(
                      child: ProductClassificationFormContainer(
                        productClassificationTextController: productClassificationTextController,
                        nameArabicTextController: nameArabicTextController,
                        nameEnglishTextController: nameEnglishTextController,
                        parentDropdownController: parentDropdownController,
                        productClassificationList: productList,

                      ) ,
                    ),
                    FB5Col(
                      classNames: 'mb-5',
                      child: FormNavigation(
                        length: productList.length,
                        onChanged: (index) {
                          updateTextFields(productList[index - 1]);
                        },
                      ),
                    ),
                  ],
                );
              },
              error: (e) => CustomErrorWidget(
                    errorMessage: e,
                  ));
        },
      ),
    );
  }
}
