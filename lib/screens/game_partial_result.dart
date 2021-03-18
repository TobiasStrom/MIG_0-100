import 'package:flutter/material.dart';
import 'package:flutter_mig_100/models/game.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:flutter_mig_100/providers/users_providers.dart';
import 'package:flutter_mig_100/screens/game_result_screen.dart';
import 'package:flutter_mig_100/widgets/score_list_item.dart';
import 'package:provider/provider.dart';

import 'game_screen.dart';

class GamePartialResult extends StatelessWidget {
  static final routeName = '/partial-result';
  @override
  Widget build(BuildContext context) {
    final gameData = Provider.of<GamesProvider>(context);
    final userData = Provider.of<UsersProviders>(context);
    final games = gameData.getScoreList((gameData.currentQuestion.roundNumber) -1, gameData.selectedGameId, userData.selectedUserId);
    final round = (gameData.currentQuestion.roundNumber) - 1;
    int length = gameData.currentQuestion.questionNumber;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 30,),
            Text(
              'Score round $round',
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            Text(
              '${gameData.getScore(round, gameData.selectedGameId, userData.selectedUserId)}',
              style: TextStyle(
                  fontSize: 50
              ),
            ),
            SizedBox(height: 50,),
            ScoreListItem(games[0]),
            ScoreListItem(games[1]),
            ScoreListItem(games[2]),
            ScoreListItem(games[3]),
            ScoreListItem(games[4]),
            ScoreListItem(games[5]),
            ScoreListItem(games[6]),
            Spacer(),
            ElevatedButton(onPressed: (){
              print(round.toString());
              if(length == 21){
                Navigator.pushReplacementNamed(context, ResultScreen.routeName);
              }else{
                Navigator.pushReplacementNamed(context, GameScreen.routeName);
              }

              }, child: Text(
                'Next'
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
