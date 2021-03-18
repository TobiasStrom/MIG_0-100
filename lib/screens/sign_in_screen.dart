import 'package:flutter/material.dart';
import 'package:flutter_mig_100/screens/log_in_screen.dart';
import 'package:provider/provider.dart';
import '../providers/users_providers.dart';
import 'package:flutter_mig_100/screens/game_list_screen.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/sign-in';
  @override
  Widget build(BuildContext context) {
    String userName;
    String firstName;
    String lastName;
    String password;
    final userData = Provider.of<UsersProviders>(context);
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(
                height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
              ),
              Text('Sign in'),
              TextField(
                decoration: InputDecoration(hintText: 'Username'),
                onChanged: (value) => userName = value,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Firstname'),
                onChanged: (value) => firstName = value,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Lastname'),
                onChanged: (value) => lastName = value,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                onChanged: (value) => password = value,
                obscureText: true,
              ),
              ElevatedButton(
                  onPressed: () {
                    userData.createUser(
                        userName, firstName, lastName, password);
                    Navigator.pushReplacementNamed(
                        context, GameListScreen.routeName);
                  },
                  child: Text('Sign in')),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Already have a users'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, LogInScreen.routeName);
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
