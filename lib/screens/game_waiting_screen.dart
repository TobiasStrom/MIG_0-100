import 'package:flutter/material.dart';
import 'package:flutter_mig_100/screens/game_screen.dart';
import 'package:flutter_mig_100/widgets/users_list_item.dart';

class GameWaitingScreen extends StatelessWidget {
  static const routeName = '/game_waiting';
  @override
  Widget build(BuildContext context) {
    var admin = true;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Game: The best game'),),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                  Text('Admin user: '),
                Text('Tobias')
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Users'),
                  Row(
                    children: [
                      Text('1'),
                      Text('/'),
                      Text('5')
                    ]

                  )
                ],
              ),
              UserListItem(),

              Column(
                children: [
                  admin ? ElevatedButton(onPressed: ()=> Navigator.pushNamed(context, GameScreen.routeName), child: Text('Start game')):
                      Text('Waiting for admin to start')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
