import 'dart:convert';

import 'package:http/http.dart';
import 'package:todo/Services/models/todo.dart';

class TodoApiService {
  final String baseUrl = "http://192.168.1.15:8080/todos";
  // Client client = Client();

 Future<List<Todo>> getTodos() async {

   try{
    Response res = await get(baseUrl);
    List<dynamic> body = jsonDecode(res.body);
    List<Todo> todos = body.map((dynamic item) => Todo.fromJson(item)).toList();
    return todos;
   }
   catch (e){
      throw "Failed to load todo list $e";
   }
   
  }

Future<Todo> createTodo(Todo todo ) async {

    Map data = {
      'title': todo.title,
      'completed': todo.completed,
      'catagory': todo.catagory,
      'username': todo.username
    };

    try{

      final Response response = await post(
      baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
      return Todo.fromJson(json.decode(response.body));
    }
    catch(e){
      throw Exception('Failed to Create Task $e');

    }
   
  }

  Future<Todo> updateTodo(int id, Todo todo) async {
    Map data = {
     'title': todo.title,
     'completed': todo.completed,
     'catagory': todo.catagory,
     'username': todo.username
    };

    try{

    final Response response = await put(
      '$baseUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
      
    return Todo.fromJson(json.decode(response.body));

    }
    catch(e){
      throw Exception('Failed to update task $e');
    } 
  }

  Future<void> deleteTodo(int id) async {

    try{
      
        Response res = await delete('$baseUrl/$id');
        print("Todo deleted");
    }
    catch(e){
      throw 'Failed to delete a task $e';
    }
  }
}