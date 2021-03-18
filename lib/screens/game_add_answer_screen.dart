import 'package:flutter/material.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:flutter_mig_100/providers/users_providers.dart';
import 'package:flutter_mig_100/screens/game_partial_result.dart';
import 'package:flutter_mig_100/screens/game_result_screen.dart';
import 'package:flutter_mig_100/screens/game_screen.dart';
import 'package:flutter_mig_100/widgets/game_info.dart';
import 'package:flutter_mig_100/widgets/game_input.dart';
import 'package:provider/provider.dart';

class GameAddAnswerScreen extends StatelessWidget {
  static final routeName = '/add-answer';
  @override
  Widget build(BuildContext context) {
    final usersData = Provider.of<UsersProviders>(context);
    final gameData = Provider.of<GamesProvider>(context);
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
            ),
            GameInfo(false),
            GameInput(),
            ElevatedButton(onPressed: (){
              if(!gameData.nextAnswer(usersData.selectedUserId)){
                Navigator.pushReplacementNamed(context, GamePartialResult.routeName);
                /*
                print(gameData.currentQuestion.done);
                if(gameData.currentQuestion.done){
                  Navigator.pushReplacementNamed(context, ResultScreen.routeName);
                }else{
                  Navigator.pushReplacementNamed(context, GameScreen.routeName);
                }

                 */
              }
              //Navigator.pushNamed(context, ResultScreen.routeName);
            }, child: Text('Next'))
          ],
        ),
      ),
    );
  }
}
