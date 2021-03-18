import 'package:flutter/material.dart';
import 'package:flutter_mig_100/models/game.dart';
import 'package:flutter_mig_100/models/game_to_play.dart';
import 'file:///C:/Users/Tobia/AppAndWeb/Flutter/flutter_mig_100/flutter_mig_100/lib/Olde/game_provider.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:flutter_mig_100/providers/users_providers.dart';
import 'package:flutter_mig_100/screens/game_screen.dart';
import 'package:flutter_mig_100/widgets/users_list_item.dart';
import 'package:provider/provider.dart';

class GameWaitingScreen extends StatelessWidget {
  static const routeName = '/game_waiting';
  @override
  Widget build(BuildContext context) {
    final id =  ModalRoute.of(context).settings.arguments as String;
    final userData = Provider.of<UsersProviders>(context);
    final gameData = Provider.of<GamesProvider>(context);
    final Game game = gameData.getGameById(id);
    final isFull = gameData.isGameFull(id);
    final isUserInGame = gameData.userIsParticipants(id, userData.selectedUserId);
    final admin = gameData.checkIfAdmin(id ,userData.selectedUserId);
    print(isUserInGame);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Game: The best game'),),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                    Text('Admin username: '),
                  Text(userData.findUserById(game.admin).userName)
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Users'),
                    Row(
                      children: [
                        Text((game.participants.length + 1).toString()),
                        Text('/'),
                        Text(game.maxUsers.toString())
                      ]

                    )
                  ],
                ),
                Container(
                    height: 400,
                    child: ListView.builder(
                      itemBuilder: (context, index) => UserListItem(
                          game.participants[index], id),
                      itemCount: game.participants.length,),
                ),

                Column(
                  children: [
                    admin ? ElevatedButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, GameScreen.routeName);
                      gameData.setSelectedGameId(id);
                    }, child: Text('Start game')):
      isFull? isUserInGame ? Text('Waiting for admin to start') : ElevatedButton(onPressed: (){gameData.joinGame(id, userData.selectedUserId);}, child: Text('Join game')) : Text('Game is full')
      ],
      ),
      ],
      ),
          ),
      ),
      ),
    );
  }
}
