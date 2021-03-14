import 'package:flutter/material.dart';
import 'package:todo_ptn_tech_talks/models/todo.dart';
import 'package:todo_ptn_tech_talks/widgets/app_bar/my_app_bar.dart';

class DetailsTodoScreen extends StatelessWidget {
  final Todo todo;

  const DetailsTodoScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(todo);
    return Scaffold(
      appBar: MyAppBar(
        title: Text(todo.title),
      ),
      body: Column(
        children: [
          Text(todo.title),
          Text(todo.time),
          Text(todo.description),
          ElevatedButton(
            child: Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
