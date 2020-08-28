import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todos/src/models/todo.dart';

class TodoInfoScreen extends StatelessWidget {
  final Todo todo;

  TodoInfoScreen(this.todo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes da Todo")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "${todo.id} - ${todo.title}",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Text("Data de criação: "),
                      Text("${DateFormat("dd/MM/yyyy").format(todo.createdAt)}")
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Center(
            child: Text("${todo.body}"),
          ),
        ],
      ),
    );
  }
}
