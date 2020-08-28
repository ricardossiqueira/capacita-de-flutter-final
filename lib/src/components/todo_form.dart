import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  final void Function(String, String, DateTime) onSubmit;

  TodoForm({@required this.onSubmit});

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  void _submitForm() {
    if (_titleController.text.isEmpty | _bodyController.text.isEmpty) {
      return;
    }

    widget.onSubmit(
      _titleController.text,
      _bodyController.text,
      DateTime.now(),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Form(
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: "Titulo",
                ),
              ),
              TextFormField(
                controller: _bodyController,
                decoration: InputDecoration(
                  labelText: "Descrição",
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.centerRight,
          child: FlatButton(
            child: Text("Adicionar"),
            onPressed: _submitForm,
          ),
        ),
      ],
    );
  }
}
