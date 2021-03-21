import 'package:flutter/material.dart';

class GameInput extends StatefulWidget {
  @override
  _GameInputState createState() => _GameInputState();
}

class _GameInputState extends State<GameInput> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _currentSliderValue.round().toString(),
          style: TextStyle(fontSize: 100),
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
      ],
    );
  }
}
