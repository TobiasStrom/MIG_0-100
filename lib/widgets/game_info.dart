import 'package:flutter/material.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:provider/provider.dart';

class GameInfo extends StatelessWidget {

  final bool isQuestion;

  const GameInfo(this.isQuestion);
  @override
  Widget build(BuildContext context) {
    var gameData = Provider.of<GamesProvider>(context);
    var game = gameData.currentQuestion;

    return Column(
      children: [
        Text(
          game.round + " " + game.roundNumber.toString(),
          style: TextStyle(
            fontSize: 25,
          ),
        ),

        Text(game.question + " " + ( isQuestion? game.questionNumber.toString(): game.answerNumber.toString())),
      ],
    );
  }
}
