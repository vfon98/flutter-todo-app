import 'dart:convert';
import 'dart:developer';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:todo_ptn_tech_talks/models/todo.dart';

class TodoAPI {
  final String baseURL = '5cd831770cc5100014f1e40b.mockapi.io';

  // GET
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

  // GET {id}
  Future<Todo> getTodoById(String id) async {
    final response = await http.get(Uri.https(baseURL, 'todo-flutter/$id'));
    inspect(response);
  }

  // POST
  Future<Todo> postTodo(Todo todo) async {
    final response = await http.post(Uri.https(baseURL, 'todo-flutter'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "title": todo.title,
          "description": todo.description,
          "time": todo.time,
        }));
    if (response.statusCode == 201) {
      var todoJson = jsonDecode(response.body);
      return Todo.fromJson(todoJson);
    } else {
      throw Exception('Failed to save Todo');
    }
  }

  // DELETE
  Future deleteTodo(String id) async {
    final response = await http.delete(Uri.https(baseURL, 'todo-flutter/$id'));
    inspect(response);
  }
}
