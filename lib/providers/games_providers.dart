import 'package:flutter/material.dart';
import 'package:flutter_mig_100/models/game.dart';
import 'package:flutter_mig_100/models/game_info_text.dart';
import 'package:flutter_mig_100/models/game_item.dart';
import 'package:uuid/uuid.dart';

class GamesProvider with ChangeNotifier {

  var uuid = Uuid();

  String _selectedGameId;
  double _slidervalue = 20;


  String get selectedGameId => _selectedGameId;
  GameInfoText get currentQuestion => _currentQuestion;
  double get slidervalue => _slidervalue;

  void setSelectedGameId(String value) {
    _selectedGameId = value;
  }

  GameInfoText _currentQuestion = new GameInfoText(round: 'Round', roundNumber: 1, question: 'Question', questionNumber: 1, answerNumber: 1, done: false);

  void slidervalues(double value) {
    _slidervalue = value;
  }

  List<Game> _games = [
    Game(
        id: '6c84fb90-12c4-11e1-840d-7b25c5ee775a',
        name: 'The best game',
        admin: '1',
        maxUsers: 5,
        participants: ['2', '4'],
        gameLine: [],
      done: false
    ),
    Game(
        id: '710b962e-041c-11e1-9234-0123456789ab',
        name: 'Game 2',
        admin: '4',
        maxUsers: 2,
        participants: ['3'],
        gameLine: [

        ],
      done: false,
    ),
    Game(
        id: '6c84fb90-12c4-11e1-840d-7b25c5ee775a',
        name: 'The Game Are Done',
        admin: '1',
        maxUsers: 5,
        participants: ['2', '4'],
        gameLine: [
          GameItem(id: 'asftgaw', questionNumber: 1, answer: 10, rightAnswer: 20,  userId: '1'),
          GameItem(id: 'afgtawsergt', questionNumber: 2, answer: 10, rightAnswer: 20,  userId: '1'),
          GameItem(id: 'sfgsaf', questionNumber: 3, answer: 10, rightAnswer: 20,  userId: '1'),
          GameItem(id: 'sdgh', questionNumber: 4, answer: 10, rightAnswer: 20,  userId: '1'),
          GameItem(id: 'edfghsd', questionNumber: 5, answer: 10, rightAnswer: 20,  userId: '1'),
          GameItem(id: 'edtghf', questionNumber: 6, answer: 10, rightAnswer: 20,  userId: '1'),
          GameItem(id: 'ethf', questionNumber: 7, answer: 10, rightAnswer: 20,  userId: '1'),
          GameItem(id: 'edfgh', questionNumber: 8, answer: 10, rightAnswer: 30,  userId: '1'),
          GameItem(id: 'dgfh', questionNumber: 9, answer: 10, rightAnswer: 30,  userId: '1'),
          GameItem(id: '1dzhgf', questionNumber: 10, answer: 10, rightAnswer: 30,  userId: '1'),
          GameItem(id: '1zdfgh2', questionNumber: 11, answer: 10, rightAnswer: 30,  userId: '1'),
          GameItem(id: '1df2', questionNumber: 12, answer: 10, rightAnswer: 30,  userId: '1'),
          GameItem(id: '1the2', questionNumber: 13, answer: 10, rightAnswer: 30,  userId: '1'),
          GameItem(id: '1dhf2', questionNumber: 14, answer: 10, rightAnswer: 30,  userId: '1'),
          GameItem(id: '1ehrt2', questionNumber: 15, answer: 10, rightAnswer: 40,  userId: '1'),
          GameItem(id: '1dfh2', questionNumber: 16, answer: 10, rightAnswer: 40,  userId: '1'),
          GameItem(id: '1ehrt2', questionNumber: 17, answer: 10, rightAnswer: 40,  userId: '1'),
          GameItem(id: '1dfh2', questionNumber: 18, answer: 10, rightAnswer: 40,  userId: '1'),
          GameItem(id: '1df2', questionNumber: 19, answer: 10, rightAnswer: 40,  userId: '1'),
          GameItem(id: '1df2', questionNumber: 20, answer: 10, rightAnswer: 40,  userId: '1'),
          GameItem(id: '1dfhr2', questionNumber: 21, answer: 10, rightAnswer: 40,  userId: '1'),

        ],
        done: true
    ),
  ];

  List<Game> get games {
    return [..._games];
  }
  List<Game> get gamesToPlay{
    return _games.where((element) => element.done == false).toList();
  }
  List<Game> gamesDone(String userId){
    return _games.where((element) => element.done == true && (element.admin == userId || element.participants.firstWhere((element) => element == userId) != null)).toList();
  }

  bool isGameFull(String gameId){
    Game _game = getGameById(gameId);
    if(_game.maxUsers - 1 > _game.participants.length){
      return true;
    }
    return false;
  }

  bool userIsParticipants (String gameId, String userId){
    Game _game = getGameById(gameId);
    return _game.participants.any((element) => element == userId);
  }

  bool checkIfAdmin(String gameId, String userId){
    Game _game = getGameById(gameId);
    if(_game.admin == userId){
      return true;
    }
    return false;
  }

  int gameCount (){
    return _games.length;
  }

  Game getGameById (String gameId){
    return _games.firstWhere((element) => element.id == gameId);
  }
  
  String createGame(String userId, String name, int maxUsers){
    var id = uuid.v4();

    Game gameToPlay = new Game(id: id, name: name, maxUsers: maxUsers, admin: userId,participants: [], gameLine: [], done: false);
    _games.add(gameToPlay);
    _selectedGameId = id;
    notifyListeners();
    return id;
  }
  void joinGame(String gameId, String userId){
    Game _game = getGameById(gameId);
    _game.participants.add(userId);
    notifyListeners();
  }
  void leaveGame(String gameId, String userId){
    Game _game = getGameById(gameId);
    _game.participants.removeWhere((element) => element == userId);
    notifyListeners();
  }
  List<GameItem> getScoreList(int type, String gameId, String userId){
    Game _game = getGameById(gameId);
    int start;
    int end;
    switch(type){
      case 1 : {
        start = 1;
        end = 7;
      }
      break;
      case 2 : {
        start = 8;
        end = 14;
      }
      break;
      case 3 : {
        start = 15;
        end = 21;
        print('Jeg er her');
      }
      break;
      default: {
        return _game.gameLine.where((element) =>
        element.userId == userId ).toList();
      }
    }
    return _game.gameLine.where((element) =>
      element.userId == userId &&
          element.questionNumber >= start &&
    element.questionNumber <= end).toList();
  }

  int getScore(int type, String gameId, String userId){
    int total = 0;
    for(GameItem gameItem in getScoreList(type ,gameId, userId)){
      if(gameItem.rightAnswer == gameItem.answer){
        total -= 10;
      }else{
        total += (gameItem.answer - gameItem.rightAnswer.toInt()).abs();
      }
    }
    return total;
  }



  bool nextQuestion(String userId){
    if(_currentQuestion.questionNumber < 21){
      Game game = getGameById(_selectedGameId);
      game.gameLine.add(GameItem(id: uuid.v4(), answer: _slidervalue.toInt(), rightAnswer: 10, questionNumber: _currentQuestion.questionNumber, userId: userId ));
      _currentQuestion.questionNumber++;
    }else{
      if(_currentQuestion.questionNumber == 21){
        Game game = getGameById(_selectedGameId);
        game.gameLine.add(GameItem(id: uuid.v4(), answer: _slidervalue.toInt(), rightAnswer: 10, questionNumber: _currentQuestion.questionNumber, userId: userId ));
      }
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
  GameItem getGameItemById(String userId){
    Game game = getGameById(_selectedGameId);
    GameItem gameItem = game.gameLine.firstWhere((element) => element.questionNumber == _currentQuestion.answerNumber && element.userId == userId);
    return gameItem;
  }
  bool nextAnswer(String userId){
    if(_currentQuestion.answerNumber < 21){
      GameItem gameItem = getGameItemById(userId);
      gameItem.rightAnswer = _slidervalue.toInt();
      _currentQuestion.answerNumber++;
      notifyListeners();
    }else{
      if(_currentQuestion.answerNumber == 21){
        GameItem gameItem = getGameItemById(userId);
        gameItem.rightAnswer = _slidervalue.toInt();
        _currentQuestion.roundNumber++;
        notifyListeners();
      }
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
  void done (){
    Game game = getGameById(_selectedGameId);
    game.done = true;
  }

  void restart(){
    _currentQuestion = new GameInfoText(round: 'Round', roundNumber: 1, question: 'Question', questionNumber: 1, answerNumber: 1, done: false);
    notifyListeners();
  }

}