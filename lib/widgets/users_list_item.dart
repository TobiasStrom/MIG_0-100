import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          child: Text(
              'Fabian'
          ),
        ),
      ),
    );
  }
}
