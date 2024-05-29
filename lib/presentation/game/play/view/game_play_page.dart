import 'package:arcibo/presentation/game/play/view/game_play_screen.dart';
import 'package:arcibo/presentation/home/view/home_screen.dart';
import 'package:flutter/material.dart';

class GamePlayPage extends StatelessWidget {
  const GamePlayPage({super.key});

  static const routeName = '/game/play';

  static Route<void> route() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const GamePlayPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const GamePlayScreen();
  }
}
