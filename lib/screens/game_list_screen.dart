import 'package:flutter/material.dart';
import 'package:flutter_mig_100/models/game.dart';
import 'package:flutter_mig_100/providers/users_providers.dart';
import 'package:flutter_mig_100/screens/game_history.dart';
import 'package:flutter_mig_100/screens/log_in_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:flutter_mig_100/screens/new_game_screen.dart';
import 'package:flutter_mig_100/widgets/game_list_item.dart';


class GameListScreen extends StatelessWidget {
  static const routeName = '/game-list';
  @override
  Widget build(BuildContext context) {
    final gameData = Provider.of<GamesProvider>(context);
    final userData = Provider.of<UsersProviders>(context);
    List<Game> games = gameData.gamesToPlay;
    final mediaQuery = MediaQuery.of(context);

    final PreferredSizeWidget appBar = AppBar(
      title: Text('MIG 0-100'),
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            userData.logOut();
            Navigator.pushReplacementNamed(context, LogInScreen.routeName);
          },
        ),
      ],
    );
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: (mediaQuery.size.height - mediaQuery.padding.top  - appBar.preferredSize.height) * 0.1,
                child: Center(
                  child: Text(
                    'Avaliable games',
                    style: TextStyle(
                      fontSize: 26
                    ),
                  ),
                ),
              ),
              Container(
                height: (mediaQuery.size.height - mediaQuery.padding.top  - appBar.preferredSize.height) * .75,
                child: ListView.builder(
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: games[index],
                      child: GameListItem(),
                    );
                  },
                ),
              ),

              Container(
                height: (mediaQuery.size.height - mediaQuery.padding.top  - appBar.preferredSize.height) * .1,
                child: Center(
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, GameHistory.routeName);
                    },
                    child: Text(
                        'Show history'
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, NewGameScreen.routeName),
        ),
      ),
    );
  }
}
