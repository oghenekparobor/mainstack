import 'package:flutter/material.dart';
import 'package:mainstack/modules/editor/presentation/views/home.dart';

class Routes {
  static const String editor = "/";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case editor:
        return _getPageRoute(
          settings: settings,
          viewToShow: const EditorHome(),
        );

      default:
        return _getPageRoute(
          settings: settings,
          viewToShow: const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }
}

PageRoute _getPageRoute({
  required RouteSettings settings,
  required Widget viewToShow,
}) {
  return MaterialPageRoute<void>(
    settings: settings,
    builder: (_) => viewToShow,
  );
}
