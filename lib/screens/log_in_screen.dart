import 'package:flutter/material.dart';
import 'package:flutter_mig_100/screens/sign_in_screen.dart';

import 'game_list_screen.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Text('Login'),
              TextField(
                decoration: InputDecoration(hintText: 'Username'),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, GameListScreen.routeName),
                child: Text('Login'),
              ),
              Row(
                children: [
                  Text('Don\'t have a user'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                      child: Text('Sign in'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
