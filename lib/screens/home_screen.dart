import 'package:flutter/material.dart';
import 'package:todo_ptn_tech_talks/api/todo-apis.dart';
import 'package:todo_ptn_tech_talks/models/todo.dart';
import 'package:todo_ptn_tech_talks/widgets/app_bar/my_app_bar.dart';

import 'details_todo.dart';
import 'new_todo_form.dart';

GlobalKey<_TodoListState> _todoListKey = GlobalKey();

class HomeScreen extends StatelessWidget {
  final String title = 'Flutter Todo App';

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
            await Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => NewTodoFormScreen()));

            _todoListKey.currentState.fetchTodos();
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
          TodoList(key: _todoListKey)
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
  List<Todo> todos = [
    // Todo('1', 'Flutter Introduction', '8:00 PM', 'Introduction Flutter'),
    // Todo('2', 'Flutter Setup', '8:30 PM', 'Introduction Flutter'),
    // Todo('3', 'Flutter Init', '8:45 PM', 'Introduction Flutter'),
    // Todo('3', 'Flutter Dem', '10:00 PM', 'Introduction Flutter'),
  ];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    this.fetchTodos();
  }

  void fetchTodos() {
    setState(() => isLoading = true);
    TodoAPI.getAllTodos().then((value) {
      setState(() {
        todos = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return CircularProgressIndicator();

    return Expanded(
      child: ListView.builder(
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
            trailing: Icon(Icons.arrow_right_sharp),
            onTap: () async {
              final response = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => DetailsTodoScreen(todo: todo)));
              if (response != null) _todoListKey.currentState.fetchTodos();
            },
          );
        },
      ),
    );
  }
}
