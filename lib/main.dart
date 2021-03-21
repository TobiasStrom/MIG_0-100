import 'package:flutter/material.dart';
import 'package:flutter_mig_100/screens/game_list_screen.dart';
import 'package:flutter_mig_100/screens/game_partial_result_screen.dart';
import 'package:flutter_mig_100/screens/game_result_screen.dart';
import 'package:flutter_mig_100/screens/game_screen.dart';
import 'package:flutter_mig_100/screens/game_waiting_screen.dart';
import 'package:flutter_mig_100/screens/log_in_screen.dart';
import 'package:flutter_mig_100/screens/new_game_screen.dart';
import 'package:flutter_mig_100/screens/sign_in_screen.dart';
//import 'package:flutter_mig_100/widgets/gameInput.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mig 0-100',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (ctx) => LogInScreen(),
        SignInScreen.routeName: (ctx) => SignInScreen(),
        GameListScreen.routeName: (ctx) => GameListScreen(),
        NewGameScreen.routeName: (ctx) => NewGameScreen(),
        GameWaitingScreen.routeName: (ctx) => GameWaitingScreen(),
        GameScreen.routeName: (ctx) => GameScreen(),
        GamePartialResultScreen.routeName: (ctx) => GamePartialResultScreen(),
        GameResultScreen.routeName: (ctx) => GameResultScreen(),
      },
    );
  }
}
