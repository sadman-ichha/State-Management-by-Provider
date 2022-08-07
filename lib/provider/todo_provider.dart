import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todoList = [];

  void addNewTodo(title, description) {
    var newtodo = Todo(title: title, description: description);
    todoList.add(newtodo);
    notifyListeners();
  }

  void removeTodo(index) {
    todoList.removeAt(index);
    notifyListeners();
  }
}
