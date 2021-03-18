/*
import 'package:flutter/material.dart';
import 'package:flutter_mig_100/models/game.dart';
import 'package:flutter_mig_100/models/game_info_text.dart';
import 'package:flutter_mig_100/models/game_item.dart';
import 'package:flutter_mig_100/widgets/game_info.dart';


class GameProvider  with ChangeNotifier{
  List<Game> _games = [];

  String _selectedGameId;

  String get selectedGameId => _selectedGameId;

  GameInfoText _currentQuestion = new GameInfoText(round: 'Round', roundNumber: 1, question: 'Question', questionNumber: 1, answerNumber: 1, done: false);

  GameInfoText get currentQuestion => _currentQuestion;

  bool nextQuestion(){
    if(_currentQuestion.questionNumber <= 21){
      _currentQuestion.questionNumber++;
    }else{
      return false;
    }

    if(_currentQuestion.questionNumber % 7== 1){
      _currentQuestion.question = "Answer";
      notifyListeners();
      return false;
    }
    notifyListeners();
    return true;

  }
  bool nextAnswer(){
    if(_currentQuestion.answerNumber <= 21){
      _currentQuestion.answerNumber++;
    }else{
      _currentQuestion.done = true;
      notifyListeners();
      return false;
    }
    if(_currentQuestion.answerNumber % 7== 1){
      _currentQuestion.roundNumber++;
      _currentQuestion.question = "Question";
      notifyListeners();
      return false;
    }
    notifyListeners();
    return true;

  }

  void restart(){
    _currentQuestion = new GameInfoText(round: 'Round', roundNumber: 1, question: 'Question', questionNumber: 1, answerNumber: 1, done: false);
    notifyListeners();
  }




}

 */