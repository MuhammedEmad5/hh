import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  static get key => _navigatorKey;

  static get context => _navigatorKey.currentState!.context;

  static push(Widget view) {
    _navigatorKey.currentState!.push(
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }

  static void pushPageRoute(Route route) {
    _navigatorKey.currentState!.push(route);
  }
  static void pushReplacementNamedPageRoute(String route,[Object? argument]) {
    _navigatorKey.currentState!.pushReplacementNamed(route,arguments: argument);
  }
  static void pushNamedPageRoute(String route ,[Object? argument]) {
    _navigatorKey.currentState!.pushNamed(route, arguments: argument);
  }

  static pop() {
    _navigatorKey.currentState!.pop();
  }

  static pushReplacement(Widget view) {
    _navigatorKey.currentState!.pushReplacement(buildPageRoute(
      builder: (context) => view,
    ));
  }

  static popUntilFirst() {
    _navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

Route buildPageRoute({
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
