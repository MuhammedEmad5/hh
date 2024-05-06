import 'dart:io';
import 'package:InvoiceF/features/shared/presentation/views/bottom_navigation_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AppRouter {
  AppRouter();

  Route generateRoute(RouteSettings settings) {
    ///Note if you want to pass parameter in constructor
    ///this arguments to be passed in any screen like this ( arguments as ClassName )
    Object? arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return _buildPageRoute(
            builder: (context) {

              return  BottomNavigationTabs();
            }


        );


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
