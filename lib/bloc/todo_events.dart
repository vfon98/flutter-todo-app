import 'package:todo_ptn_tech_talks/models/todo.dart';

abstract class TodoEvent {}

class GetAllTodos extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  AddTodoEvent(this.body);

  final Todo body;
}

class DeleteTodoEvent extends TodoEvent {
  DeleteTodoEvent(this.todoId);

  final String todoId;
}
