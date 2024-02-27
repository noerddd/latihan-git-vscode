import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodolistState createState() => _TodolistState();
}

class _TodolistState extends State<TodoList> {
  List<String> tasks = [];
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.red,
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, int index) {
            return ListTile(
              title: Text(
                tasks[index],
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTask();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void addTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('add a task'),
              content: TextField(
                  controller: _taskController,
                  onChanged: (value) => {},
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  )),
              actions: <Widget>[
                TextButton(
                  child: Text('Add'),
                  onPressed: () {
                    setState(() {
                      if (_taskController.text.isNotEmpty) {
                        tasks.add(_taskController.text);
                        _taskController.clear();
                      }
                    });
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    _taskController.clear();
                    Navigator.of(context).pop();
                  },
                )
              ]);
        });
  }
}
