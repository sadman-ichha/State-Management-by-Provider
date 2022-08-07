// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/provider/todo_provider.dart';

class Home_Screen extends StatelessWidget {
  Home_Screen({Key? key}) : super(key: key);

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text("Add New Todo"),
                    content: Column(
                      children: [
                        TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            hintText: "title",
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            hintText: "description",
                          ),
                        ),
                        SizedBox(height: 10.0),
                        ElevatedButton(
                            onPressed: () {
                              final title = _titleController.text;
                              final description = _descriptionController.text;
                              todos.addNewTodo(title, description);
                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                  msg: "New Todo Added Successful");
                            },
                            child: Text("Added")),
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: todos.todoList.length,
            itemBuilder: (_, index) {
              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: ListTile(
                  title: Text(
                    todos.todoList[index].title,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(todos.todoList[index].description),
                  trailing: IconButton(
                    onPressed: () {
                      todos.todoList.removeAt(index);
                      Fluttertoast.showToast(msg: "Removed Todo");
                    },
                    icon: Icon(Icons.delete_outline),
                    color: Colors.redAccent,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
