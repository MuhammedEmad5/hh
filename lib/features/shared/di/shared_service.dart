import 'package:InvoiceF/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';

import '../../../core/blocs/connection_type_bloc/connection_bloc.dart';
import '../../../core/data/datasources/connection.dart';
import '../../../core/data/datasources/local_data_source/sqlLite/local_connection.dart';
import '../../../core/data/datasources/remote_data_source/remote_connection.dart';



class SharedService {
  final sl = GetIt.instance;


  Future<void> initDi(IConnection iConnection) async {


    if (sl.isRegistered<IConnection>()) {
      sl.unregister<IConnection>();
    }


    if (iConnection is RemoteConnection){
      sl.registerLazySingletonSafely<IConnection>(
            () => RemoteConnection(),
      );
    }else {
      sl.registerLazySingletonSafely<IConnection>(
            () => LocalConnection(),
      );
    }





  }
}