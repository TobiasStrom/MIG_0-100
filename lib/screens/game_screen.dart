import 'package:flutter/material.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:flutter_mig_100/providers/users_providers.dart';
import 'package:flutter_mig_100/screens/game_add_answer_screen.dart';
import 'package:flutter_mig_100/widgets/game_info.dart';
import 'package:flutter_mig_100/widgets/game_input.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {



  static const routeName = '/game';
  @override
  Widget build(BuildContext context) {
    final gameData = Provider.of<GamesProvider>(context);
    final userData = Provider.of<UsersProviders>(context);
    final mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
            ),
            GameInfo(true),
            GameInput(),
            ElevatedButton(onPressed: (){
              if(!gameData.nextQuestion(userData.selectedUserId)){
                Navigator.pushReplacementNamed(context, GameAddAnswerScreen.routeName);
              }
              //Navigator.pushNamed(context, ResultScreen.routeName);
            }, child: Text('Next'))
          ],
        ),
      ),
    );
  }
}
