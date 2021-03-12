import 'package:flutter/material.dart';
import 'package:flutter_mig_100/widgets/game_info.dart';
import 'package:flutter_mig_100/widgets/game_input.dart';

class GameScreen extends StatelessWidget {
  static const routeName = '/game';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            GameInfo(),
            GameInput(),
          ],
        ),
      ),
    );
  }
}
