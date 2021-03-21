import 'package:flutter/material.dart';

class GameResultItem extends StatelessWidget {
  final int question;
  final int yourAnswer;
  final int rightAnswer;
  final int score;

  const GameResultItem(
      this.question, this.yourAnswer, this.rightAnswer, this.score);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              child: Text(question.toString()),
              radius: 17,
            ),
            Text('You: ${yourAnswer.toString()}'),
            Text('Right: ${rightAnswer.toString()}'),
            Text('Score: ${score.toString()}'),
          ],
        ),
      ),
    );
  }
}
