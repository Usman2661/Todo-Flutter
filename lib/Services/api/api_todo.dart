import 'dart:convert';

import 'package:http/http.dart';
import 'package:todo/Services/models/todo.dart';

class TodoApiService {
  final String baseUrl = "http://192.168.1.15:8080/todos";
  // Client client = Client();

 Future<List<Todo>> getTodos() async {
   
    Response res = await get(baseUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Todo> todos = body.map((dynamic item) => Todo.fromJson(item)).toList();
      return todos;
    } else {
      throw "Failed to load todo list";
    }
  }

Future<Todo> createTodo(Todo todo ) async {
    Map data = {
      'title': todo.title,
      'completed': todo.completed,
      'catagory': todo.catagory,
      'username': todo.username
    };

    final Response response = await post(
      baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Create Task');
    }
  }

  Future<Todo> updateTodo(int id, Todo todo) async {
    Map data = {
     'title': todo.title,
     'completed': todo.completed,
     'catagory': todo.catagory,
     'username': todo.username
    };

    final Response response = await put(
      '$baseUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update task');
    }
  }

  Future<void> deleteTodo(int id) async {
    Response res = await delete('$baseUrl/$id');

    if (res.statusCode == 200) {
      print("Case deleted");
    } else {
      throw "Failed to delete a case.";
    }

  }
}