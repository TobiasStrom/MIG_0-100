import 'package:flutter/material.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:flutter_mig_100/providers/users_providers.dart';
import 'package:provider/provider.dart';

class UserListItem extends StatelessWidget {
  final String userId;
  final String gameId;

  const UserListItem(this.userId, this.gameId);
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UsersProviders>(context);
    final userName = userData.findUserById(userId).userName;
    final gameData = Provider.of<GamesProvider>(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 25,
          width: double.infinity,
          child: Row(
            children: [
              Text(
                  userName
              ),
              Spacer(),
              userData.selectedUserId == userId ?
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.delete),
              onPressed: (){
                  gameData.leaveGame(gameId, userId);
              },

              color: Theme.of(context).errorColor,) : Container(),
            ],
          ),
          
        ),
      ),
    );
  }
}
