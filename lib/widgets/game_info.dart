import 'package:flutter/material.dart';

class GameInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Round 1',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Text(
          'Question 1',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ],
    );
  }
}
