

import 'package:flutter/material.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:flutter_mig_100/providers/users_providers.dart';
import 'package:flutter_mig_100/widgets/history_item.dart';
import 'package:provider/provider.dart';

class GameHistory extends StatelessWidget {

  static final routeName = "/history";

  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<UsersProviders>(context).selectedUserId;
    final gameData = Provider.of<GamesProvider>(context);
    final PreferredSizeWidget appBar = AppBar(
      title: Text('History'),
    );

    return Scaffold(
      appBar: appBar,
      body: ListView.builder(
        itemCount: gameData.gamesDone(userId).length,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
                value: gameData.gamesDone(userId)[index],
                child: HistoryItem(),
            );
          },)
    );
  }
}
