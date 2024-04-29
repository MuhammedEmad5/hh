import 'package:InvoiceF_ClientVendor/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/product_repo_impl.dart';
import '../domain/use_cases/create_product_use_case.dart';
import '../domain/use_cases/delete_product_use_case.dart';
import '../domain/use_cases/get_data_count_use_case.dart';
import '../domain/use_cases/get_product_last_index_use_case.dart';
import '../domain/use_cases/read_all_products_use_case.dart';
import '../domain/use_cases/read_product_use_case.dart';
import '../domain/use_cases/update_product_use_case.dart';
import '../presentation/manager/product_cubit.dart';

class ProductService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<ProductRepo>(
      () => ProductRepo(sl()),
    );
    sl.registerLazySingletonSafely<ReadAllProductsUseCase>(
      () => ReadAllProductsUseCase(productRepo: sl()),
    );
    sl.registerLazySingletonSafely<ReadProductUseCase>(
      () => ReadProductUseCase(productRepo: sl()),
    );
    sl.registerLazySingletonSafely<UpdateProductUseCase>(
      () => UpdateProductUseCase(productRepo: sl()),
    );
    sl.registerLazySingletonSafely<CreateProductUseCase>(
      () => CreateProductUseCase(productRepo: sl()),
    );
    sl.registerLazySingletonSafely<DeleteProductUseCase>(
      () => DeleteProductUseCase(productRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetLastIndexProductUseCase>(
      () => GetLastIndexProductUseCase(productRepo: sl()),
    );

    sl.registerLazySingletonSafely<GetDataCountProductUseCase>(
      () => GetDataCountProductUseCase(productRepo: sl()),
    );
    sl.registerLazySingletonSafely<ProductCubit>(
      () => ProductCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl()),
    );
  }
}
