import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_ptn_tech_talks/screens/details_todo.dart';
import 'package:todo_ptn_tech_talks/screens/new_todo_form.dart';
import 'package:todo_ptn_tech_talks/widgets/app_bar/my_app_bar.dart';

import 'models/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Flutter Todo App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: Text('Flutter Todo List'),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 50,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'Add new todo',
          onPressed: () async {
            final newTodo = await Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => NewTodoFormScreen()));
            print('===== CLOSED ===');
            inspect(newTodo);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: TodoCard(),
        ));
  }
}

class TodoCard extends StatelessWidget {
  TodoCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              color: Colors.orangeAccent,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              child: Text(
                "Card Test",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              )),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Enter Title...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                  color: Colors.redAccent,
                )
              ],
            ),
          ),
          Expanded(
            child: TodoList(),
          )
        ],
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  TodoList({Key key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var data = ['Flutter Introduction', 'Flutter Setup', 'Initialize Code'];

  final List<Todo> todos = [
    Todo('1', 'Flutter Introduction', '8:00 PM', 'Introduction Flutter'),
    Todo('2', 'Flutter Setup', '8:30 PM', 'Introduction Flutter'),
    Todo('3', 'Flutter Init', '8:45 PM', 'Introduction Flutter'),
    Todo('3', 'Flutter Demo', '10:00 PM', 'Introduction Flutter'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        final Todo todo = todos[index];

        return ListTile(
          key: Key(todo.id),
          title: Text(
            todo.title,
            style: TextStyle(fontSize: 20),
          ),
          contentPadding: EdgeInsets.all(8),
          subtitle: Text(todo.description),
          leading: FlutterLogo(
            size: 36,
          ),
          // leading:
          //     Text('8:15 PM', style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.arrow_right_sharp),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => DetailsTodoScreen(todo: todo)));
          },
        );
      },
    );
  }
}
