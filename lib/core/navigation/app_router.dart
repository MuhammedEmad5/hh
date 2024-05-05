import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../constants/sf_keys.dart';
import '../data/datasources/local_data_source/shared_prefrence/sf_manager.dart';

class AppRouter {
  AppRouter();

  Route generateRoute(RouteSettings settings) {
    ///Note if you want to pass parameter in constructor
    ///this arguments to be passed in any screen like this ( arguments as ClassName )
    Object? arguments = settings.arguments;

    switch (settings.name) {
      case '/':



      default:
        return _buildPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }

  Route _buildPageRoute({
    required WidgetBuilder builder,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(
      builder: builder,
    )
        : MaterialPageRoute(
      builder: builder,
    );
  }
}
