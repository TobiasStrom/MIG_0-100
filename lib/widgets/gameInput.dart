import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mig_100/Models/game.dart';
import 'package:flutter_mig_100/widgets/score.dart';

class GameInput extends StatefulWidget {
  @override
  _GameInputState createState() => _GameInputState();
}

int question = 1;
int answer = 1;
int round = 1;
List<int> score = [0, 0, 0];
String answerInn = "";

class _GameInputState extends State<GameInput> {
  double _currentSliderValue = 20;
  String out = "Spørsmål " + question.toString();
  bool isQuestion = true;
  bool done = false;
  int total = 0;
  List<Game> games = [];
  void addAnwer() {
    Game game = new Game();
    game.answer = _currentSliderValue.round();
    game.rightAnswer = 0;
    game.score = 0;
    games.add(game);

    setState(() {
      question++;
      if (question % 7 == 1) {
        isQuestion = false;
        out = "Riktig svar " + answer.toString();
      } else {
        out = "Spørsmål " + question.toString();
      }
    });
  }

  void setAnswer() {
    games[answer - 1].rightAnswer = _currentSliderValue.toInt();
    if (_currentSliderValue.toInt() == games[answer - 1].answer) {
      games[answer - 1].score = -10;
      score[round - 1] += -10;
    } else {
      int value =
          (_currentSliderValue.toInt() - games[answer - 1].answer).abs();
      games[answer - 1].score = value;
      score[round - 1] += value;
    }
    setState(() {
      answer++;
      if (answer % 7 == 1) {
        round++;
        isQuestion = true;
        out = "Spørsmål " + question.toString();
      } else {
        out = "Riktig svar" + answer.toString();
      }
      if (answer > 21) {
        out = "Du er ferdig";
        done = true;
        for (int element in score) {
          total += element;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hei'),
      ),
      body: Container(
        child: Column(
          children: [
            !done
                ? Column(
                    children: [
                      Text(
                        'Round ' + round.toString(),
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(out),
                      Text(
                        _currentSliderValue.round().toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                      Slider(
                        value: _currentSliderValue,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                      /*
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ditt svar',
                hintText: _currentSliderValue.round().toString(),
              ),
              onChanged: (value) => _currentSliderValue = double.parse(value),
            ),*/
                      isQuestion
                          ? ElevatedButton(
                              onPressed: () {
                                addAnwer();
                              },
                              child: Text('Your answer'),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                setAnswer();
                              },
                              child: Text('Right answer'),
                            ),
                    ],
                  )
                : Score(score: total),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (score[0] > 0)
                  Column(
                    children: [Text('Round 1'), Text(score[0].toString())],
                  ),
                if (score[1] > 0)
                  Column(
                    children: [Text('Round 2'), Text(score[1].toString())],
                  ),
                if (score[2] > 0)
                  Column(
                    children: [Text('Round 3'), Text(score[2].toString())],
                  ),
              ],
            ),
            Container(
              height: 465,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(5),
                    elevation: 3,
                    child: ListTile(
                      title: Text("Question " +
                          (index + 1).toString() +
                          " You: " +
                          games[index].answer.toString() +
                          ". Right: " +
                          games[index].rightAnswer.toString() +
                          ".  Score: " +
                          games[index].score.toString()),
                    ),
                  );
                },
                itemCount: games.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
