import 'package:flutter/material.dart';
import 'file:///C:/Users/Tobia/AppAndWeb/Flutter/flutter_mig_100/flutter_mig_100/lib/Olde/game_provider.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:flutter_mig_100/screens/game_add_answer_screen.dart';
import 'package:flutter_mig_100/screens/game_history.dart';
import 'package:flutter_mig_100/screens/game_partial_result.dart';
import 'package:flutter_mig_100/screens/history_game_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mig_100/screens/game_list_screen.dart';
import 'package:flutter_mig_100/screens/game_result_screen.dart';
import 'package:flutter_mig_100/screens/game_screen.dart';
import 'package:flutter_mig_100/screens/game_waiting_screen.dart';
import 'package:flutter_mig_100/screens/log_in_screen.dart';
import 'package:flutter_mig_100/screens/new_game_screen.dart';
import 'package:flutter_mig_100/screens/sign_in_screen.dart';
import './providers/users_providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UsersProviders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => GamesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Mig 0-100',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (ctx) => LogInScreen(),
          LogInScreen.routeName: (ctx) => LogInScreen(),
          SignInScreen.routeName: (ctx) => SignInScreen(),
          GameListScreen.routeName: (ctx) => GameListScreen(),
          NewGameScreen.routeName: (ctx) => NewGameScreen(),
          GameWaitingScreen.routeName: (ctx) => GameWaitingScreen(),
          GameScreen.routeName: (ctx) => GameScreen(),
          ResultScreen.routeName: (ctx) => ResultScreen(),
          GameAddAnswerScreen.routeName: (ctx) => GameAddAnswerScreen(),
          GameHistory.routeName: (ctx) => GameHistory(),
          GamePartialResult.routeName: (ctx) => GamePartialResult(),
          HistoryGameList.routeName: (ctx) => HistoryGameList(),
        },
      ),
    );
  }
}
