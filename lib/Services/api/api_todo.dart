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

  // Future<List<Todo>> createTodo(Todo data) async {
  //   // final response = await client.post(
  //   //   "$baseUrl",
  //   //   headers: {"content-type": "application/json"},
  //   //   body: todoToJson(data),
  //   // );
  //   // if (response.statusCode == 201) {
  //   //   return response.body;
  //   // } else {
  //   //   return false;
  //   // }

  //   try {
  //         Response response = await post("$baseUrl",
  //            headers: {"content-type": "application/json"},
  //             body: todoToJson(data),
  //         );

  //         return todoFromJson(response.body);
  //   }
  //   catch(error){
  //     return error;
  //   }
  // }

  // Future<bool> updateProfile(Profile data) async {
  //   final response = await client.put(
  //     "$baseUrl/api/profile/${data.id}",
  //     headers: {"content-type": "application/json"},
  //     body: profileToJson(data),
  //   );
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future<bool> deleteProfile(int id) async {
  //   final response = await client.delete(
  //     "$baseUrl/api/profile/$id",
  //     headers: {"content-type": "application/json"},
  //   );
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }


}