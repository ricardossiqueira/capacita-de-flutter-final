import 'package:flutter/material.dart';
import 'package:todos/src/screens/add_todo.dart';
import 'package:todos/src/screens/completed_todos.dart';
import 'package:todos/src/utils/routes.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                // 0xFF = #
                color: Color(0xFF333333),
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.ADD_TODO,
      routes: {
        AppRoutes.ADD_TODO: (ctx) => AddTodoScreen(),
        AppRoutes.COMPLETED_TODOS: (ctx) => CompletedTodosScreen(),
      },
    );
  }
}
