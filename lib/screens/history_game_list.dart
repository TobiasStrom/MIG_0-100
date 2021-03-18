import 'package:flutter/material.dart';
import 'package:flutter_mig_100/models/game.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:flutter_mig_100/providers/users_providers.dart';
import 'package:flutter_mig_100/widgets/score_list_item.dart';
import 'package:provider/provider.dart';

class HistoryGameList extends StatelessWidget {
  static final routeName = '/histori-list';
  @override
  Widget build(BuildContext context) {
    final game =  ModalRoute.of(context).settings.arguments as Game;
    final userData = Provider.of<UsersProviders>(context);
    final gameData = Provider.of<GamesProvider>(context);
    final gameItem = gameData.getScoreList(4, game.id, userData.selectedUserId);
    return SafeArea(child: Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 21,
          itemBuilder: (context, index) {
            return ScoreListItem(gameItem[index]);
          },
        ),
      ),
    ));
  }
}
