import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todos/src/components/todo_form.dart';
import 'package:todos/src/models/todo.dart';
import 'package:todos/src/screens/todo_info.dart';
import 'package:todos/src/utils/routes.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  List<Todo> _todos = [];
  List<Todo> _completedTodos = [];

  void _openTodoFormModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          child: TodoForm(
            onSubmit: (title, body, createdAt) {
              setState(() {
                _todos = [
                  ..._todos,
                  Todo(
                    id: _todos.length + 1,
                    title: title,
                    body: body,
                    createdAt: createdAt,
                  ),
                ];
              });
            },
          ),
        );
      },
    );
  }

  void _openDeleteConfirmationModal(BuildContext contex, int index) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Realmente deseja deletar essa Todo?",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              FlatButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    Text(
                      "Deletar",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                onPressed: () => _handleDeleteTodo(index),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleFinshTodo(int index) {
    Todo completedTodo = _todos[index];
    completedTodo.done = true;
    setState(() {
      _todos.removeAt(index);
      _completedTodos = [..._completedTodos, completedTodo];
    });
  }

  void _handleDeleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
    Navigator.pop(context);
  }

  void _navigateCompletedTodosScreen() {
    Navigator.pushNamed(
      context,
      AppRoutes.COMPLETED_TODOS,
      arguments: _completedTodos,
    );
  }

  void _navigateTodoInfoScreen(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoInfoScreen(_todos[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
        actions: [
          IconButton(
            icon: Icon(Icons.playlist_add_check),
            onPressed: _navigateCompletedTodosScreen,
          ),
        ],
      ),
      body: _todos.isNotEmpty
          ? ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Text(
                    '${_todos[index].id}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                title: Text("${_todos[index].title}"),
                subtitle: Text("${_todos[index].body ?? 'Sem descrição'}"),
                trailing: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () => _handleFinshTodo(index),
                ),
                onLongPress: () => _openDeleteConfirmationModal(context, index),
                onTap: () => _navigateTodoInfoScreen(index),
              ),
            )
          : Center(
              child: Text('E no começo havia nada...'),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTodoFormModal(context),
      ),
    );
  }
}
