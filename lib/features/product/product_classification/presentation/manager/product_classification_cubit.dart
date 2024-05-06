import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_classification/product_classification_entity.dart';
import '../../domain/use_cases/create_product_classification_use_case.dart';
import '../../domain/use_cases/delete_product_classification_use_case.dart';
import '../../domain/use_cases/read_all_product_classification_use_case.dart';
import '../../domain/use_cases/read_product_classification_use_case.dart';
import '../../domain/use_cases/update_product_classification_use_case.dart';

part 'product_classification_state.dart';
part 'product_classification_cubit.freezed.dart';

class ProductClassificationCubit extends Cubit<ProductClassificationState> {
  final ReadAllProductsClassificationUseCase _readAllProductsUseCase;
  final ReadProductClassificationUseCase _readProductClassificationUseCase;
  final CreateProductClassificationUseCase _createProductClassificationUseCase;
  final DeleteProductClassificationUseCase _deleteProductClassificationUseCase;
  final UpdateProductClassificationUseCase _updateProductClassificationUseCase;

  ProductClassificationCubit(
    this._readAllProductsUseCase,
    this._readProductClassificationUseCase,
    this._createProductClassificationUseCase,
    this._deleteProductClassificationUseCase,
    this._updateProductClassificationUseCase,
  ) : super(const ProductClassificationState.initial());

  void insertProduct(ProductClassification productClassification) async {
    emit(const ProductClassificationState.loading());
    try {
      await _createProductClassificationUseCase.execute(productClassification);
      getAllProduct();
      // emit(const ProductClassificationState.success(true));
    } catch (e) {
      emit(ProductClassificationState.error(e.toString()));
    }
  }

  void updateProduct(
      {required ProductClassification productClassification}) async {
    try {
      await _updateProductClassificationUseCase.execute(productClassification,
          id: productClassification.productClassification);
      getAllProduct();
      // emit(const ProductClassificationState.success(true));
    } catch (e) {
      emit(ProductClassificationState.error(e.toString()));
    }
  }

  void deleteProduct({required double id}) async {
    emit(const ProductClassificationState.loading());

    try {
      await _deleteProductClassificationUseCase.execute(id: id);
      getAllProduct();
      //emit(const ProductClassificationState.success(true));
    } catch (e) {
      emit(ProductClassificationState.error(e.toString()));
    }
  }

  void getProduct({required double id}) async {
    emit(const ProductClassificationState.loading());

    try {
      final product = await _readProductClassificationUseCase.execute(id: id);
      emit(ProductClassificationState.success(product));
    } catch (e) {
      emit(ProductClassificationState.error(e.toString()));
    }
  }

  void getAllProduct() async {
    emit(const ProductClassificationState.loading());

    try {
      final products = await _readAllProductsUseCase.execute();
      emit(ProductClassificationState.success(products));
    } catch (e) {
      emit(ProductClassificationState.error(e.toString()));
    }
  }

  void changeProductIndex(ProductClassification productClassification) {
    emit(ProductClassificationState.success(productClassification));
  }
}
