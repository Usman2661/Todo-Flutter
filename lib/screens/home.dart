import 'package:flutter/material.dart';
import 'package:todo/Services/api/api_todo.dart';
import 'package:todo/Services/models/todo.dart';
import 'package:todo/Widgets/CatagoryList.dart';
import 'package:todo/Widgets/Navigation.dart';
import 'package:todo/Widgets/TodoList.dart';
import 'package:todo/Widgets/todoListing.dart';
import 'package:todo/screens/createTodo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TodoApiService todoApi = TodoApiService();
  List<Todo> todos;


  Future loadList() {
    Future<List<Todo>> todos = todoApi.getTodos();
    todos.then((todos) {
      setState(() {
        this.todos = todos;
      });
    });
    return todos;
  }
  

  
  @override
  void initState() {
    super.initState();
    loadList();
  }

  @override
  Widget build(BuildContext context) {

    if(todos == null) {
      todos = List<Todo>();
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  Navigator.push(
          //  context,
          //  MaterialPageRoute(builder: (context) => CreateTodo()),
          // );
          loadList();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[900],
        elevation: 20.0,
      ),
      appBar: AppBar(backgroundColor: Colors.grey[50],
      title: Text(''),
      centerTitle: true,
      elevation: 0.0,
      iconTheme: new IconThemeData(color: Colors.grey[700]),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
      ],
      ),
      drawer: Navigation(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(25.0,0.0,25.0,0.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Text( 'Whats up, Usman',
          style: TextStyle(
            color:Colors.grey[800],
            fontSize: 28.0,
            fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 20.0),
           Text( 'CATAGORIES',
            style: TextStyle(
            color:Colors.grey[500],
            fontSize: 16.0,
            fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 20.0),
            CatagoryList(),
            SizedBox(height:40.0),
            Text( 'My Tasks',
            style: TextStyle(
            color:Colors.grey[500],
            fontSize: 16.0,
            fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height:20.0),


             Expanded(child:
                todos.length > 0? TodoList(todos: todos):
                new Center(child:
                new Text('No Todos Found', style: Theme.of(context).textTheme.title)),
          )

          //   Expanded(child: 
          //   new Center(
          //   child: new FutureBuilder(
          //     future: loadList(),
          //     builder: (context, snapshot) {
          //       return todos.length > 0? new TodoList(todos: todos):
          //       new Center(child:
          //       new Text('No data found, tap plus button to add!', style: Theme.of(context).textTheme.title));
          //     },
          //   )
          // ),
          //   ),
            
          ],
          )
            
          ),
      ),
    );
  }
}