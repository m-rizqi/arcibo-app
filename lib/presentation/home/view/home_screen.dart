import 'package:arcibo/presentation/global_key_route.dart';
import 'package:arcibo/presentation/widget/drawer/main_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final drawer = mainDrawer(context);

    return Scaffold(
      key: scaffoldKey,
      drawer: drawer,
    );
  }
}
