import 'dart:async';
import 'dart:developer';

import 'package:todo_ptn_tech_talks/api/todo-apis.dart';
import 'package:todo_ptn_tech_talks/bloc/todo_events.dart';
import 'package:todo_ptn_tech_talks/bloc/toto_state.dart';
import 'package:todo_ptn_tech_talks/models/todo.dart';

class TodoBloc {
  TodoState todoList = TodoState([]);

  final eventController =
      StreamController<TodoEvent>.broadcast(); // Handle event

  final stateController =
      StreamController<TodoState>.broadcast(); // Handle state

  TodoBloc() {
    eventController.stream.listen((TodoEvent event) async {
      if (event is GetAllTodos) {
        final todos = await TodoAPI.getAllTodos();
        todoList = TodoState(todos);
      } else if (event is AddTodoEvent) {
        await TodoAPI.postTodo(event.body);
        final todos = await TodoAPI.getAllTodos();
        todoList = TodoState(todos);
      } else if (event is DeleteTodoEvent) {
        await TodoAPI.deleteTodo(event.todoId);
        final todos = await TodoAPI.getAllTodos();
        todoList = TodoState(todos);
      }

      print("-==== SINKING =====");
      inspect(todoList);
      stateController.sink.add(TodoState(todoList.todoList));
    });
  }

  void dispose() {
    eventController.close();
    stateController.close();
  }
}
