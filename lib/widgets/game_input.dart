import 'package:flutter/material.dart';
import 'package:flutter_mig_100/providers/games_providers.dart';
import 'package:provider/provider.dart';

class GameInput extends StatefulWidget {
  @override
  _GameInputState createState() => _GameInputState();
}

class _GameInputState extends State<GameInput> {

  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    var gamesData = Provider.of<GamesProvider>(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(child: Text('-1', style: TextStyle(fontSize: 50),), onPressed: (){
                setState(() {
                  if(_currentSliderValue > 0)
                  _currentSliderValue--;
                });
              }),

              Text(
                _currentSliderValue.toInt().toString(),
                style: TextStyle(fontSize: 100),
              ),

              TextButton(child: Text('+1', style: TextStyle(fontSize: 50),), onPressed: (){
                setState(() {
                  if(_currentSliderValue < 100){
                    _currentSliderValue++;
                  }

                });

              },),
            ],
          ),
        ),
        Slider(
          value: _currentSliderValue,
          min: 0,
          max: 100,
          divisions: 100,
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
              gamesData.slidervalues(value);

            });
          },
        ),
      ],
    );
  }
}
