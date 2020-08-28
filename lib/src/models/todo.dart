import 'package:flutter/foundation.dart';

class Todo {
  int id;
  String title;
  String body;
  bool done;
  DateTime createdAt;
  DateTime closedAt;

  Todo({
    @required this.id,
    @required this.title,
    @required this.createdAt,
    this.body,
    this.closedAt,
    this.done = false,
  });
}
