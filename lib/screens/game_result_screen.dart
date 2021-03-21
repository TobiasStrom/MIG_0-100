import 'package:flutter/material.dart';
import 'package:flutter_mig_100/screens/game_list_screen.dart';

class GameResultScreen extends StatelessWidget {
  static final routeName = '/game-result';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              'Hei',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
