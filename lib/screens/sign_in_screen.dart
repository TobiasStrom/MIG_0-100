import 'package:flutter/material.dart';
import 'package:flutter_mig_100/screens/game_list_screen.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/sign-in';
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
                  height: (mediaQuery.size.height- mediaQuery.padding.top)* 0.2,
                ),
                Text('Sign in'),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Username'
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Firstname'
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Lastname'
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Password',
                  ),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, GameListScreen.routeName);
                }, child: Text('Sign in')),
                SizedBox(height: 20,),
              ],
            ),
          ),
      ),
    );
  }
}
