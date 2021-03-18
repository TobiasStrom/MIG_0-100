import 'package:flutter/material.dart';
import 'package:flutter_mig_100/models/game_item.dart';

class ScoreListItem extends StatelessWidget {
  final GameItem gameItem;

  ScoreListItem(this.gameItem);

  int calulateScore(int answer, int right){
    if(answer == right){
      return -10;
    }
    return (answer - right).abs();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(2),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              child: Text(gameItem.questionNumber.toString()),
            ),
            Text("Your: " + gameItem.answer.toString()),
            Text("Right: " + gameItem.rightAnswer.toString()),
            Text("Score: " + calulateScore(gameItem.answer, gameItem.rightAnswer).toString()),
          ],
        ),
      ),
    );
  }
}
