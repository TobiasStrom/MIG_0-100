import 'package:flutter/material.dart';
import 'package:flutter_mig_100/screens/game_waiting_screen.dart';

class NewGameScreen extends StatelessWidget {
  static const routeName = '/new-game';
  @override
  Widget build(BuildContext context) {
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
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Max users',
                ),
              ),
              ElevatedButton(onPressed: ()=> Navigator.pushNamed(context, GameWaitingScreen.routeName), child: Text('Create game'))
            ],
          ),
        ),
      ),
    );
  }
}
