import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/model/NewTodoDropdown.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}
class _NewTodoDialogState extends State<NewTodoDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  String _dropSelected = "Default";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'New todo',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
      ),

      content: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Tittle',),
          controller: controllerTitle,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Body',),
          controller: controllerBody,
        ),
        Center(
          child: NewTodoDropdown(
            selected: _dropSelected,
            onChangedValue: (value) => setState(() {
              _dropSelected = value;
            }),
          ),
        ),
      ]
      ),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        new FlatButton(
          child: new Text("Close"),
          onPressed: () => Navigator.pop(context),
        ),
        new FlatButton(
          child: new Text("Add"),
          onPressed: () {
            final todo = new Todo(
                title: controllerTitle.value.text,
                body: controllerBody.value.text,
                completed: 0,
                tag: _dropSelected);
                controllerTitle.clear();
                controllerBody.clear();

            Navigator.of(context).pop(todo);
          },
        ),
      ],
    );
  }

}
