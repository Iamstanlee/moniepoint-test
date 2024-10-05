import 'package:flutter/material.dart';
import 'package:real_estate_moniepoint_test/feature/home/ui/views/home.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  NavigatorState? get state => key.currentState;

  void pop<T extends Object>([T? result]) => state?.pop<T>(result);

  Future<bool>? maybePop<T extends Object>([T? result]) =>
      state?.maybePop(result);

  Future<T?>? push<T>(Route<T> route) => state?.push(route);

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name;

    final arguments =
        settings.arguments as Map<String, dynamic>? ?? <String, dynamic>{};

    Widget screen;

    switch (routeName) {
      case '/':
      case HomePage.route:
        screen = const HomePage();
        break;
      default:
        screen = const HomePage();
    }

    return MaterialPageRoute<void>(
      builder: (_) => screen,
      settings: RouteSettings(name: routeName, arguments: arguments),
    );
  }
}
