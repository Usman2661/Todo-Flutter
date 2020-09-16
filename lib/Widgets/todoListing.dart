import 'package:flutter/material.dart';
import 'package:todo/Services/models/todo.dart';
class TodoListing extends StatelessWidget {

  final List<Todo> todos;
  TodoListing({Key key, this.todos}) : super(key: key);


  @override
  Widget build(BuildContext context) {
      return
            ListView.builder(
                itemCount: todos == null ? 0 : todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return
                    Card(
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => DetailWidget(cases[index])),
                            // );
                          },
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: Text(todos[index].title),
                            subtitle: Text(todos[index].completed.toString()),
                          ),
                        )
                    );
                });
  }
}