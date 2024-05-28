import 'package:arcibo/presentation/game/pick_seri/view/game_pick_seri_screen.dart';
import 'package:flutter/material.dart';

class GamePickSeriPage extends StatelessWidget {
  const GamePickSeriPage({Key? key}) : super(key: key);

  static const routeName = '/game/pick-seri';

  static Route<void> route() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const GamePickSeriPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GamePickSeriScreen();
  }
}
