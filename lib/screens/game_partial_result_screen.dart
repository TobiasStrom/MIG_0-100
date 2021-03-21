import 'package:flutter/material.dart';
import 'package:flutter_mig_100/screens/game_list_screen.dart';
import 'package:flutter_mig_100/widgets/game_result_item.dart';
import 'package:flutter_mig_100/screens/game_result_screen.dart';

class GamePartialResultScreen extends StatelessWidget {
  static const routeName = '/game-partial-result';

  var done = false;
  var admin = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height:
                    (mediaQuery.size.height - mediaQuery.padding.top) * 0.05,
              ),
              Text(
                'Round 1',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              GameResultItem(1, 45, 35, 10),
              GameResultItem(2, 45, 35, 10),
              GameResultItem(3, 45, 35, 10),
              GameResultItem(4, 45, 35, 10),
              GameResultItem(5, 45, 35, 10),
              GameResultItem(6, 45, 35, 10),
              GameResultItem(7, 45, 35, 10),
              Row(
                children: [
                  Text('Score:'),
                  Text('70'),
                ],
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, GameResultScreen.routeName),
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
