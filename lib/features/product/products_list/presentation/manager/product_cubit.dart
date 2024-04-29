import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/logger.dart';
import '../../domain/entities/item_entity_model.dart';
import '../../domain/use_cases/create_product_use_case.dart';
import '../../domain/use_cases/delete_product_use_case.dart';
import '../../domain/use_cases/get_data_count_use_case.dart';
import '../../domain/use_cases/get_product_last_index_use_case.dart';
import '../../domain/use_cases/read_all_products_use_case.dart';
import '../../domain/use_cases/read_product_use_case.dart';
import '../../domain/use_cases/update_product_use_case.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  final CreateProductUseCase createProductUseCase;
  final ReadProductUseCase readProductUseCase;
  final DeleteProductUseCase deleteProductUseCase;
  final UpdateProductUseCase updateProductUseCase;
  final ReadAllProductsUseCase readAllProductsUseCase;
  final GetLastIndexProductUseCase getLastIndexProductUseCase;
  final GetDataCountProductUseCase getDataCountProductUseCase;

  ProductCubit(
    this.createProductUseCase,
    this.readProductUseCase,
    this.deleteProductUseCase,
    this.updateProductUseCase,
    this.readAllProductsUseCase,
    this.getLastIndexProductUseCase,
    this.getDataCountProductUseCase,
  ) : super(const ProductState.loading());

  void insertProduct(ItemEntity product) async {
    try {
      await createProductUseCase.execute(product);
      // getAllProducts();
      //emit(const ProductState.success(true));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }

  void getAllProducts() async {
    try {
      final products = await readAllProductsUseCase.execute();
      LoggerSingleton.logger.e(products.length);
      products.isEmpty
          ? emit(ProductState.empty())
          : emit(ProductState.success(products));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }

  void getProduct({required double id}) async {
    try {
      final product = await readProductUseCase.execute(id: id);
      emit(ProductState.success([product]));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }

  void updateProduct({required ItemEntity product}) async {
    try {
      await updateProductUseCase.execute(product, id: product.itemNo);
      getAllProducts();
      // emit(ProductState.success(true));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }

  void deleteProduct({required num id}) async {
    try {
      await deleteProductUseCase.execute(id: id);
      // getAllProducts();
      //emit(ProductState.success(true));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }

  Future<int> getDataCount() async {
    int dataCount = await getDataCountProductUseCase.execute();
    return dataCount;
  }

  void getLastIndex() async {
    var data = '1';
    try {
      var index = await getLastIndexProductUseCase.execute('Item', 'itemNo');
      data = index;
      emit(ProductState.getLastIndex(data));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }
}
