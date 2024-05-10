import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    this.isFirstLaunch = false,
  });

  final bool isFirstLaunch;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
