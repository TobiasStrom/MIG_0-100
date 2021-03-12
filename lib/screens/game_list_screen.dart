import 'package:flutter/material.dart';
import 'package:flutter_mig_100/screens/new_game_screen.dart';
import 'package:flutter_mig_100/widgets/game_list_item.dart';

class GameListScreen extends StatelessWidget {
  static const routeName = '/game-list';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('MIG 0-100'),
        ),
        body: Column(
          children: [
            Text(
              'Avaliable games',
              style: TextStyle(
                fontSize: 26
              ),
            ),
            GameListItem()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, NewGameScreen.routeName),
        ),
      ),
    );
  }
}
