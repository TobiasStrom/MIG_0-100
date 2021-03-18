import 'package:flutter/material.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:flutter_mig_100/providers/users_providers.dart';
import 'package:flutter_mig_100/screens/game_list_screen.dart';
import 'package:flutter_mig_100/widgets/score_list_item.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/game-result';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final gameData = Provider.of<GamesProvider>(context);
    final userData = Provider.of<UsersProviders>(context);
    final userId = userData.selectedUserId;
    final gameId = gameData.selectedGameId;
    final gameList = gameData.getScoreList(4, gameId, userId);
    final totalScore = gameData.getScore(4 ,gameId, userId);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Results',
                      style: TextStyle(
                          fontSize: 30
                      ),
                    ),
                    Text(
                      totalScore.toString(),
                      style: TextStyle(
                          fontSize: 30
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.7,
                  child: ListView.builder(
                      itemCount: gameList.length,
                      itemBuilder: (context, index) {
                        return ScoreListItem(gameList[index]);
                      },
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                gameData.restart();
                gameData.done();
                Navigator.pop(context);
              }, child: Text('Done'))
            ],
          ),
        ),
      ),
    );
  }
}
