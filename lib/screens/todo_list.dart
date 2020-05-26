//-----------------------------------------------------------
// Mobile Application Programming (SCSJ3623)
// Semester 2, 2019/2020
// Exercise 3: HTTP and JSON
//
// Name 1:  Miraj Ahmed
//-----------------------------------------------------------

// TODO 1 - Toggle the status of the todo  when the user is pressing on the ListTile. This operation also updates the data on the server
// TODO 2 - Remove the todo  when the user is long-pressing on the ListTile. This operation also deletes the data from the server
// TODO 3 - Add a new todo  to the server when the user is pressing on the plus (+) button. The id for the newly created todo is given by the server

import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../services/data_service.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  Future<List<Todo>> _todo;

  List<Todo> list;
  @override
  void initState() {
    super.initState();
    _todo = dataService.getTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
      future: _todo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          list = snapshot.data;
          return buildHome();
        }
        return _buildFetchData();
      },
    );
  }

  Scaffold _buildFetchData() {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(height: 50),
          Text('Fetching Data in progress'),
        ],
      ),
    ));
  }

  Scaffold buildHome() {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Todo List'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final Todo _todo = list[index];
            return ListTile(
              title: Text(
                _todo.title,
                style: TextStyle(
                    decoration: _todo.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              subtitle: Text('id:${_todo.id}'),
              onTap: () {
                dataService.updateTodoStatus(
                    id: _todo.id, status: !_todo.completed);
                reload();
              },
              onLongPress: () {
                dataService.deleteTodo(id: _todo.id);
                reload();
              },
            );
          },
          separatorBuilder: null,
          itemCount: null),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Todo todo = Todo(
              title: 'New Task',
              completed: false,
              id: list[list.length - 1].id + 1);

          dataService.createTodo(todo: todo);
          reload();
        },
      ),
    );
  }

  void reload() {
    setState(() {
      _todo = dataService.getTodoList();
    });
  }
}
