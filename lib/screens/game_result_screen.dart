import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/game-result';

  var done = false;
  var admin = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(child: Text('Results'))
        ),
    );
  }
}
