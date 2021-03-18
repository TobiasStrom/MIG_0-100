import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../models/user.dart';

class UsersProviders with ChangeNotifier {

  var uuid = Uuid();

  String _selectedUserId;


  String get selectedUserId => _selectedUserId;

  void logOut(){
    _selectedUserId = "1";
  }

  List<User> _users = [
    User('1', 'tStrom', 'Tobias', 'Strøm', '12345'),
    User('2', 'One', 'Per', 'Arne', '1'),
    User('3', 'Two', 'Gunnar', 'Gundersen', '2'),
    User('4', 'The One', 'Nina', 'Ninasen', '12345'),
  ];



  User findUserById(String id) {
    return _users.firstWhere((element) => element.id == id);
  }

  void createUser(
      String username, String firstName, String lastName, String password) {
    String id = uuid.v4();
    User user = new User(id, username, firstName, lastName, password);
    _users.add(user);
    _selectedUserId = id;
    print(user.userName);
  }

  String logIn(String username, String password) {
    for (User user in _users) {
      if (user.userName == username && user.password == password) {
        return _selectedUserId = user.id;
      }
    }
    return _selectedUserId = "";
  }
}
