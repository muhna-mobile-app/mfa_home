import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart' show NavigatorState, GlobalKey;
import 'presentation/pages/home_page.dart';

class HomeApp implements MicroApp {
  static GlobalKey<NavigatorState>? navigatorGlobal;

  @override
  void init({required GlobalKey<NavigatorState> navigator}) {
    navigatorGlobal = navigator;
  }

  @override
  String get microAppName => 'HomeApp';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/home': (context, args) => HomePage(),
      };
}
