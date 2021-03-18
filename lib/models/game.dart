import 'package:flutter/foundation.dart';
import 'package:flutter_mig_100/models/game_item.dart';

class Game with ChangeNotifier{
  final String id;
  final String name;
  final String admin;
  final int maxUsers;
  final List<String> participants;
  final List<GameItem> gameLine;
  bool done;


  Game({this.id, this.name, this.admin, this.maxUsers,this.participants, this.gameLine, this.done});
}