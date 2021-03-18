import 'package:flutter/material.dart';
import 'package:flutter_mig_100/models/game.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:flutter_mig_100/providers/users_providers.dart';
import 'package:flutter_mig_100/screens/game_result_screen.dart';
import 'package:flutter_mig_100/screens/history_game_list.dart';
import 'package:provider/provider.dart';

class HistoryItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);
    final gameData = Provider.of<GamesProvider>(context);
    final userData = Provider.of<UsersProviders>(context);
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(10),
      onTap: ()=> Navigator.pushNamed(context, HistoryGameList.routeName, arguments: game),
      child: Card(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(game.name),
                Text("Total score:" + gameData.getScore(4, game.id, userData.selectedUserId).toString())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
