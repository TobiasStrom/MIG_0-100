import 'package:flutter/material.dart';
import 'package:flutter_mig_100/screens/game_partial_result_screen.dart';
import 'package:flutter_mig_100/widgets/game_info.dart';
import 'package:flutter_mig_100/widgets/game_input.dart';

class GameScreen extends StatelessWidget {
  static const routeName = '/game';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
            ),
            GameInfo(),
            GameInput(),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                    context, GamePartialResultScreen.routeName),
                child: Text('Next'))
          ],
        ),
      ),
    );
  }
}
