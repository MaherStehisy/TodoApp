import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/model/NewTodoDialog.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  Widget _list() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return _item(element, posicion);
      },
    );
  }



  Widget _item(Todo element, int posicion) {
    return Dismissible(key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          todos.removeAt(posicion);
        });
      },
      background: Container(color: Colors.red,
        child: Align(
            alignment: Alignment.centerLeft,
            child:
            Text("Deleting",
                style: TextStyle(fontSize: 15, color: Colors.white)
            ),
        ),
      ),
      child: Container(
        padding: new EdgeInsets.all(7.0),
        height: 100,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: element.completed == 1 ? Colors.blueGrey : Colors.white70,
          child: Center(
            child: ListTile(
               leading: _itemIcon(element),
               title: Text(element.title, style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(element.body),
              isThreeLine: true,
              onTap: ()=>_onTap(context, element, posicion),
            ),
        ),
        ),
      ),
    );
  }

  Widget _itemIcon(Todo item){
    switch (item.tag) {
      case "Default"://TodoType.DEFAULT:
        return Icon(Icons.check, size: 45.0);
      case "Call": //TodoType.CALL:
        return Icon(Icons.call, size: 45.0);
      case "Homework"://TodoType.HOME_WORK:
        return Icon(Icons.contacts, size: 45.0);
      default:
        return Icon(Icons.dialpad, size: 45.0);
    }
  }

  void _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return NewTodoDialog();
      },
    );

    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }

  void _onTap(BuildContext context, Todo location, int posicion) {
    setState(() {
      if (todos[posicion].completed == 0) {
          todos[posicion].completed = 1;
        } else{
        todos[posicion].completed = 0;
      }
      }
    );
  }
}
