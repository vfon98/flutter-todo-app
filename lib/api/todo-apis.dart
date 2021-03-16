import 'dart:developer';

import 'package:todo_ptn_tech_talks/models/todo.dart';

import 'package:http/http.dart' as http;

class TodoAPI {
  final String baseURL = '5cd831770cc5100014f1e40b.mockapi.io';

  Future<Todo> getAllTodos() async {
    final response = await http.get(Uri.https(baseURL, 'todo-flutter'));
    inspect(response);
  }

  Future<Todo> getTodoById({String id}) async {
    final response = await http.get(Uri.https(baseURL, 'todo-flutter/$id'));
    inspect(response);
  }

  Future<Todo> addToto({Todo tod}) async {
    final response = await http.post(Uri.https(baseURL, 'todo-flutter'));
    inspect(response);
  }

  Future deleteTodo({String id}) async {
    final response = await http.delete(Uri.https(baseURL, 'todo-flutter/$id'));
    inspect(response);
  }
}
