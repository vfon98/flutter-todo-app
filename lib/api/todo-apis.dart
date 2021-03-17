import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:todo_ptn_tech_talks/models/todo.dart';

class TodoAPI {
  final String baseURL = '5cd831770cc5100014f1e40b.mockapi.io';

  Future<List<Todo>> getAllTodos() async {
    final response = await http.get(Uri.https(baseURL, 'todo-flutter'));
    if (response.statusCode == 200) {
      var todosJson = jsonDecode(response.body);
      return (todosJson as List)
          .map((todo) => new Todo.fromJson(todo))
          .toList();
    } else {
      throw Exception('Failed to load Todos');
    }
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
