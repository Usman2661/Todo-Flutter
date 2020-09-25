import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/Services/api/api_todo.dart';
import 'package:todo/Services/models/catagoryCount.dart';
import 'package:todo/Services/models/todo.dart';
import 'package:todo/Widgets/CatagoryList.dart';
import 'package:todo/Widgets/Navigation.dart';
import 'package:todo/Widgets/TodoList.dart';
import 'package:todo/screens/createTodo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TodoApiService todoApi = TodoApiService();
  List<Todo> todos;
  String username = '';
  List<CatagoryCount> catagoryCount = [];

  Future loadTodos() async{
    List<Todo> todos =  await todoApi.getTodos();

      setState(() {
        this.todos = todos;
      });

      if (todos.length > 0){

        Todo firstTodo = todos.first;
        if(firstTodo.username != null){
                 setState(() {
                 this.username = firstTodo.username;
               });
        }
      }
      if (todos.length == 0){

        setState(() {
              this.username = '';
        });
  
      }

    List<Todo> catagory =  await todoApi.getUserCatagories(this.username);
    
    //Inserting all catagories into a list
    List<String> catagories = [];
    catagory.forEach((catagory){
      catagories.add(catagory.catagory);
    });

    List<CatagoryCount> catagoryCount = [];

    var catagoryCountMap = Map();


   catagories.forEach((element) {
    if(!catagoryCountMap.containsKey(element)) {
      catagoryCountMap[element] = 1;
    } else {
      catagoryCountMap[element] +=1;
    }
  });


   catagoryCountMap.forEach((key,value) {

      catagoryCount.add( CatagoryCount(
        catagory: key,
        count: value
      ));

     }); 

      setState(() {
              this.catagoryCount = catagoryCount;
        });

    return todos;
  }

  onUpdateTodoCallBack() async{
    await loadTodos();
  }

  @override
  void initState() {
    super.initState();
    loadTodos();
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
           Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => CreateTodo(username: username)),
          ).then((_) {

          Timer(Duration(seconds: 1), () {
               loadTodos();
          });

        });
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
          Text( 'Whats up ${username}',
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
            SizedBox(height: 10.0),
            // CatagoryList(),
            Expanded(flex: 1, child:CatagoryList(this.catagoryCount)),
            SizedBox(height:30.0),
            Text( 'My Tasks',
            style: TextStyle(
            color:Colors.grey[500],
            fontSize: 16.0,
            fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height:20.0),

             Expanded(flex:4 ,child:
                todos.length > 0? TodoList(todos, onUpdateTodoCallBack):
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