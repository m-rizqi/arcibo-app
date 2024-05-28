import 'package:arcibo/presentation/home/view/home_page.dart';
import 'package:arcibo/util/route/custom_route_observer.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name!);
    var route = uri.path;
    Object? arguments;

    final page = _getPageFromRoute(route, settings.arguments);
    if (page != null) {
      return page;
    }

    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Text('Page $route not found :('),
          ),
        );
      },
    );
  }

  static Route<dynamic>? _getPageFromRoute(String? routeName, Object? arguments) {
    switch (routeName) {
      case HomePage.routeName:
        return HomePage.route();
      default:
        return null;
    }
  }

  static Future<dynamic>? push<T>(String route, [T? arguments]) => state?.pushNamed(
        route,
        arguments: arguments,
      );

  static Future<dynamic>? replaceWith<T>(String route, [T? arguments]) => state?.pushReplacementNamed(
        route,
        arguments: arguments,
      );

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;

  static String? getCurrentRouteName(BuildContext context) {
    final ModalRoute? modalRoute = ModalRoute.of(context);
    return modalRoute?.settings.name;
  }
}
