import 'package:flutter/material.dart';
import 'package:flutter_mig_100/screens/game_waiting_screen.dart';

class GameListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(10),
      onTap: ()=> Navigator.pushNamed(context, GameWaitingScreen.routeName),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text('1'),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'The best game',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.person),
                  Text(': 5'),
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
