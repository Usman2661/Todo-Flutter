
import 'dart:convert';

class Todo{
  
int id;
String title;
bool completed;
String catagory;
String username;

Todo({this.id, this.title, this.completed, this.catagory, this.username});


  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
        id: map["id"], title: map["title"], completed: map["completed"], catagory: map["catagory"], username: map["username"] );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "completed": completed, "catagory": catagory, "username": username};
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, completed: $completed, catagory: $catagory, userrname: $username }';
  }

}

List<Todo> todoFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Todo>.from(data.map((item) => Todo.fromJson(item)));
}

String todoToJson(Todo data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}