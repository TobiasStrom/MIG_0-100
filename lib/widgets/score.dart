import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int score;
  Score({this.score});

  @override
  Widget build(BuildContext context) {
    //int totalScore = 0;
    return Center(
      child: Container(
          height: 200,
          child: Column(
            children: [
              Text(
                "Your score is",
                style: TextStyle(fontSize: 50),
              ),
              Text(
                score.toString(),
                style: TextStyle(fontSize: 70),
              )
            ],
          )),
    );
  }
}
