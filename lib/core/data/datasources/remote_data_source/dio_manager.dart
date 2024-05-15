import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioManager {
  static Dio? _dioInstance;

  static Dio get dio {
    if (_dioInstance == null) {
      _dioInstance = Dio(
        BaseOptions(
          baseUrl: "http://10.147.17.29:3000/createDataQuery",
        ),
      );

      _dioInstance!.interceptors.clear();
      _dioInstance!.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.data is Map) {
            final Map<String, dynamic> defaultBody = {
              "instance": ".",
              "db": "StoreDB_505_NadaB2",
            };
            options.data = {...defaultBody, ...options.data};
          }
          return handler.next(options);
        },
      ));
      _dioInstance!.options.connectTimeout = const Duration(seconds: 5);
      _dioInstance!.options.receiveTimeout = const Duration(seconds: 5);
      _dioInstance!.options.sendTimeout = const Duration(seconds: 5);

      _dioInstance!.interceptors.addAll([
        // PrettyDioLogger(
        //   requestHeader: true,
        //   requestBody: true,
        //   error: true,
        //   maxWidth: 60,
        // ),
      ]);
    }

    return _dioInstance!;
  }
}
