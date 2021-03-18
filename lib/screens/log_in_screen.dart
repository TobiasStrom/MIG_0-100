import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/users_providers.dart';
import 'package:flutter_mig_100/screens/sign_in_screen.dart';

import 'game_list_screen.dart';

class LogInScreen extends StatelessWidget {
  static final routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UsersProviders>(context);
    final mediaQuery = MediaQuery.of(context);
    String userName;
    String password;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(
                height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
              ),
              Text('Login'),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
                onChanged: (value) => userName = value,

              ),
              TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  obscureText: true,
                  onChanged: (value) => password = value),
              ElevatedButton(
                  onPressed: () {
                    if (userData.logIn(userName, password) != -1) {
                      Navigator.pushReplacementNamed(
                          context, GameListScreen.routeName);
                    }
                  },
                  child: Text('Login')),
              Row(
                children: [
                  Text('Don\'t have a user'),
                  TextButton(
                    onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, SignInScreen.routeName);

                    },
                    child: Text('Sign in'),
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
