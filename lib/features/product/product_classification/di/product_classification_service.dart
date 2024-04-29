import 'package:InvoiceF_ClientVendor/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/data/datasources/remote_data_source/remote_connection.dart';
import '../data/repositories/product_classification_impl.dart';
import '../domain/use_cases/create_product_classification_use_case.dart';
import '../domain/use_cases/delete_product_classification_use_case.dart';
import '../domain/use_cases/read_all_product_classification_use_case.dart';
import '../domain/use_cases/read_product_classification_use_case.dart';
import '../domain/use_cases/update_product_classification_use_case.dart';
import '../presentation/manager/product_classification_cubit.dart';

class  ProductClassificationService{
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<ProductClassificationRepo>(
          () => ProductClassificationRepo( sl()),
    );
    sl.registerLazySingletonSafely<ReadAllProductsClassificationUseCase>(
          () => ReadAllProductsClassificationUseCase(productClassificationRepo: sl()),
    );
    sl.registerLazySingletonSafely<ReadProductClassificationUseCase>(
          () => ReadProductClassificationUseCase(productClassificationRepo: sl()),
    );
    sl.registerLazySingletonSafely<UpdateProductClassificationUseCase>(
          () => UpdateProductClassificationUseCase(productClassificationRepo: sl()),
    );
    sl.registerLazySingletonSafely<CreateProductClassificationUseCase>(
          () => CreateProductClassificationUseCase(productClassificationRepo: sl()),
    );
    sl.registerLazySingletonSafely<DeleteProductClassificationUseCase>(
          () => DeleteProductClassificationUseCase(productClassificationRepo: sl()),
    );
    sl.registerLazySingletonSafely<ProductClassificationCubit>(
          () => ProductClassificationCubit(
          sl(),
          sl(),
          sl(),
          sl(),
          sl()
      ),
    );
  }
}