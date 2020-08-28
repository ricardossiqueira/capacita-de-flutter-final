import 'package:flutter/material.dart';
import 'package:todos/src/models/todo.dart';

class CompletedTodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Todo> _completedTodos =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Completed Todos"),
      ),
      body: Center(
        child: _completedTodos.isNotEmpty
            ? ListView.builder(
                itemCount: _completedTodos.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('${_completedTodos[index].id}'),
                  ),
                  title: Text("${_completedTodos[index].title}"),
                  subtitle:
                      Text("${_completedTodos[index].body ?? 'Sem descrição'}"),
                ),
              )
            : Center(
                child: Text('E no começo havia nada...'),
              ),
      ),
    );
  }
}
