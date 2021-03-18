import 'package:flutter/material.dart';
import 'package:flutter_mig_100/models/game.dart';
import 'package:flutter_mig_100/models/game_item.dart';
import 'package:flutter_mig_100/models/game_to_play.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:flutter_mig_100/screens/game_waiting_screen.dart';
import 'package:provider/provider.dart';

class GameListItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final game = Provider.of<Game>(context);

    return InkWell(
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(10),
      onTap: ()=> Navigator.pushNamed(context, GameWaitingScreen.routeName, arguments: game.id),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text(game.id),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    game.name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.person),
                  Text(': ${game.maxUsers}'),
                  SizedBox(width: 15,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
