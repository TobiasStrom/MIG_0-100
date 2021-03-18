import 'package:flutter/material.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:flutter_mig_100/providers/users_providers.dart';
import 'package:flutter_mig_100/screens/game_waiting_screen.dart';
import 'package:provider/provider.dart';

class NewGameScreen extends StatelessWidget {
  static const routeName = '/new-game';
  @override
  Widget build(BuildContext context) {
    String name = "";
    String maxUsers = "";
    final gameData = Provider.of<GamesProvider>(context);
    final userData = Provider.of<UsersProviders>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Game'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children:[
              Text('Create new game'),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                onChanged: (value) => name = value,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Max users',
                ),
                onChanged: (value) => maxUsers = value,
              ),
              ElevatedButton(
                onPressed: () {
                  var value = int.tryParse(maxUsers);
                  if(value != null && value < 10){
                    String gameid = gameData.createGame(userData.selectedUserId, name, value);
                    Navigator.pushReplacementNamed(context, GameWaitingScreen.routeName, arguments: gameid );
                  }

                },
                child: Text('Create game'))
            ],
          ),
        ),
      ),
    );
  }
}
