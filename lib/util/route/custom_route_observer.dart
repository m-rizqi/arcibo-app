import 'package:arcibo/presentation/global_key_route.dart';
import 'package:flutter/material.dart';

class CustomRouteObserver extends RouteObserver<ModalRoute<dynamic>> {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _closeDrawerIfOpen();
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    _closeDrawerIfOpen();
  }

  void _closeDrawerIfOpen() {
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      scaffoldKey.currentState?.openEndDrawer();
    }
  }
}
