import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NewTodoDropdown extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChangedValue;

  NewTodoDropdown({this.selected, this.onChangedValue});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: this.selected,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(
          color: Colors.deepPurple
      ),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: onChangedValue,
      items: <String>['Default', 'Call', 'Homework']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
          .toList(),
    );
  }
}